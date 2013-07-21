function result = calcCollision(controlPoint,resolution)
execstr=strcat('checkTrajColliding(botData,obstacleVertices,',mat2str(controlPoint),',grid,',mat2str(resolution),')');
result=evalin('base',execstr);
end