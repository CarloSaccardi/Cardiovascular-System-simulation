global T TS tauS tauD; 
global G dt CHECK N; 
G=zeros(N,N);
in_circ_2 %initialize 
for klok=1:klokmax 
    G(iLV,isa)=1/RAo; %But G(isa,iLV)=O (no leak) 
    G(isa,isv)=1/Rs; %no valve 
    G(isv,isa)=1/Rs; %no valve     G(isv,iRV)=1/RTr; %But G(iRV,isv)=O; (no leak) 
    G(iRV,ipa)=1/RPu; %But G(ipa,iRV)=O; (no leak) 
    G(ipa,ipv)=1/Rp; %no valve 
    G(ipv,ipa)=1/Rp; %no valve 
    G(ipv,iLV)=1/RMi(klok); %But G(iLV,ipv)=O; (no leak) 
 %This writes the result on the screen. 
%matrix of initial valve states: 
    t=klok*dt; 
    P_old=P; 
    C_old=C; 
%find current values of left and right ventricular compliance and store each 
%of them in the appropriate slot in the array C:
    C(iLV)=CV_now(t,CLVS,CLVD); 
    C(iRV)=CV_now(t,CRVS,CRVD); 
%find self-consistent valve states and pressures: 
    set_valves 
%store variables in arrays for future plotting: 
    t_plot(klok)=t; 
    C_plot(:,klok)=C; 
    P_plot(:,klok)=P; 
    V_plot(:,klok)=Vd+C.*P; 
    RMi_plot(klok)=RMi(klok)
    %RMi_plot(klok)=RMi;
    Pdiff=P(iU)-P(iD); %pressure differences for flows of interest: 
    Q_plot(:,klok)=(Gf.*(Pdiff>0)+Gr.*(Pdiff<0)).*Pdiff; 
    Pdiff_plot(:,klok)=Pdiff;
%(the net flow is computed in each case) 
end 
%plot results: 
volumes_time_plot