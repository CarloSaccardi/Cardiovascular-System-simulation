% filename: setup_lung.m 
%heterogeneity parameter (O<=beta<=1): 
%beta=O for homogenous lung 
%beta=1 for no ventilation/perfusion correlation 
beta=0.5 
% 
%number of iterations used in bisection: 
maxcount=20 
% 
%number of ''alveoli'': 
n=100 
% 
%reference oxygen concentration (moles/liter): 
cref=0.2/(22.4*(310/273)) 
%cref=concentration of oxygen 
%in air at sea level at body temperature 
% 
%oxygen concentration in the inspired air: 
cI=cref 
% 
%blood oxygen concentration 
%at full hemoglobin saturation: 
cstar=cref 
%cstar=4*(concentration of hemoglobin 
%in blood expressed in moles/liter) 
% 
%rate of oxygen consumption (moles/minute): 
M=0.25*cref*5.6 
% 
%oxygen partial pressure 
%at which hemoglobin is half-saturated: 
Pstar=25 
% 
%gas constant•absolute temperature 
%(mmHg•liters/mole): 
RT=760*22.4*(310/273) 
% 
%oxygen partial pressure 
%in the inspired air (mmHg): 
PI=RT*cI 
% 
%oxygen concentration 
%in blood exposed directly to inspired air: 
camax=cstar*(PI/Pstar)^3/(1+(PI/Pstar)^3) 
%camax is an upper bound 
%on oxygen concentration in blood 
% 
%expected value of total alveolar ventilation: 
VAtotal=5.0 %(liters/minute) 
% 
%expected value of total perfusion: 
Qtotal=5.6 %(liters/minute) 
% 
%expected alveolar ventilation per alveolus: 
VAbar=VAtotal/n 
% 
%expected perfusion per alveolus: 
Qbar=Qtotal/n 
% 
%random initialization 
%of ventilation and perfusion: 
%create two independent vectors 
%of exponential random variables 
%with mean 1 : 
a1=-log(rand(n,1)); 
a2=-log(rand(n,1)); 
av=(a1+a2)/2; 
%components of av have mean 1 
%and distribution like t•exp(-t). 
VA=VAbar*(a1*beta+av*(1-beta)); 
Q = Qbar*(a2*beta+av*(1-beta)); 
%when beta=O, VA and Q are in a fixed proportion 
%when beta=1, VA and Q are independent 
r=VA./Q; 
figure(1) 
plot(Q,VA,'.') 
%
%find actual values of 
%VAtotal, Qtotal, VAbar, and Qbar: 
VAtotal=sum(VA) 
Qtotal =sum(Q) 
VAbar=VAtotal/n 
Qbar= Qtotal/n 