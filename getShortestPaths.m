function [shortestLengths,shortestPaths]=getShortestPaths(nearMat,startPoint)
    pointList=zeros(1,size(nearMat,1));
    for i=1:size(nearMat,1)
        pointList(i)=i;
    end
    shortestPaths=zeros(size(nearMat,1)-1,size(nearMat,1));
    shortestLengths=zeros(1,size(nearMat,1)-1);
    startPoint=startPoint+1;
    for i=2:size(nearMat,1)
        passedPath=[1];
        unpassedPath=pointList(1,2:size(pointList,2));
        keptLength=nearMat(startPoint,i);
        keptPath=[1,i];
        [shortestLengths(i-1),shortestPaths(i-1,:)]=findShortestPath(nearMat,startPoint,i,passedPath,unpassedPath,0,keptPath,keptLength); 
    end
end