%filename: circ_out.m 
%script to plot results of computer simulation 
%of the entire circulation. 
%left ventricular compliance, pressures, and flows: 
figure(1) 
subplot(3,1,1),plot(t_plot,C_plot(iLV,:)) 
xlabel('Time')
ylabel('Compliance')
subplot(3,1,2),plot(t_plot,P_plot([ipv,iLV,isa],:)) 
xlabel('Time')
ylabel('Pressure')
legend('pulmonary veins', 'Left ventricle', 'systemic arteries')
subplot(3,1,3),plot(t_plot,Q_plot([jMi,jAo],:)) 
xlabel('Time')
ylabel('Flow')
legend('Mitral flow', 'Aortic flow')


%right ventricular compliance, pressures, and flows: 
figure(2) 
subplot(3,1,1),plot(t_plot,C_plot(iRV,:)) 
xlabel('Time')
ylabel('Compliance')

subplot(3,1,2),plot(t_plot,P_plot([isv,iRV,ipa],:)) 
xlabel('Time')
ylabel('Pressure')
legend('systemic veins', 'Right ventricle', 'pulmonary arteries') 

subplot(3,1,3),plot(t_plot,Q_plot([jTr,jPu],:)) 
xlabel('Time')
ylabel('Flow')
legend('Tricuspid flow', 'Pulmonic flow')



%systemic and pulmonary flows: 
figure(3) 
subplot(2,1,1),plot(t_plot,Q_plot([jMi,jAo],:)) 
xlabel('Time')
ylabel('Flow')
legend('Mitral flow', 'Aortic flow')
subplot(2,1,2),plot(t_plot,Q_plot([js,jp],:)) 
xlabel('Time')
ylabel('Flow')
legend('Systemic flow', 'Pulmonary flow')


figure(4)%pressure-volume loops for both ventricles 
subplot(2,1,1),plot(V_plot(iLV,:),P_plot(iLV,:)) 
xlabel('Volume')
ylabel('Pressure')
legend('Left ventricle')
subplot(2,1,2),plot(V_plot(iRV,:),P_plot(iRV,:)) 
xlabel('Volume')
ylabel('Pressure')
legend('Right ventricle')


figure(5)
plot(C_plot(iLV,:),P_plot([ipv,iLV,isa],:))


figure(6)
plot(t_plot,Pdiff_plot(jAo,:))
%subplot(3,1,1),plot(t_plot,Pdiff_plot([jAo,jMi],:))
%subplot(3,1,2),plot(t_plot,Pdiff_plot(jAo,:))%lv_p - sa_p
%subplot(3,1,3),plot(t_plot,Pdiff_plot(jMi,:))%pv_p - lv_p
figure(7)
subplot(3,1,1),plot(C_plot(iLV,:),Pdiff_plot([jAo,jMi],:))
subplot(3,1,2),plot(C_plot(iLV,:),Pdiff_plot(jAo,:))%lv_p - sa_p
subplot(3,1,3),plot(C_plot(iLV,:),Pdiff_plot(jMi,:))%pv_p - lv_p
figure(7)



figure(8) 
subplot(3,1,1),plot(t_plot,C_plot(iLV,:)) 
xlabel('Time')
ylabel('Compliance')
subplot(3,1,2),plot(t_plot,P_plot([ipv,iLV,isa],:)) 
xlabel('Time')
ylabel('Pressure')
legend('pulmonary veins', 'Left ventricle', 'systemic arteries')
subplot(3,1,3),plot(t_plot,V_plot(iLV,:)) 
xlabel('Time')
ylabel('Volume')




