function res=optimizeWithConstraint(skel,mot,constraint)

res=emptyMotion;

res.njoints     =mot.njoints;
res.frameTime   =mot.frameTime;
res.samplingRate=mot.samplingRate;

res.jointNames=mot.jointNames;
res.boneNames =mot.boneNames;
res.nameMap   =mot.nameMap;
res.animated  =mot.animated;
res.unanimated=mot.unanimated;
res.filename  ='Blatt 6 Result';
res.documentation=mot.documentation;
res.angleUnit = mot.angleUnit;
res.jointTrajectories=cell(res.njoints,1);
res.rotationQuat=cell(res.njoints,1);

jointList=2:31;

optProps=struct(    'Display','iter', ...
                    'startValue',[], ...
                    'Iterations',50, ...
                    'FuncEvals',10000, ...
                    'TolFun' , 0.01, ...
                    'TolFunX', 0.01, ...
                    'x',[], ...
                    'x_1',[], ...
                    'x_2',[], ...
                    'recmot',[]);

for f=1:mot.nframes
   oFrame=extractFrame(mot,f);
     
   fprintf('\n\n\n\n Frame: %i \n\n\n\n',f);
   
   fconst{1}=constraint(:,f);
   
   [rFrame,optProps]=constructFrameWithConstraint(skel,oFrame,fconst,optProps,jointList);
   
   res=addFrame2Motion(res,rFrame);
end

res.jointTrajectories=forwardKinematicsQuat(skel,res);