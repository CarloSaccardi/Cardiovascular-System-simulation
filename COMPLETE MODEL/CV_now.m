%ventricular compliance as a function of time: here we take time zero to be at the end of
%diastole, when the left ventricular compliance has it's maximum value.
%The following function drives the cardiac cycle
function CV = CV_now(t, CVS, CVD)
global T TS tauS tauD;%tauD/S are two constants of time, smalle values yield faster transitions.
tc=rem(t,T);%time of current cycle measured from start of systole
if(tc<TS)
    e= (1-exp(-tc/tauS))/(1-exp(-TS/tauS));
    CV = CVD*(CVS/CVD)^e
else 
    e= (1-exp(-(tc-TS)/tauD))/(1-exp(-(T-TS)/tauD));
     CV = CVS*(CVD/CVS)^e
end 
%This function is general so that we can call it for either side of the heart. 
%When this function is used to model the left side of the heart-> CVD,CVS
%are set equal to CLVD, CLVS and the output CV will be the left ventrcular compliance CLV. 