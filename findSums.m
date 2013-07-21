function allSums= findSums(botVertices, obstacleVertices)
botData(:,:)=botVertices(1,:,:);
allSum=zeros(64,3,size(obstacleVertices,1));
for i=1:size(obstacleVertices,1)
    obstacleData=shiftdim(obstacleVertices(i,:,:),1);
    sum=minkowski(botData',obstacleData');
    allSum(:,:,i)=sum;
end
allSums=allSum;
end
