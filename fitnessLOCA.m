function F=fitnessLOCA(loca)
fid = fopen('input_location.txt','w');
fprintf(fid,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d',ceil(loca(1)),ceil(loca(2)),ceil(loca(3)),ceil(loca(4)),ceil(loca(5)),ceil(loca(6)),ceil(loca(7)),ceil(loca(8)),ceil(loca(9)),ceil(loca(10)),ceil(loca(11)),ceil(loca(12)),ceil(loca(13)),ceil(loca(14)),ceil(loca(15)),ceil(loca(16)),ceil(loca(17)),ceil(loca(18)), ceil(loca(19)),ceil(loca(20)),ceil(loca(21)),ceil(loca(22)),ceil(loca(23)),ceil(loca(24)),ceil(loca(25)), ceil(loca(26)),ceil(loca(27)),ceil(loca(28)),ceil(loca(29)),ceil(loca(30)),ceil(loca(31)),ceil(loca(32)),ceil(loca(33)), ceil(loca(34)),ceil(loca(35)),ceil(loca(36)),ceil(loca(37)),ceil(loca(38)),ceil(loca(39)),ceil(loca(40)));
fclose(fid);
writefileLOCA();
system('CALL  eclrun.exe  Eclipse  --\OPT.DATA');%"--" refers to the file path
pause(0.2);
%读运行结�?
fid=fopen('OPT.RSM','r');
i=1;
while ~feof(fid)            %若没有读到文件尾端继续循�?
    result{i}=fgetl(fid);   %fgetl函数读取文件中的行，并删除换行符�?
    i=i+1;
end
for k=11:21    
   temp(k,:)=cell2mat(result(k));
end
temp1=str2num(temp);
fclose(fid);
F=-temp1(11,9);

%保存�?有输入和输出
global figpro
figall=[loca,F];
figpro=[figpro;figall];
save('figpro.mat');
