A = [0,0,1,0; 0,0,0,1; 13.67,-15.93275,-0.574,-1.932; 4.857,-2.97125,12.6735,-8.358];
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

% Frequency Response and Stability Analysis
tf_sys2 = (0.3069/2) * tf_sys1;
nyquist(tf_sys2);

tf_sys3 = (2 * 0.03609) * tf_sys1;
nyquist(tf_sys3);

bode(tf_sys2);

[GM, PM, ~] = margin(tf_sys2);
disp(PM);
disp(20 * log10(GM));
