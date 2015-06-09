function mot = filterMocap(filterWidth, skel, mot)
    mot.jointTrajectories = applyLowpassFilter(filterWidth, mot.jointTrajectories);
    mot.rotationEuler = applyLowpassFilter(filterWidth, mot.rotationEuler);
    mot.rotationQuat = applyLowpassFilter(filterWidth, mot.rotationQuat);
    mot.jointTrajectories = forwardKinematicsQuat(skel,mot);
    mot = convert2quat(skel, mot);
end