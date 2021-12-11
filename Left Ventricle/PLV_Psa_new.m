%The following function solves for Psa(t) [systemic arterial pressure] and Plv[left ventricular pressure]
%The pressures at the prvious time step are given, as well as the states of the valves Smi, Sao 
%and the left ventricular compliance at both the previous and current time step Clv, Clv_old
function [PLV, Psa]=PLV_Psa_new(PLV_old, Psa_old, CLV_old, CLV, SMi, SAo)
global Csa Rs RMi RAo dt CHECK PLA;
C11=CLV+dt*((SMi/RMi)+(SAo/RAo));
C12=-dt*(SAo/RAo);
C22=Csa+dt*((SAo/RAo)+(1/Rs))
B1=CLV_old*PLV_old+dt*(SMi/RMi)*PLA; 
B2=Csa*Psa_old; 
D=C11*C22-C12^2; 
PLV=(B1*C22-B2*C12)/D; 
Psa=(B2*C11-B1*C12)/D; 
if (CHECK) 
    LHS1=(CLV*PLV-CLV_old*PLV_old)/dt; 
    RHS1=(SMi/RMi)*(PLA-PLV)-(SAo/RAo)*(PLV-Psa); 
    CH1=RHS1-LHS1 
    LHS2=Csa*(Psa-Psa_old)/dt; 
    RHS2=(SAo/RAo)*(PLV-Psa)-(1/Rs)*Psa; 
    CH2=RHS2-LHS2
end
%The parameter CHECK is set during initialization (1=True, 0= False). If
%CHECK = 1 the program checks the algebric manipulations made in deriving
%the pressures formulaes. If everything is correct--> CH2=CH1=0
