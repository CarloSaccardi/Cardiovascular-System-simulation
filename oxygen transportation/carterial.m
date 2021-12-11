function ca=carterial(cV,r) 
%filename: carterial.m 
global camax n maxcount;
%initialize: 
ca_lower=zeros(n,1);    %lower end of intervall
ca_upper=ones(n,1)*camax;   %upper end of intervall
ca=(ca_lower+ca_upper)/2;   %midpoint of intervall
%start main loop: 
for count=1:maxcount 
    %check sign of function at midpoint of interval:
    pos=(phi(ca,cV,r)>0); 
    neg=~pos;  
    %if (phi>O) ca_upper=ca; else ca_lower=ca: 
    ca_upper=ca_upper.*neg+ca.*pos; 
    ca_lower=ca_lower.*pos+ca.*neg; 
    %ca=idpoint of new interval: 
    ca=(ca_lower+ca_upper)/2; 
end