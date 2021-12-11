%script to find self-consistent valve states and pressures: 
done=0; %not done yet! 
while(~done) %if not done, keep trying
    S_noted=S; %note valve states, at start S is a NxN zero matrix--> all valves are closed
%set pressures based on valve states: 
    P=P_new(P_old,C_old,C,S); 
%then set valve states based on pressures: 
    P_matrix=P*ones(1,N); 
    S=((P_matrix) > (P_matrix')); 
%done if all valve states are unchanged: 
    done=all(all(S==S_noted)); 
end 