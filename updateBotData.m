function [botData]= updateBotData(botData,newPos,flag)
if(flag==0)
    displacement=newPos;
    botData(1,:)=botData(1,:)+displacement;
    %direction=displacement(1:2);
else
    oldPos=botData(1,:);
    botData(1,:)=newPos;
    %direction=newPos(1:2)-oldPos(1:2);
end
end