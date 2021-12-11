%main program for the whole circulation simlation 
global T TS tauS tauD; 
global G dt CHECK N; 
in_circ_2 %initialize 
for klok=1:klokmax 
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
    Pdiff=P(iU)-P(iD); %pressure differences for flows of interest: 
    Q_plot(:,klok)=(Gf.*(Pdiff>0)+Gr.*(Pdiff<0)).*Pdiff; 
    Pdiff_plot(:,klok)=Pdiff;
%(the net flow is computed in each case) 
end 
%plot results: 
plots