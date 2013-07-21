function[botData,obstacleVertices]=initSimulation(filename)
[botData, obstacleData,~]=parser(filename);
[~,obstacleVertices]=polygonMesh(botData,obstacleData,1);
%blockNames=nameData;
end