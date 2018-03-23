
clear all;
close all;
clc;

addpath(genpath('/Users/mayan/Documents/MATLAB/yanma/FaceRec'));

%% Parameters
disp('please input the value of c and gamma');
c = input('please enter value of C:');
g = input('please enter the value of Gamma:');

%% Training
train(c,g);

%% Testing
test();


%% Face Recognation
disp('please choose a person to tell');
GUIOpenFaceImage;

figure;

disp('the person is')
GUIRecgFaceImage;