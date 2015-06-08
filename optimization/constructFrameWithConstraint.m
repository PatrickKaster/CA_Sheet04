function [rFrame,optProps]=constructFrameWithConstraint(skel,oFrame,constraint,optProps,jointList)


%Startwert:

if(~isempty(optProps.x_1))
    x0=optProps.x_1;
else
    x0=Frame2X(oFrame,jointList);
end

%Grenzen, Quats sollten zwischen -1 und 1 liegen:

lb=-ones(size(x0));
ub= ones(size(x0));

%Params
options=optimset('Display',    optProps.Display, ...
                 'MaxFunEvals',optProps.FuncEvals,  ...
                 'MaxIter',    optProps.Iterations, ...
                 'TolFun',     optProps.TolFun);

%Optimierer starten:
[X] = ...
    lsqnonlin(@(x) objfun(x,oFrame,skel,constraint,optProps,jointList) ...
        ,x0,lb,ub,options);


% Ergebnisse zurück:
optProps.startValue=X;

optProps.x_2=optProps.x_1;
optProps.x_1=X;

% Frame basteln:
rFrame=X2Frame(X,oFrame,jointList);