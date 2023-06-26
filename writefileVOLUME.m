function writefileVOLUME()
fid = fopen('input_location.txt','r');
loca=fscanf(fid,'%f');
fclose(fid);
fid = fopen('scale.txt','r');
scale=fscanf(fid,'%f');
fclose(fid);
%读沿井孔渗
poro=xlsread("por.xlsx");
perm=xlsread("perm.xlsx");
%输入工程参数(国际单位制)
Qi=1.8;
%T=80.56;
Hf=26;
nf=40;%(裂缝数目)
%计算水力裂缝参数
propfracheight=Hf*0.7;
unpropfracperm=1;
for i=1:nf
    fraclength(i)=min(0.1781*Qi*((scale(i))^0.5)/(3.1415*Hf*0.0012*(poro(loca(i))*perm(loca(i)))^0.3317),494);
    propfraclength(i)=fraclength(i)*0.9;
    if fraclength(i)>=494
        Vprop=Qi*((fraclength(i)/(0.1781*Qi)*3.1415*Hf*0.0012*(poro(loca(i))*perm(loca(i)))^0.3317)^2)*0.9*310/1655.96;
    else
        Vprop=Qi*scale(i)*0.9*310/1655.96;
    end
    propfracwidth(i)=Vprop*0.86/propfraclength(i)/propfracheight*1000;
    propfracperm(i)=0.35^3*0.00016^2*(1+0.00016/(3*(1-0.35)*propfracwidth(i)/1000))^(-2)/(72*25/12*(1-0.35^2))*10^15*0.85;
    propfraccond(i)=propfracperm(i)*propfracwidth(i)/1000;
end

%write compdat
fid=fopen('compdat.inc','w');
fprintf(fid,'COMPDAT\n');
for i=1:nf
    fprintf(fid,'WELL1 %d 125 2 2 OPEN 2* 0.1397 1* 0 1* X 1* / \n',loca(i));
    
end
fprintf(fid,'/\n');
fclose(fid);
%write 裂缝渗透率
fid=fopen('fractureperm.inc','w');
for i=1:nf
    fprintf(fid,'BOX\n');
    fprintf(fid,'%d %d %d %d 1 2 /\n',loca(i),loca(i),round(250/2-fraclength(i)/4),round(250/2+fraclength(i)/4));
    fprintf(fid,'EQUALS\n');
    fprintf(fid,'PERMX %f /\n',unpropfracperm);
    fprintf(fid,'PERMY %f /\n',unpropfracperm);
    fprintf(fid,'PERMZ %f /\n',unpropfracperm);
    fprintf(fid,'/\n');
    fprintf(fid,'ENDBOX\n');
end
for i=1:nf
    fprintf(fid,'BOX\n');
    fprintf(fid,'%d %d %d %d 2 2 /\n',loca(i),loca(i),round(250/2-propfraclength(i)/4),round(250/2+propfraclength(i)/4));
    fprintf(fid,'EQUALS\n');
    fprintf(fid,'PERMX %f /\n',propfraccond(i));
    fprintf(fid,'PERMY %f /\n',propfraccond(i));
    fprintf(fid,'PERMZ %f /\n',propfraccond(i));
    fprintf(fid,'/\n');
    fprintf(fid,'ENDBOX\n');
end
fclose(fid);

%write ROCKNUM
fid=fopen('opt.OFF_reg.inc','w');
fprintf(fid,'EQUALS\n');
fprintf(fid,'ROCKNUM 1 /\n');
fprintf(fid,'/\n');
for i=1:nf
    fprintf(fid,'BOX\n');
    fprintf(fid,'%d %d %d %d 1 2 /\n',loca(i),loca(i),round(250/2-fraclength(i)/4),round(250/2+fraclength(i)/4));
    fprintf(fid,'EQUALS\n');
    fprintf(fid,'ROCKNUM %d /\n',3);
    fprintf(fid,'/\n');
    fprintf(fid,'ENDBOX\n');
end
for i=1:nf
    fprintf(fid,'BOX\n');
    fprintf(fid,'%d %d %d %d 2 2 /\n',loca(i),loca(i),round(250/2-propfraclength(i)/4),round(250/2+propfraclength(i)/4));
    fprintf(fid,'EQUALS\n');
    fprintf(fid,'ROCKNUM %d /\n',2);
    fprintf(fid,'/\n');
    fprintf(fid,'ENDBOX\n');
end    
fclose(fid);










