function result=checkTrajColliding(botData,obstacleVertices,controlPoint,resolution) 
%- controlPoint is the control point given by RRT for a straight line
%  collision check. remove line 5 if control points are in VRML coordinates.
%- resolution is the interval between every collision check in metres
controlPoint=controlPoint+(botData(1,:));   % line number 5!! remove this line if control points are to given in VRML coords.
oldPosition=botData(1,:);
motion=controlPoint-oldPosition;
distance= sqrt(motion(1)^2+motion(2)^2+motion(3)^2);
steps=resolution/distance;
%position=oldPosition;
i=oldPosition(1):steps*motion(1):controlPoint(1);
j=oldPosition(2):steps*motion(2):controlPoint(2);
k=oldPosition(3):steps*motion(3):controlPoint(3);
 %in case one matrix is of zero size
emptyMat=find([size(i,2) size(j,2) size(k,2)]==0);
while(size(emptyMat,2))
    emptyMat=find([size(i,2) size(j,2) size(k,2)]==0);
    if(size(emptyMat,2)==0)
        break;
    elseif(size(emptyMat,2)==3)
        result=0;
        return;
    elseif(emptyMat(1)==1)
        i=ones(1,max([size(j) size(k)])).*botData(1,1);
    elseif(emptyMat(1)==2)
        j=ones(1,max([size(i) size(k)])).*botData(1,2);
        elseif(emptyMat(1)==3)
        k=ones(1,max([size(i) size(j)])).*botData(1,3);
    else
        break;
    end
end
for counter=1:size(i,2)
    %displacement=botData(1,:)-[i(counter) j(counter) k(counter)];
    [botData,~]=updateBotData(botData,[i(counter) j(counter) k(counter)],1);
    if(testCollision(botData,obstacleVertices)==1)
        result=true;
        return;
    else
        result=false;
    end
end
end