


%% Next Paper
M = 3;
T = 24; % (hours)
taum = [12; 17];
taum = [taum(2)-T; taum];
sigma = 2.8;
A = 0.75; % Determines average value ot psi

clear psi;
clear t_index;
index = 1;

for t=min(taum):0.1:T
    
    % Calculate PSImin
    tmp = zeros(M,1);
    for m=1:M
        tmp(m) = sum(A*exp(-((t-taum(m))/sigma).^2));
    end
    psi_min = min( tmp );
    
    
    % Calculate
    psi(index) = psi_min + sum(A*exp(-((t-taum)/sigma).^2));
    t_index(index) = t;
    
    index = index + 1;
end


plot(t_index,psi);
grid on;
xlabel('Time of Day (Hours)');
ylabel('Duty Cycle');



