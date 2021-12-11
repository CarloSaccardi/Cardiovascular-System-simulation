function c=phi(ca,cV,r) 
%filename :phi.m 
global RT cI; 
c=ca-cV+r.*(H(ca)/RT-cI);