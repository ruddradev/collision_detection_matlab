%   test=vrworld('C:\Users\Adithya\Desktop\simulation\test.wrl');
%   open(test);
%   testNodes=nodes(test,'-full');
%   botNode = vrnode(test,'BOT');
%   prop= get(botNode,'children');
%   center= get(botNode,'center');
%   Box= prop(1,1);
%   size=get(box,'size');
%
%

function [botData, obstacleData,blockNames]= parser(filename)
%botData is a 2*3 mat. first row has the centre, second has size
world=vrworld(filename);
open(world);
try
    botNode = vrnode(world,'BOT');
    children= get(botNode,'children');
    center= get(botNode,'translation');
    for i=1:Inf
        try
            Box=  children(i);
            size=get(Box,'size');
            break;
        catch sizeNotFoundExp
            if(strcmp(sizeNotFoundExp.identifier,'VR:invalidfield'))
                continue;
            elseif(strcmp(sizeNotFoundExp.identifier,'MATLAB:badsubscript'))
                disp('No Shape defined in Bot node');
                return;
            end
        end
    end
catch nodeNotFoundExp
    if(strcmp(nodeNotFoundExp.identifier,'VR:nodenotfound'))
        disp('cannot find bot node');
        return;
    end
end
botData=[center;size];
nameData={};
% after this, all the obstacle data is needed
allNodes=nodes(world,'-full');
blockData=zeros(1,6);
for obstacle=1:Inf
    try
        name=get(allNodes(obstacle),'Name');
        if(strcmp(name,'BOT'))
            botIndex=obstacle;
            continue;
        end
        blockNode =allNodes(obstacle);
        % vrnode(world,'BOT');
         center= get(blockNode,'translation');
        children= get(blockNode,'children');
        for i=1:Inf
            try
                Box=  children(i);
                size=get(Box,'size');
                break;
            catch sizeNotFoundExp
                if(strcmp(sizeNotFoundExp.identifier,'VR:invalidfield'))
                    continue;
                elseif(strcmp(sizeNotFoundExp.identifier,'MATLAB:badsubscript'))
                    disp('Warning:No Shape defined in block node,discarded');
                    break;
                end
            end
        end
    catch nodeNotFoundExp
        if(strcmp(nodeNotFoundExp.identifier,'MATLAB:badsubscript'))
            disp('cannot find any more obstacle nodes');
            break;
        end
    end
    blockData=[blockData;[center,size]];
    nameData(obstacle)={name};
    
end
nameData(botIndex)=[];
blockData(1,:)=[];
%nameData(1,:)=[];
obstacleData=blockData;
blockNames=nameData;
close(world);
end