N1 = A1 * v1;
N2 = A1 * v2;
N3 = A1 * v3;
N = [N1 N2 N3];

V = [v1 v2 v3];
pos = find(y==1); neg = find(y == 0);

Plot Examples
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

plot3(v1,v2,v3, 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 3);
hold on;
plot3(M1,M2,M3, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 3);
grid on;
legend('patient', 'normal people')
xlabel('Feature No.1')
ylabel('Feature No.2')
zlabel('Feature No.3')

plot3(N1,N2,N3, 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 3);
hold on;
plot3(M1,M2,M3, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 3);
grid on;
legend('patient', 'normal people')
xlabel('Feature No.1')
ylabel('Feature No.2')
zlabel('Feature No.3')

figure;
plot(v1,v2, 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 3);
hold on;
plot(M1,M2, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 3);
legend('patient', 'normal people')
xlabel('Feature No.1')
ylabel('Feature No.2')
