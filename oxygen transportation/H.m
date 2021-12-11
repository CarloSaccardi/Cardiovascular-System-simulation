function P=H(ca) 
%filename: H.m 
global Pstar cstar; 
ratio=ca/cstar; 
P=Pstar*(ratio./(1-ratio)).^(1/3);