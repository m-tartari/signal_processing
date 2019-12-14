w0 = 2;
G = 1;
ts = 0.1;
t_span=[0 8];
alpha_nom=0.3;
alpha = alpha_nom;
alpha_tilde= alpha - alpha_nom;

num = [G*w0^2];
den = [1 0 w0 0];

A = [0 1; -w0^2 0];
B = [0 G*w0^2]';
C = [1 0];
D = [0];


%continuous
tf_c = tf(num, den) % transfer function
ss_c = ss(A, B, C, D); % state space

%discrete
tf_d = c2d(tf_c, ts, 'zoh');
[num_d, den_d] = tfdata(tf_d); % transfer function
ss_d = c2d(ss_c, ts, 'zoh'); % state space



t_clock = tic;
[t, x] = ode45(@(t,x) navettecontinue (t, x, A, B), t_span, [0 alpha_tilde]); % Use ode45 for continuous system
elapsed_t1 = toc (t_clock) % elapsed time for continous

plot (t, x(:, 1)+ alpha_nom, 'b'); %plot alpha
hold on
xlabel('Time (s)');
title(' Plot alpha for cont and disc SS models ', 'Interpreter', 'Latex');
l1=legend('$\alpha$ continuous','$\alpha$ discrete');
l1.set('Interpreter', 'latex');
grid;

[At, Bt, Ct, Dt] = ssdata(ss_d);
t_clock = tic; 
[n, x] = ore(@(n,x) navettediscrete(n, x, At, Bt, ts), t_span/ts , [0 alpha_tilde]) ; % Use ode45 for continuous system
elapsed_t2 = toc (t_clock) %elapsed time for discrete
n = n*ts;
plot(n, x(:,1)+alpha_nom, 'rx');
hold off;
