%filename: outchecklung.m 
%starting from the value of cV 
%determined by cvsolve, 
%solve for all other unknowns: 
%concentrations and partial pressures 
%in the individual alveoli: 
% 
%vector of oxygen concentrations in 
%arterial blood leaving each alveolus: 
ca=carterial(cV,r); 
% 
%vector of oxygen partial pressures 
%in arterial blood leaving each alveolus: 
Pa=H(ca); 
% 
%vector of oxygen partial pressures 
%in alveolar air: 
PA=Pa; 
% 
%vector of oxygen concentrations 
%in alveolar air: 
cA=PA/RT; 
% 
%concentrations and partial pressures 
%for the whole organism: 
%(write out these results) 
%oxygen concentration in (systemic) venous blood: 
cV 
% 
%mean arterial oxygen concentration: 
cabar=Q'*ca/sum(Q) 
% 
%mean alveolar oxygen concentration: 
cAbar=VA'*cA/sum(VA) 
% 
%oxygen concentration is the inspired air: 
cI
% 
%oxygen partial pressure in venous blood: 
Pv=H(cV) 
% 
%mean arterial oxygen partial pressure: 
Pabar=H(cabar) 
% 
%mean alveolar oxygen partial pressure: 
PAbar=RT*cAbar 
% 
%oxygen partial pressure in the inspired air: 
PI=RT*cI
% 
%check that partial pressures are in expected order 
if((Pv < Pabar)&(Pabar <= PAbar)&(PAbar < PI)) 
    'partial pressures ordered as expected'
else 
    'WARNING: partial pressures NOT ordered as expected' 
    Pv 
    Pabar 
    PAbar 
    PI 
end 
% 
%check that all equations are satisfied 
%output a measure of relative residual in each case 
%first consider individual-alveolus equations: 
fba= Q.*(ca-cV); 
faa=VA.*(cI-cA); 
checkl=max(abs(fba-faa))/max(abs(fba)) 
check2=max(abs(PA-Pa))/max(abs(PA)) 
check3=max(abs(PA-RT*cA))/max(abs(PA)) 
ca_check=cstar*((Pa/Pstar).^3)./(1+(Pa/Pstar).^3); 
check4=max(abs(ca-ca_check))/max(abs(ca)) 
% 
%now check that total rate of oxygen transport 
%matches rate of consumption 
fb=Q'*(ca-cV); %=sum(Q. •(ca-cV)) 
fa=VA'*(cI-cA); %=sum(VA.•(ci-cA)) 
check5=abs(M-fb)/abs(M) 
check6=abs(M-fa)/abs(M) 
% 
%plot various results 
%against the ventilation-perfusion ratio, r: 
%(plot individual points instead of lines 
%since r values are not in order) 
%define vector with all unit entries: 
u=ones(n,1); 
cblood=[cV*u cabar*u ca]; 
cair= [cI*u cAbar*u cA]; 
Pressures=[Pv*u Pabar*u PAbar*u PI*u Pa PA]; 
figure(2) 
subplot(2,1,1),plot(r,cblood,'.') 
subplot(2,1,2),plot(r,cair ,'.') 
figure(3) 
plot(r,Pressures,'.') 