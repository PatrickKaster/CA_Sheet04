function mot = emptyMotion(varargin)

switch nargin
    case 0
        mot = struct('njoints',0,...                            % number of joints
                     'nframes',0,...                            % number of frames
                     'frameTime',1/120,...                      % inverse sampling rate: time per frame (in seconds)
                     'samplingRate',120,...                     % sampling rate (in Hertz) (120 Hertz is Carnegie-Mellon Mocap-DB standard)
                     'jointTrajectories',cell(1,1),...          % 3D joint trajectories
                     'rootTranslation',[],...                   % global translation data stream of the root
                     'rotationEuler',cell(1,1),...              % rotational data streams for all joints, including absolute root rotation at pos. 1, Euler angles
                     'rotationQuat',cell(1,1),...               % rotational data streams for all joints, including absolute root rotation at pos. 1, quaternions
                     'jointNames',cell(1,1),...                 % cell array of joint names: maps node ID to joint name
                     'boneNames',cell(1,1),...                  % cell array of bone names: maps bone ID to node name. ID 1 is the root.
                     'nameMap',cell(1,1),...                    % cell array mapping standard joint names to DOF IDs and trajectory IDs
                     'animated',[],...                          % vector of IDs for animated joints/bones
                     'unanimated',[],...                        % vector of IDs for unanimated joints/bones
                     'boundingBox',[],...                       % bounding box (given a specific skeleton)
                     'filename','',...                          % source filename
                     'documentation','',...                     % documentation from source file   
                     'angleUnit','deg');                        % angle unit, either deg or rad
    case 1
        refmot = varargin{1};
        mot = struct('njoints',refmot.njoints,...               % number of joints
                     'nframes',refmot.nframes,...               % number of frames
                     'frameTime',refmot.frameTime,...           % inverse sampling rate: time per frame (in seconds)
                     'samplingRate',refmot.samplingRate,...     % sampling rate (in Hertz) (120 Hertz is Carnegie-Mellon Mocap-DB standard)
                     'jointTrajectories',{cell(refmot.njoints,1)},...          % 3D joint trajectories
                     'rootTranslation',zeros(3,refmot.nframes),...      % global translation data stream of the root
                     'rotationEuler',{cell(refmot.njoints,1)},...              % rotational data streams for all joints, including absolute root rotation at pos. 1, Euler angles
                     'rotationQuat',{cell(refmot.njoints,1)},...               % rotational data streams for all joints, including absolute root rotation at pos. 1, quaternions
                     'jointNames',{refmot.jointNames},...                 % cell array of joint names: maps node ID to joint name
                     'boneNames',{refmot.boneNames},...                  % cell array of bone names: maps bone ID to node name. ID 1 is the root.
                     'nameMap',{refmot.nameMap},...                    % cell array mapping standard joint names to DOF IDs and trajectory IDs
                     'animated',refmot.animated,...                          % vector of IDs for animated joints/bones
                     'unanimated',refmot.unanimated,...                        % vector of IDs for unanimated joints/bones
                     'boundingBox',[],...                       % bounding box (given a specific skeleton)
                     'filename','',...                          % source filename
                     'documentation','',...                     % documentation from source file   
                     'angleUnit','deg');                        % angle unit, either deg or rad
end