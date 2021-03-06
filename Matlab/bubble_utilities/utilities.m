%Reference Density
Rho = 1000;
%Reference viscosity
Mu = 1e-4;
%Reference velocity
U = 0.01;
%Reference Length
L = 0.001;
%Gravity
g = 0;
%Surface tension
sigma = 0;

Re = Rho*L*U/Mu;
Fr = U / sqrt(g*L);
We = Rho*U^2*L/sigma;

output_p = 11.94;
real_p = Rho*U^2*output_p;

output_x = 1;
real_x = L*output_x;

output_poverx = 12;
real_poverx = Rho*U^2/L*output_poverx;


expected_dpdx = -12*Mu*U/L^2