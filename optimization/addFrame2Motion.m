function mot=addFrame2Motion(mot,Frame)

    mot.nframes=mot.nframes+Frame.nframes;

    for j=1:mot.njoints
            mot.jointTrajectories{j}=[mot.jointTrajectories{j} Frame.jointTrajectories{j}];
            if ~(isempty(mot.rotationQuat))
                mot.rotationQuat{j}     =[mot.rotationQuat{j}      Frame.rotationQuat{j}];
            end
    end

    mot.rootTranslation=[mot.rootTranslation Frame.rootTranslation];

    mot.boundingBox=computeBoundingBox(mot);
end