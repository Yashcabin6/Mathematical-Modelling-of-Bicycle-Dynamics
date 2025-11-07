A = [0,0,1,0; 0,0,0,1; 13.67,0.225,0,0; 4.857,10.81,0,0];
B = [0; 0; -0.339; 7.457];
C = [1,0,0,0];
D = [0];

sys1 = ss(A,B,C,D);
tf_sys1 = tf(sys1);
eigen1 = eig(A);
zero(tf_sys1);

u0 = [1; 6; 6; 4];
initial(sys1, u0);

% Step Response
[y, t] = step(tf_sys1);
plot(t, y);
xlabel('Time');
ylabel('Amplitude');
title('Step Response');
rlocus(tf_sys1);
