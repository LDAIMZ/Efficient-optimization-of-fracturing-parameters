function F=fitnessVOLUME(scale)
fid = fopen('scale.txt','w');
fprintf(fid,'%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d',scale(1),	scale(2),	scale(3),	scale(4),	scale(5),	scale(6),	scale(7),	scale(8),	scale(9),	scale(10),	scale(11),	scale(12),	scale(13),	scale(14),	scale(15),	scale(16),	scale(17),	scale(18),	scale(19),	scale(20),	scale(21),	scale(22),	scale(23),	scale(24),	scale(25),	scale(26),	scale(27),	scale(28),	scale(29),	scale(30),	scale(31),	scale(32),	scale(33),	scale(34),	scale(35),	scale(36),	scale(37),	scale(38),	scale(39),	scale(40));
fclose(fid);
writefileVOLUME();
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
figall=[scale,F];
figpro=[figpro;figall];
save('figpro.mat');
