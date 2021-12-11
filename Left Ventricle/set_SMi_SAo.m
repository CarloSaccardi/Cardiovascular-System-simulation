%This program determine the state of the valves.        
%--> self consistent choice of the valve states and the pressures
done = 0;
while(~done)% ~ is the logical operator NOT
    SMi_noted = SMi;
    SAo_noted = SAo;
    %set pressure based on valve states
    [PLV, Psa]= PLV_Psa_new(PLV_old, Psa_old, CLV_old, CLV, SMi, SAo);
    %then set valve states based on pressurs
    SMi=(PLA>PLV); % 1 if PLA>PLV, 0 otherwise 
    SAo=(PLV>Psa);% 1 if PLV>PSA, 0 otherwise
    %this cycle stops only if both valve states are unchanged:
    done= (SMi==SMi_noted)&(SAo==SAo_noted); % 1 if true, 0 otherwise
end
%NOTICE, this while loop in not a loop over time therefor Plv_old,
%Psa_old, Clv_old, Clv all reamin constant
    