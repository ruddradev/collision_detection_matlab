function[minkowskiSum]= minkowski(botVertices,obstacleVertices)
obstacles=size(obstacleVertices,1); 
minkowskiSum=zeros(8*obstacles,3);
for i=1:8
for j=1:obstacles
minkowskiSum((i-1)*obstacles+j,:)=botVertices(i,:)-obstacleVertices(j,:);
end
end
%scatter3(minkowskiSum(:,1),minkowskiSum(:,2),minkowskiSum(:,3));
end