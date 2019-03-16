figure;
plot3((N1 + 20) ./ 40,(N2 + 15) * 151,(N3 + 10) * 100, 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 3);
hold on;
% plot3(M1,M2,M3, 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 3);
grid on;
% legend('patient', 'normal people')
% xlabel('Feature No.1')
% ylabel('Feature No.2')
% zlabel('Feature No.3')
ylabel('The Number of Registers')
zlabel('Number of Times Rename Has Blocked Due to ROB Full')
xlabel('Cache missing rate')

figure;
plot3((N1 + 20) ./ 40,(N3 + 10) * 11,(N2 + 10 ) * 100, 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 3);
hold on;
% plot3(M1,M2,M3, 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 3);
grid on;
% legend('patient', 'normal people')
% xlabel('Feature No.1')
% ylabel('Feature No.2')
% zlabel('Feature No.3')
ylabel('The number of buffer entries')
zlabel('Number of Times Rename Has Blocked Due to ROB Full')
xlabel('Cache missing rate')


figure;
plot(v1,v2, 'ko', 'MarkerFaceColor', 'r', 'MarkerSize', 3);
hold on;
plot(M1,M2, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 3);
legend('patient', 'normal people')
xlabel('Feature No.1')
ylabel('Feature No.2')
