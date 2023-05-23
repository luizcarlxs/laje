clc
opts = detectImportOptions('momento.xlsx');
varNames = opts.VariableNames ;
varTypes = {'categorical','double','double','double','double','double',...
    'double','double','double','double','double'}; 

opts = setvartype(opts,varNames,varTypes);
T2 = readtable('momento.xlsx',opts);
luiz = T2(1,1);