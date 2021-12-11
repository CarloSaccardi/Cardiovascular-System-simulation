function Md=Mdiff(cV,r) 
%filename: Mdiff.m 
global M Q; 
%Md=M-sum(i=l:n)(Q(i)*(carterial(cv,r(i))-cv)): 
Md=M-Q'*(carterial(cV,r)-cV)