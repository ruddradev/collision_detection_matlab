%Author- Ruddra dev Roychoudhury.

%the functions are described in the format- 
%[return parameter list]=functionName(inputParameterList)


% INITIALISE THE SIMULATION
%[botData,obstacleVertices]=initSimulation(filename)

%botData is the bot position and size. The first row has X Y Z in VRML
%   coordinates. The second row has the size in format l b h. Default is
%   1.07 l and b and 0.3 h. Can be changed as per convenience. 
%obstacleVertices is the scene information of the environment. needed for
%   internal processing. Not to be tampered with.

% UPDATE THE BOT POSITION
%[botData]= updateBotData(botData,newPos,flag)

%set flag=1 for absolute VRML frame and 0 for frame wrt to initial position
%of the bot. [-52,-0.3,10.5] in VRML coordinates is [0 0 0] in bot frame.


%CONTROL POINT TO BOT STRAIGHT LINE COLLISION DETECTION
%[result]=checkTrajColliding(botData,obstacleVertices,controlPoint,resolution)

%controlPoint is the control point given by RRT for a straight line
%  collision check. remove line 5 if control points are in VRML coordinates.

%- resolution is the interval between two collision checks measured in metres of VRML units.
%lesser resolution gives faster results but is less reliable as some
%collisions might miss out.

% result is either 1 or 0. 1 for a collision or 0 for no collision.

% code has beed tested for errors.
