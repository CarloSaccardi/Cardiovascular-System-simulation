%This program simulates the left heart and the systemic arteries
global T TS tauS tauD;
global Csa Rs RMi RAo dt CHECK PLA;
in_LV_sa
for klok=1:klokmax
    t=klok*dt;
    PLV_old=PLV;
    Psa_old=Psa;
    CLV_old=CLV;
    CLV=CV_now(t, CLVS, CLVD);
    %find self-consistent valve states and pressures
    set_SMi_SAo
    %store values in arrays for plotting
    t_plot(klok)=t; 
    CLV_plot(klok)=CLV; 
    PLV_plot(klok)=PLV; 
    Psa_plot(klok)=Psa; 
    VLV_plot(klok)=CLV*PLV+VLVd; 
    Vsa_plot(klok)=Csa*Psa+Vsad; 
    QMi_plot(klok)=SMi*(PLA-PLV)/RMi; 
    QAo_plot(klok)=SAo*(PLV-Psa)/RAo; 
    Qs_plot(klok)=Psa/Rs; 
    SMi_plot(klok)=SMi; 
    SAo_plot(klok)=SAo;
end
%plot results
figure(1) 
subplot(3,1,1), plot(t_plot,CLV_plot) 
subplot(3,1,2), plot(t_plot,PLV_plot,t_plot,Psa_plot) 
subplot(3,1,3), plot(t_plot,QMi_plot,t_plot,QAo_plot,t_plot,Qs_plot) 
%left ventricular pressure-volume loop 
figure(2) 
plot(VLV_plot,PLV_plot) 
%systemic arterial pressure-volume ''loop'' 
figure(3) 
plot(Vsa_plot,Psa_plot) 
