%% task 1
filterWidth = 8;

[skel,mot]=readMocap('motions/HDM_bd.asf','HDM_bd_03-03_01_120.amc') % load model
motionplayer('skel',{skel},'mot',{mot}); % show model

w = waitforbuttonpress;
w = waitforbuttonpress;

coefs = gausswin(filterWidth)/sum(gausswin(filterWidth));

for t = 1:length(mot.jointTrajectories)
    data = cell2mat(mot.jointTrajectories(t));
    if ~isempty(data)        
        realD = data(1,:);
        filterD = filter(coefs, 1, realD);
        data(1,:)=filterD;
        if size(data,1) > 1
            realD = data(2,:);
            filterD = filter(coefs, 1, realD);
            data(2,:)=filterD;
        end
        if size(data,1) > 2
            realD = data(3,:);
            filterD = filter(coefs, 1, realD);
            data(3,:)=filterD;
        end
        mot.jointTrajectories(t) = {data};
    end
end

motionplayer('skel',{skel},'mot',{mot}); % show filtered model

w = waitforbuttonpress;
w = waitforbuttonpress;

[skel,mot]=readMocap('motions/HDM_bd.asf','HDM_bd_03-03_01_120.amc') % load model
for t = 1:length(mot.rotationEuler)
    data = cell2mat(mot.rotationEuler(t));
    if ~isempty(data)        
        realD = data(1,:);
        filterD = filter(coefs, 1, realD);
        data(1,:)=filterD;
        if size(data,1) > 1
            realD = data(2,:);
            filterD = filter(coefs, 1, realD);
            data(2,:)=filterD;
        end
        if size(data,1) > 2
            realD = data(3,:);
            filterD = filter(coefs, 1, realD);
            data(3,:)=filterD;
        end
        mot.rotationEuler(t) = {data};
    end
end
mot = convert2quat(skel, mot);
mot.jointTrajectories = forwardKinematicsQuat(skel,mot);

motionplayer('skel',{skel},'mot',{mot}); % show filtered model

w = waitforbuttonpress;
w = waitforbuttonpress;

[skel,mot]=readMocap('motions/HDM_bd.asf','HDM_bd_03-03_01_120.amc') % load model
for t = 1:length(mot.rotationQuat)
    data = cell2mat(mot.rotationQuat(t));
    if ~isempty(data)        
        realD = data(1,:);
        filterD = filter(coefs, 1, realD);
        data(1,:)=filterD;
        if size(data,1) > 1
            realD = data(2,:);
            filterD = filter(coefs, 1, realD);
            data(2,:)=filterD;
        end
        if size(data,1) > 2
            realD = data(3,:);
            filterD = filter(coefs, 1, realD);
            data(3,:)=filterD;
        end
        if size(data,1) > 3
            realD = data(4,:);
            filterD = filter(coefs, 1, realD);
            data(4,:)=filterD;
        end
        mot.rotationQuat(t) = {data};
    end
end
mot.jointTrajectories = forwardKinematicsQuat(skel,mot);

motionplayer('skel',{skel},'mot',{mot}); % show filtered model
