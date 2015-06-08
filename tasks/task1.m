%% task 1
filterwidth = 8;

[skel,mot]=readMocap('motions/HDM_bd.asf','HDM_bd_03-03_01_120.amc') % load model
motionplayer('skel',{skel},'mot',{mot}); % show model

w = waitforbuttonpress;
w = waitforbuttonpress;

mot=filterMocap(filterwidth, skel, mot); % apply filtering
motionplayer('skel',{skel},'mot',{mot}); % show filtered model