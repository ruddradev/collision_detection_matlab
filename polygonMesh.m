function [botVertices, obstacleVertices]=polygonMesh(botData,obstacleData,flag)
if(flag==1)
centre=obstacleData(:,[1:3]);
size=obstacleData(:,[4:6]);
vertex(:,:,1)=centre-size./2;
vertex(:,:,2)= [(centre(:,1)+size(:,1)./2) centre(:,[2 3])-size(:,[2 3])./2];
vertex(:,:,3)=[(centre(:,1)+size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)-size(:,3)./2];
vertex(:,:,4)=[(centre(:,1)-size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)-size(:,3)./2];
vertex(:,:,5)=[(centre(:,1)-size(:,1)./2) centre(:,2)-size(:,2)./2 centre(:,3)+size(:,3)./2];
vertex(:,:,6)=[(centre(:,1)+size(:,1)./2) centre(:,2)-size(:,2)./2 centre(:,3)+size(:,3)./2];
vertex(:,:,7)=[(centre(:,1)+size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)+size(:,3)./2];
vertex(:,:,8)=[(centre(:,1)-size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)+size(:,3)./2];
%temp=shiftdim(vertex,2);
%temp=reshape(temp,108*8,1,3);
%temp=shiftdim(temp,2);
obstacleVertices=vertex;
else
    obstacleVertices=[];
end
clear centre vertex temp size;
centre=botData(1,:);
size=botData(2,:);
vertex(:,:,1)=centre-size./2;
vertex(:,:,2)= [(centre(:,1)+size(:,1)./2) centre(:,[2 3])-size(:,[2 3])./2];
vertex(:,:,3)=[(centre(:,1)+size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)-size(:,3)./2];
vertex(:,:,4)=[(centre(:,1)-size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)-size(:,3)./2];
vertex(:,:,5)=[(centre(:,1)-size(:,1)./2) centre(:,2)-size(:,2)./2 centre(:,3)+size(:,3)./2];
vertex(:,:,6)=[(centre(:,1)+size(:,1)./2) centre(:,2)-size(:,2)./2 centre(:,3)+size(:,3)./2];
vertex(:,:,7)=[(centre(:,1)+size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)+size(:,3)./2];
vertex(:,:,8)=[(centre(:,1)-size(:,1)./2) centre(:,2)+size(:,2)./2 centre(:,3)+size(:,3)./2];
%temp=shiftdim(vertex,2);
%temp=reshape(temp,8,1,3);
%temp=shiftdim(temp,2);
botVertices=vertex;
end
