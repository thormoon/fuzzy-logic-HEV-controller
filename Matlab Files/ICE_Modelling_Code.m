%A program to calculate and show the curves for compressible and 
%incompressible flow, temperature and density,flow for exhaust gas
%and to compare the two metods for calculating the mach number.
%Model Dimensions: 
%Bore B 84*10-3 m 
%Stroke S 90*10-3 m 
%Inlet Ø di 54*10-3 m 
%Inlet port Ø dip 27*10-3 m 
%Exhaust port Ø dep 27*10-3 m 
%Exhaust Ø de 54*10-3 m 
%Conrod length c 0.250 m 
%Inlet length Li 0.10 m 
%Exhaust length Le 2.00 m 
%General values used: 
%Density of air ?atm 1.2 kg*m-3
%Temp of air Tatm 293 K 
%Atmospheric pressure Patm 101*103 Pa
%Gamma (ideal gas) ? 1.4 
%Gas constant R 287 

clear all
close all
clc

M = 0 : 0.01 : 3.0; %a vector which represents all the mach numbers

rpm = (1/(8.484*10^-5))*M.*(1+0.2*M.^2).^-3;

dens = 1.2*(1+0.2*M.^2).^(-2.5);

temp = 293*(1+0.2*M.^2).^(-1);

rpm_ex = (1/(4.9637*10^-5))*M.*((1+0.2*M.^2).^-3);

Incomp = M*(343*60/(0.09*pi))*(27/84)^2;

figure (1)

plot(M,rpm)
axis([ 0.0 3.0 0.0 10000.0]);
title('rpm as a function of mach number');
xlabel('mach number');
ylabel('rpm');

figure (2)

subplot (2,1,1); 
plot(M,dens)
axis([ 0.0 1.0 0.0 2.0]);
title('density as a function of mach number');
xlabel('mach number');
ylabel('density [kg/m^3]');

subplot (2,1,2); 
plot(M,temp)
axis([ 0.0 1.0 200.0 300.0]);
title('temp as a function of mach number');
xlabel('mach number');
ylabel('temp [K]');

figure(3)

plot(M,rpm_ex)
axis([ 0.0 3.0 0.0 15000.0]);
title('rpm as a function of mach number (exhaust)');
xlabel('mach number');
ylabel('rpm');

figure (4)

plot(M,Incomp,M,rpm)
axis([ 0.0 3.0 0.0 10000.0]);
title('Incompressible and compressible');
xlabel('mach number');
ylabel('rpm');
