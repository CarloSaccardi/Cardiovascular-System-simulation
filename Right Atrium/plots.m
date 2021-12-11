%script to plot results of computer simulation 
%left ventricular pressure and sistemic arteries pressure 
figure(1)  
plot(t_plot,P_plot([iLV,isa],:)) 
xlabel('Time')
ylabel('Pressure')
legend('left ventricular pressure','systemic arteries pressure')
%subplot(2,1,2),plot(t_plot,Q_plot([jMi,jAo],:))

%systemic and pulmonary flows: 
%%%%%%%%%%%%%figure(2) 
%%%%%%%%%plot(t_plot,Q_plot([js,jp],:)) 

%pressure-volume loops for both ventricles 
figure(3)
plot(V_plot(iLV,:),P_plot(iLV,:)) 
xlabel('Volume')
ylabel('Left Ventricle pressure')

%aortinc pressure gradient
figure(4)
plot(t_plot,Pdiff_plot(jAo,:))
xlabel('time')
ylabel('Peak pressure gradient')
%subplot(3,1,1),plot(t_plot,Pdiff_plot([jAo,jMi],:))
%subplot(3,1,2),plot(t_plot,Pdiff_plot(jAo,:))%lv_p - sa_p
%subplot(3,1,3),plot(t_plot,Pdiff_plot(jMi,:))%pv_p - lv_p

%left ventricle volume
%%%%%%%figure(5)
%%%%%%%%plot(t_plot, V_plot(iLV,:))
