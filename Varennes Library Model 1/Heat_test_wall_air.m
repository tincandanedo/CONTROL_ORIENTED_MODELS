% define energy balance model
function dTdt = Heat_test_original_pure_air(t,var,To_inp,Q1_inp,Q2_inp,S_inp,Tg_inp)
T1=var(1);
T2=var(2);
T3=var(3);
T4=var(4);
T5=var(5);
T6=var(6);
T7=var(7);
T8=var(8);
T10=var(9);
T11=var(10);
T12=var(11);
T13=var(12);
T14=var(13);
T15=var(14);
T16=var(15);
T17=var(16);
U06=2.09;
U01=6.3216*0.7;
U61=abs(433)*5;
U67=0.56*1056*5;
U62=0.44*1056*5;
% U17=abs(0.56*1056)*4;
U17=abs((0.56*1056)*(1.52*(T7-T1)^(1/3)));
% U17=20000;
% U12=abs(0.44*1056)*4;
U12=abs((0.44*1056)*(1.52*(T2-T1)^(1/3)));
% U12=20000;
U23=3.9525;
U78=1.676;
U34=1.975;
U810=((0.56*1056)*(1.01*(abs(T10-T8))^(1/3)));
U45=1.9751;
U510=((0.44*1056)*(1.01*(abs(T10-T5))^(1/3)));
U015=8.5623;
U010=7.2237*1.2; 
U1516=0.75*1056*5;
U1510=(433)*5;
U1511=0.25*1056*5;
% U1016=abs(0.75*1056)*4;
% U1011=abs(0.25*1056)*4;
U1016=abs((0.75*1056)*(1.52*(T16-T10)^(1/3)));
U1011=abs((0.25*1056)*(1.52*(T11-T10)^(1/3)));
% U1016=20000;
% U1011=20000;
U1617=2.2447;
U1112=2.2447;
U1213=1.12;
U1314=1.12;
C3=6.98;
C5=6.98;
C8=1.774;
C12=3.962;
C14=3.96;
C17=2.38;
b=0.8+0.2;
C1=4.22;
C10=4.22;
kef=1.3;
C6=5.3;
C15=5.3;

To = interp1(1:900:86400*4,To_inp,t);
Q1 = interp1(1:900:86400*4,Q1_inp,t);
Q2 = interp1(1:900:86400*4,Q2_inp,t);
S = interp1(1:900:86400*4,S_inp,t);
Tg=interp1(1:900:86400*4,Tg_inp,t);


% Nonlinear Energy Balances
dTdt(1,1) = (1.0/(C1*1e+7))*((T6-T1)*U61+(To-T1)*U01*100+(T7-T1)*U17+(T2-T1)*U12);
dTdt(2,1)=(T1*U12+T3*U23*10000+T6*U62+0.154*S)/(U12+U23*10000+U62)-T2;
dTdt(3,1) = (1.0/(kef*C3*1e+7))*((T4-T3)*U34*10000+(T2-T3)*U23*10000);
dTdt(4,1)=(T3*U34*10000+T5*U45*10000+Q1)/(U34*10000+U45*10000)-T4;
dTdt(5,1)=(1/(kef*C5*1e+7))*((T4-T5)*U45*10000+(T10-T5)*U510);
dTdt(6,1)=(1.0/(kef*C6*1e+6))*((To-T6)*U06*100+(T1-T6)*U61+(T7-T6)*U67+(T2-T6)*U62+0.15*S)
dTdt(7,1)=(T6*U67+T1*U17+T8*U78*10000+0.196*S)/(U67+U17+U78*10000)-T7;
dTdt(8,1)=(1/(kef*C8*1e+8))*((T7-T8)*U78*10000+(T10-T8)*U810);
dTdt(9,1)= (1/(C10*1e+7))*((T8-T10)*U810+(T5-T10)*U510+(T16-T10)*U1016+(T11-T10)*U1011+(T15-T10)*U1510+(To-T10)*U010*100+0.37*Q2);
dTdt(10,1)=-T11+(T10*U1011+T12*U1112*10000+T15*U1511+0.08*S)/(U1011+U1112*10000+U1511);
dTdt(11,1)=(1/(kef*C12*1e+7))*((T11-T12)*U1112*10000+(T13-T12)*U1213*10000);
dTdt(12,1)=(T12*U1213*10000+T14*U1314*10000+0.67*Q2)/(U1213*10000+U1314*10000)-T13;
dTdt(13,1)=(1/(kef*C14*1e+7))*((T13-T14)*U1314*10000+(To-T14+6)*0*U010/2);
dTdt(14,1)=(1/(kef*C15*1e+6))*((To-T15)*U015*10+(T16-T15)*U1516+(T10-T15)*U1510+(T11-T15)*U1511+0.15*S);
dTdt(15,1)=(T15*U1516+T10*U1016+T17*U1617*10000+0.27*S)/(U1516+U1016+U1617*10000)-T16;
dTdt(16,1)=(1/(kef*C17*1e+8))*((T16-T17)*U1617*10000+(To-T16+6)*0*U010/2);
end

