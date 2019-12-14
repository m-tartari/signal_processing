Simulink_B_8_4
whos step alpha_c alpha_d
%plot(step,alpha_c,'b');
hold on
%stairs(step,alpha_d,'r');

xlabel('Time (s)');
title(' Plot alpha for continous and discrete Openloop model', 'Interpreter', 'Latex');
l1=legend('$\alpha$ continuous','$\alpha$ discrete');
l1.set('Interpreter', 'latex');
grid;

hold off