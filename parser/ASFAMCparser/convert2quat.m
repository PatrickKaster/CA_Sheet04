function mot = convert2quat(skel,mot)

if ~isfield(skel.nodes,'DOFIDs')
    skel = addDOFIDsToSkel(skel);
end

switch lower(mot.angleUnit)
    case 'deg'
        conversion_factor = pi/180;
    case 'rad'
        conversion_factor = 1;
    otherwise
        error(['Unknown angle unit: ' mot.angleUnit]);
end
nTraj = size(mot.rotationEuler,1);
for k = 1:nTraj
    node = skel.nodes(k);
    completeEulers                  = zeros(3,mot.nframes);
    if ~isempty(mot.rotationEuler{node.ID})
        completeEulers(node.DOFIDs,:)   = mot.rotationEuler{node.ID}*conversion_factor;
    end
    axis_quat = repmat(euler2quat(flipud(node.axis)*conversion_factor,'zyx'),1,mot.nframes); 
    if (node.ID == 1) % root node? => special case for determination of rotation order (node.rotationOrder only concerns the global rotational offset in this case)
        mot.rotationQuat{node.ID,1} = euler2quat(flipud(completeEulers),'zyx'); % ASF specs use opposite multiplication order as we do, hence fliplr() and flipud()!
    else 
        mot.rotationQuat{node.ID,1} = quatmult(axis_quat,quatmult(euler2quat(flipud(completeEulers),'zyx'),quatinv(axis_quat))); % ASF specs use opposite multiplication order as we do, hence fliplr() and flipud()!
    end
end
