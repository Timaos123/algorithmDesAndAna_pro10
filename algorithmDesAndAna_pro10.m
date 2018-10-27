nearMat=[inf,45,10,inf,inf,inf;
 inf,inf,15,inf,10,inf;
 20,inf,inf,15,inf,inf;
 inf,20,inf,inf,35,inf;
 inf,inf,inf,30,inf,inf;
 inf,inf,inf,3,inf,inf];
startPoint=0;
[shortestLengths,shortestPaths]=getShortestPaths(nearMat,startPoint);
fprintf(strcat('shortest length:',num2str(shortestLengths),'\n'))
fprintf(strcat('shortest path:\n'))
for nearMatRow=1:size(shortestPaths,1)
    fprintf(strcat(num2str(shortestPaths(nearMatRow,shortestPaths(nearMatRow,:)>0)-1),'\n'))
end