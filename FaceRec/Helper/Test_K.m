load Mat/FaceMat.mat;
x = FaceContainer(200, :);
displayImage(x,112,92);
[pcaA,V] = fastPCA(FaceContainer,200);
xApprox = approx(x,50);
displayImage(xApprox,112,92);
xApprox = approx(x,100);
displayImage(xApprox,112,92);
xApprox = approx(x,200);
displayImage(xApprox,112,92);


