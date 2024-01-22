clc, clear, clearvars, close all

% Define temperature range from 260 K to 420 K with intervals of 0.5 K
T = 100 : 1/2 : 420;

% Calculate the parameter beta using the given resistance values at two temperature points
beta = log(1.4e3/1e4) / (1/358.15 - 1/298.15);

% Set reference resistance and temperature values
R0 = 1e4;
T0 = 298.15;

% Calculate resistance values using the Steinhart-Hart equation
R = R0 * exp(beta * (1 ./ T - 1/T0));


% Set position vector for figure windows
pos_vector = [250, 100, 1000, 650];

% Plot 1: Resistance vs. Temperature (semilogarithmic scale)
f = figure(1);
f.Position = pos_vector;
semilogy(T, R), grid on;
xlim([100 400])
xlabel("Temperature [K]"), ylabel("Resistance [Ω]"), title("Resistance - Temperature")

f = figure(2);
f.Position = pos_vector;
plot(T, R), grid on;
xlim([260 400])
xlabel("Temperature [K]"), ylabel("Resistance [Ω]"), title("Resistance - Temperature")

% % Define dissipation constant and reference temperature
% dissipation_constant = 4.5e-3;
% T0 = 298.15;
% 
% % Calculate power, voltage, and current
% P = dissipation_constant * (T - T0);
% V = sqrt(R .* P);
% I = sqrt(P ./ R);
% 
% % Plot 3: Current vs. Temperature (log-log scale)
% f = figure(3);
% f.Position = pos_vector;
% loglog(T, I), grid on;
% xlabel("Temperature [K]"), ylabel("Current [A]"), title("Current - Temperature")
% 
% % Plot 4: Voltage vs. Temperature (log-log scale)
% f = figure(4);
% f.Position = pos_vector;
% loglog(T, V), grid on;
% xlabel("Temperature [K]"), ylabel("Voltage [V]"), title("Voltage - Temperature")
% 
% % Plot 5: Current vs. Voltage (log-log scale)
% f = figure(5);
% f.Position = pos_vector;
% loglog(V, I), grid on;
% xlabel("Voltage [V]"), ylabel("Current [A]"), title("Current - Voltage")
