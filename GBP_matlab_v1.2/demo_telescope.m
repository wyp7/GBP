clearvars

set(0,'DefaultFigureWindowStyle','docked');

load('init_GBP');
colormap jet;

%========================================================
% 
%
%   2024.4.2
%
%   telescope
%   propagation
%           
%
%========================================================

%% initialize the Gaussian laser beam for MZ 

w0 = 0.6*mm;  % laser beam width
wavelength = 688*nm; % wavelength

size = 7*w0; % size of the grid.
N = 2^12-1; % number (NxN) of grid pixels

% path 1
F1 = GaussianBeam(1,w0,wavelength,0*mm,0*mm,0,0,0,size,N);
figure;
plot4(F1);

%% telescope

% telescope lens focal length
f1 = 25*mm;
f2 = 75*mm;

% free propagation 1
%dist1 = 0.3;
%F1 = Fresnel(F1,dist1);

% telescope
d_telescope = f1+f2+3*mm;

F1 = ThinLens(f1,0,0,F1);
figure;
plot4(F1);


F1 = Fresnel(F1,d_telescope);
F1 = ThinLens(f2,0,0,F1);



%% plot
figure;
plot4(F1);

%% final propagation

figure;
for i=1:5
    subplot(1,5,i);
    plotInt(Fresnel(F1,0.2*i))

end






