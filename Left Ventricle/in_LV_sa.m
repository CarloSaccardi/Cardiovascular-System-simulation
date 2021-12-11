T = 0.0125
TS = 0.0050
tauS=0.0025 %Clv time constant during systole 
tauD=0.0075 %Clv time constant during diastole   0.0075
Rs= 17.86 %Systemic resistance
%the following valve resistance are not realistic, they are small enough to be negligible 
RMi = 0.01 %mitral valve resistance
RAo = 0.01 %aortic valve resistnce
%the following value of Csa is aproximate, adjust it to make blood pressure 120/80
Csa=0.00130 %Systemic arterial compliance
CLVS=0.00003 %max value of Clv (systolic)
CLVD=0.0146 %max value of Clv (diastolic)
Vsad=0.825% systemic arterial volume when Psa=0
VLVd=0.027 %left ventricular volume when Plv=0
PLA=5 %left arterial pressure
dt=0.01*T %time step duration, this choice implies 100 timesteps per caricac cycle
klokmax=15*T/dt%total number of timesteps, this choice implies 15 caridiac cycles 
PLV=5 %initial value of Plv 
Psa=80 %initial value of Psa
%set intial valve state
SMi=(PLA>PLV); %equal 1 if PLA>PLV, 0 otherwise
SAo=(PLV>Psa); %equal 1 if PLV>Psa, 0 otherwise
CLV=CV_now(0,CLVS,CLVD)%initial value of Clv

%If Matlab knows in advance how much space is needed for the arrays (used
%to store data for plotting) the program will run much faster
t_plot=zeros(1,klokmax);
CLV_plot=zeros(1,klokmax);
PLV_plot=zeros(1,klokmax);
Psa_plot=zeros(1,klokmax);
VLV_plot=zeros(1,klokmax);
Vsa_plot=zeros(1,klokmax);
QMi_plot=zeros(1,klokmax);
QAo_plot=zeros(1,klokmax);
Qs_plot=zeros(1,klokmax);
SMi_plot=zeros(1,klokmax);
SaAo_plot=zeros(1,klokmax);

CHECK=1