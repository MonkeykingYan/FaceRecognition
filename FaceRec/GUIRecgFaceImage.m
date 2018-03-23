% GUIRecgFaceImage.m

nClass = classify(filepath);
msgbox( ['class belong to:',num2str(nClass)] );
%axes(h_axes2);
f = imread(['Data/ORL/S',num2str(nClass),'/1.pgm']); % Open the first image of a person
imshow(f);