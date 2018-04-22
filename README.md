# FaceRecognition
How to Configure your Computer
--------------------------------

1. %------ Hardware Support:------%

	 * make sure that your matlab have camera hardware support, you can get them from matlab "Get Hardware Support Packages" in Home section.
	 These supports are mainly for the camera.

	 * For different machine and different hardware support. Therefore, videoFileReader function will be changed, for example, I use macOS and
	 Quicktime as IP camera support, therefore, my videoFileReader function is like this:
	 videoFileReader = imaq.VideoDevice('macvideo', 1, 'YCbCr422_1280x1024','ROI',[1 1 1024 720]);

2. %------ File Path Configuration ------%
I am sorry to say that I did't write a function to read and change all the path needed in this program, therefore, to make sure that the code
run well on your computer, you have to change the following file paths in the code.

	* 'main.m' function under '~/static' folder, you have to change 'addpath(genpath('/Users/yanma/Documents/MATLAB/yanma/FaceRec'));' of yours path.

	* 'GUIRecgFaceImage.m' function under your workspace, the 'filepath' funtion you need to change to your path.

	* 'export.m' funtion under exportLibSVM, the path behind strMat and strLibSVM you need to change.


3. %------ Number of people in the ORL databases ------%
Because I do a real-time face recognition and generate 8 people's faces data, therefore, the number of the training people have to change.
For example, if you have 40 people under the 'ORL' folder, now you want to change to 8 people (just my own database). You have to change the
following values:

	* nPerson under 'train.m';

	* nPerson under 'ReadFaces.m';

	* nPerson under 'test.m';

The List above is all the configuration I can get, maybe miss some part. If you still have questions, please contact me by 'monkeykingyan@gmail.com'.

Best
