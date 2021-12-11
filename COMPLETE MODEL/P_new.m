%This function finds the pressure given the states of the valves 
function P=P_new(P_old,C_old,C,S) 
global G dt CHECK N; 
A=-dt*((S.*G)+(S.*G)'); 
A=diag(C-(sum(A))')+A; 
P=A\(C_old.*P_old); 
if (CHECK) 
    for i=1:N 
        CH(i)=-(C(i)*P(i)-C_old(i)*P_old(i))/dt; 
        for j=1 :N 
            CH(i)=CH(i)+S(j,i)*G(j,i)*(P(j)-P(i)); 
            CH(i)=CH(i)-S(i,j)*G(i,j)*(P(i)-P(j)); 
        end 
    end 
CH %Write out the values of CH, 
%which should be zero to within roundoff. 
end