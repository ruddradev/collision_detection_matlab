function [isColliding]= testCollision(botData,obstacleVertices)
[botVertices,obstacleV]=polygonMesh(botData,[],0);
sum=findSums(botVertices,obstacleVertices);
sum=sort(sum);
allSign=sign(sum);
check=allSign(1,:,:)==(-1)*allSign(size(allSign,1),:,:);
check=shiftdim(check,1);
check=check';
response=((check(:,1)==check(:,2))&(check(:,2)==check(:,3))&(check(:,1)~=0));
isColliding=max(response);
% %if(isColliding==1)
% collisionObject=blockNames(response);
% else
%     collisionObject={};
% end
end