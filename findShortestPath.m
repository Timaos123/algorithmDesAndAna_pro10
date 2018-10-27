function [shortestLength,shortestPath]=findShortestPath(nearMat,startPoint,endPoint,passedPath,unpassedPath,passedLength,keptPath,keptLength)
    [matMin,matMinIndex]=min(nearMat(startPoint,:));
%     fprintf(strcat(num2str(startPoint),'-',num2str(unpassedPath),'\n'))
    if matMinIndex==endPoint
        shortestLength=passedLength+nearMat(startPoint,endPoint);
        shortestPath=[passedPath,endPoint];
        shortestPath=[shortestPath,zeros(1,size(nearMat,1)-size(shortestPath,2))];
    else if ismember(matMinIndex,unpassedPath)
        passedPath=[passedPath,matMinIndex];
        for i=1:size(unpassedPath,2)
            if unpassedPath(i)==matMinIndex
                unpassedPath(i)=[];
                break
            end
        end
        passedLength=passedLength+matMin;
        [shortestLength,shortestPath]=findShortestPath(nearMat,matMinIndex,endPoint,passedPath,unpassedPath,passedLength,keptPath,keptLength);
        if shortestLength>=keptLength
            shortestLength=keptLength;
            shortestPath=keptPath;
            shortestPath=[shortestPath,zeros(1,size(nearMat,1)-size(shortestPath,2))];
        end
        else
            shortestLength=passedLength*0;
            shortestPath=[];
            shortestPath=[shortestPath,zeros(1,size(nearMat,1)-size(shortestPath,2))];
        end
    end
end