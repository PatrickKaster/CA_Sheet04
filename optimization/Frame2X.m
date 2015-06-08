function res=Frame2X(frame,jointList)

res=[];
for i=jointList
    res=[res; frame.rotationQuat{i}];
end