% T1=var(1);
% T2=var(2);
% T3=var(3);
% T4=var(4);
% T5=var(5);
% T6=var(6);
% T7=var(7);
% T8=var(8);
% T10=var(9);
% T11=var(10);
% T12=var(11);
% T13=var(12);
% T14=var(13);
% T15=var(14);
% T16=var(15);
% T17=var(16);
% U06=1.61;
% U01=6.858;
% U61=1.686;
% U67=4.225*2;
% U62=4.225*2;
% U17=abs((0.56*1056)*(1.52*(T7-T1)^(1/3)));
% % U17=20000;
% U12=abs((0.44*1056)*(1.52*(T2-T1)^(1/3)));
% % U12=20000;
% U23=3.9525;
% U78=1.676;
% U34=1.975;
% U810=3;
% U45=1.9751;
% U510=3.943;
% U015=8.5623;
% U010=7.33*1.2; 
% U1516=4.225*2;
% U1510=7.358;
% U1511=4.225*2;
% U1016=abs((0.75*1056)*(1.52*(T16-T10)^(1/3)));
% U1011=abs((0.25*1056)*(1.52*(T11-T10)^(1/3)));
% % U1016=20000;
% % U1011=20000;
% U1617=2.2447;
% U1112=2.2447;
% U1213=1.12;
% U1314=1.12;
% b=50;
% C3=6.692;
% C5=6.692;
% C8=1.703;
% C12=3.802;
% C14=3.802;
% C17=2.281;
% C1=4.11*b;
% C10=4.11*b;

% dTdt(1,1) = (1.0/(C1*1e+6))*((T6-T1)*U61*10000+(To-T1)*U01*100+(T7-T1)*U17+(T2-T1)*U12);
% dTdt(2,1)=(T1*U12+T3*U23*10000+T6*U62*1000+0.08*S)/(U12+U23*10000+U62*1000)-T2;
% dTdt(3,1) = (1.0/(C3*1e+7))*((T4-T3)*U34*10000+(T2-T3)*U23*10000);
% dTdt(4,1)=(T3*U34*10000+T5*U45*10000+Q1)/(U34*10000+U45*10000)-T4;
% dTdt(5,1)=(1/(C5*1e+7))*((T4-T5)*U45*10000+(T10-T5)*U510*100);
% dTdt(6,1)=(To*U06*100+T1*U61*10000+T7*U67*1000+T2*U62*1000+0.15*S)/(U06*100+U61*10000+U67*1000+U62*1000)-T6;
% dTdt(7,1)=(T6*U67*1000+T1*U17+T8*U78*10000+0.27*S)/(U67*1000+U17+U78*10000)-T7;
% dTdt(8,1)=(1/(C8*1e+8))*((T7-T8)*U78*10000+(T10-T8)*U810*100);
% dTdt(9,1)= (1/(C10*1e+6))*((T8-T10)*U810*100+(T5-T10)*U510*100+(T16-T10)*U1016+(T11-T10)*U1011+(T15-T10)*U1510*1000+(To-T10)*U010*100+0.37*Q2);
% dTdt(10,1)=-T11+(T10*U1011+T12*U1112*10000+T15*U1511*1000+0.08*S)/(U1011+U1112*10000+U1511*1000);
% dTdt(11,1)=(1/(C12*1e+7))*((T11-T12)*U1112*10000+(T13-T12)*U1213*10000);
% dTdt(12,1)=(T12*U1213*10000+T14*U1314*10000+0.67*Q2)/(U1213*10000+U1314*10000)-T13;
% dTdt(13,1)=(1/(C14*1e+7))*((T13-T14)*U1314*10000);
% dTdt(14,1)=(To*U015*10+T16*U1516*1000+T10*U1510*1000+T11*U1511*1000+0.15*S)/(U015*10+U1516*1000+U1510*1000+U1511*1000)-T15;
% dTdt(15,1)=(T15*U1516*1000+T10*U1016+T17*U1617*10000+0.27*S)/(U1516*1000+U1016+U1617*10000)-T16;
% dTdt(16,1)=(1/(C17*1e+8))*((T16-T17)*U1617*10000);


% aze=(varsol(:,6)*U67+varsol(:,1)*U17+varsol(:,8)*U78+0.27*S)/(U67+U17+U78)-varsol(:,7);