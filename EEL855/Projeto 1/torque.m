q_home = [0 15 180 230 0 55 90]* pi /180;

jacobiano_no_home = kinova.jacob0(q_home);

% Força de 25N na terceira junta
torque = (jacobiano_no_home') * [0; 0; 25; 0; 0; 0;];

disp(torque)