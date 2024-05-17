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

w0 = 0.8*mm;  % laser beam width
wavelength = 688*nm; % wavelength

size = 7*w0; % size of the grid.
N = 2^12-1; % number (NxN) of grid pixels

% path 1
F1 = GaussianBeam(1,w0,wavelength,0*mm,0*mm,0,0,0,size,N);
F1 = IntGrate(1e5,1e3,0.2,F1);


%% final propagation

figure;
for i=1:5
    subplot(1,5,i);
    plotInt(Fresnel(F1,0.2*i))

end
