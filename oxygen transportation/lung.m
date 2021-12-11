%filename: lung.m (main program) 
clear all 
clf 
global Pstar cstar n maxcount M Q camax RT cl; 
setup_lung 
cvsolve 
outchecklung