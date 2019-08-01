function checkwave(path,Band,plotscale)
filename=strcat(path,'Input/data',num2str(Band));
fprintf('checkout: \n')
fprintf( filename)
fprintf('\n')

load(filename);
figure
ret.scale=plotscale;
plotAll1(ret);
end