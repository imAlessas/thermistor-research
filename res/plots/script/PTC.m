clc, clf, clear, clearvars

% Define temperature range from 260 K to 420 K with intervals of 0.5 K
T = 260 : 1/2 : 420;

% Calculate the parameter beta using the given resistance values at two temperature points
beta = log(1e4/1e8) / (1/273.15 - 1/373.15);

% Set reference resistance and temperature values
R0 = 1e4;
T0 = 273.15;

% Calculate resistance values using the Steinhart-Hart equation
R = R0 * exp(beta * (1 ./ T - 1/T0));

% Calculate resistance ratio normalized to the resistance at 25°C
R_ratio = R ./ R((25 + 273 - 260) * 2);

% Plot 1: Resistance vs. Temperature (semilogarithmic scale)
figure(1)
semilogy(T, R), grid on;
xlim([270 420]);
xlabel("Temperature [K]"), ylabel("Resistance [Ω]")

% Plot 2: Resistance Change (R/R25) vs. Temperature
figure(2)
plot(T, R_ratio), grid on;
xlim([300 420]), ylim([-500 1e4])
xlabel("Temperature [K]"), ylabel("Resistance Change (R/R25)")
