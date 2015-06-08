function res=extractFrame(mot,f)

res=emptyMotion;

res.njoints     =mot.njoints;
res.nframes     =1;
res.frameTime   =mot.frameTime;
res.samplingRate=mot.samplingRate;

res.jointNames=mot.jointNames;
res.boneNames =mot.boneNames;
res.nameMap   =mot.nameMap;
res.animated  =mot.animated;
res.unanimated=mot.unanimated;
res.filename  =mot.filename;
res.documentation=mot.documentation;
res.angleUnit = mot.angleUnit;

for j=1:mot.njoints
    if(~isempty(mot.jointTrajectories{j})),
        res.jointTrajectories{j}=mot.jointTrajectories{j}(:,f);
    else
        res.jointTrajectories{j}=[];
    end
    
    if(~isempty(mot.rotationQuat{j}))
        res.rotationQuat{j}=mot.rotationQuat{j}(:,f);
    else
        res.rotationQuat{j}=[];
    end
end

res.rootTranslation=mot.rootTranslation(:,f);

res.boundingBox=computeBoundingBox(res);