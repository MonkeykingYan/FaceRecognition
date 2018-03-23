% FR_GUI.m

global h_axes1;
global h_axes2;
h_f = figure('name', 'Face Recognition System Base on PCA and SVM');

h_textC = uicontrol(h_f, 'style', 'text', 'unit', 'normalized', 'string', 'C=', 'position',...
    [0.05 0.7 0.1 0.06]);
h_editC = uicontrol(h_f, 'style', 'edit', 'unit', 'normalized', 'position', [0.05 0.6 0.1 0.06],...
    'callback', 'C = str2num(get(h_editC, ''string''))');
h_textGamma = uicontrol(h_f, 'style', 'text', 'unit', 'normalized', 'string', 'gamma=', 'position',...
    [0.05 0.5 0.1 0.06]);
h_editGamma = uicontrol(h_f, 'style', 'edit', 'unit', 'normalized', 'position', [0.05 0.4 0.1 0.06],...
    'callback', 'gamma = str2num(get(h_editGamma, ''string''))');


%% Get parameters C and Gamma
t = dir('Mat/params.mat');
if length(t) == 0
    % if we didn't find parameters file
    C = Inf;
    gamma = 1
else
    load Mat/params.mat;
end

set(h_editC, 'string', num2str(C));
set(h_editGamma, 'string', num2str(gamma));

h_axes1 = axes('parent', h_f, 'position', [0.25 0.23 0.32 0.6], 'visible', 'off');
h_axes2 = axes('parent', h_f, 'position', [0.62 0.23 0.32 0.6], 'visible', 'off');
h_btnOpen = uicontrol(h_f, 'style', 'push', 'string', 'Open', 'unit', 'normalized',...
    'position', [0.32 0.1 0.18 0.1], 'callback', 'GUIOpenFaceImage');
h_btnRecg = uicontrol(h_f, 'style', 'push', 'string', 'Recognition', 'unit', 'normalized',...
    'position', [0.67 0.1 0.18 0.1], 'callback', 'GUIRecgFaceImage');
h_btnRecg = uicontrol(h_f, 'style', 'push', 'string', 'Training', 'unit', 'normalized',...
    'position', [0.32 0.83 0.18 0.1], 'callback', 'train(C, gamma)');
h_btnRecg = uicontrol(h_f, 'style', 'push', 'string', 'Testing', 'unit', 'normalized',...
    'position', [0.67 0.83 0.18 0.1], 'callback', 'test');

