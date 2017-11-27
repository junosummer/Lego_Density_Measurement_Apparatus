
% Establish connection with the NXT brick
MyNXT = COM_OpenNXT('');
COM_SetDefaultNXT(MyNXT);

%Lower the water platform

% Set up parameters for driving the motor
mA = NXTMotor('C'); % associate mA with the motor connected to port C
mA.SmoothStart = 0; % do not use the smooth start option
mA.SpeedRegulation = 0; % do not use the speed regulation option
mA.Power = -10; % drive the motor at 40% power in the negative direction

% Reset the stopwatch
tic;

% Display a message on the console
disp('Starting lowering platform');

% Send the information in mA to the motor - it will now start turning
mA.ResetPosition(); % establish the motor's current position as the zero position
mA.SendToNXT(); % start the motor
motor_running = true; % this is a variable we use to keep track of the motor's state

% Keep iterating while the stopwatch reads less than five seconds
while toc < 8 && motor_running == true

    % After 3 seconds, apply the brakes. This will only happen once,
    % because on the next iteration the motor will no longer be running.
    % && means "AND", so we only apply the brakes if the stopwatch reads
    % more than 2 seconds and the motor is still running.
    if (motor_running && toc > 5) % Wait for further data to determine the 
        mA.Stop('brake'); % stop the motor
        motor_running = false; % keep track of the fact that the motor has stopped
    end

end

% The brake is still applied at this point (try to turn the motor manually),
% consuming a lot of power, so now we will really turn it off
mA.Stop('off');

% Display a message on the console
disp('Stopping lowering platform');

% Establish connection to a light sensor connected to sensor port 1
% Use active mode (i.e. LED on)
OpenLight(SENSOR_1, 'INACTIVE');

% Reset the stopwatch
tic;

% Create an empty matrix to store standard measurement
standard_light_measurement = [];

% Display a message on the console
disp('Starting standard light measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 3
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current light sensor reading (second column)
    standard_light_measurement = [standard_light_measurement; toc  GetLight(SENSOR_1)];
end

% Close connection to the light sensor, power down LED
CloseSensor(SENSOR_1);

% Display a message on the console
disp('Stopping standard light measurement');

disp('Put the object on the weighing platform');

% Reset the stopwatch
tic;

% Wait 10 seconds
while toc < 10

end

% Establish connection to a light sensor connected to sensor port 1
% Use active mode (i.e. LED on)
OpenLight(SENSOR_1, 'INACTIVE');

% Reset the stopwatch
tic;

%Create an empty matix to store the mass_measurement
mass_measurement = [];

% Display a message on the console
disp('Starting mass measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 3
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current light sensor reading (second column)
    mass_measurement = [mass_measurement; toc  GetLight(SENSOR_1)];
end
   
% Close connection to the light sensor, power down LED
CloseSensor(SENSOR_1);

% Display a message on the console
disp('Stopping mass measurement');

% Set up parameters for driving the motor
mA = NXTMotor('A'); % associate mA with the motor connected to port A
mA.SmoothStart = 0; % do not use the smooth start option
mA.SpeedRegulation = 0; % do not use the speed regulation option
mA.Power = 30; % drive the motor at 40% power in the negative direction

% Reset the stopwatch
tic;

% Display a message on the console
disp('Starting tilting the platform');

% Send the information in mA to the motor - it will now start turning
mA.ResetPosition(); % establish the motor's current position as the zero position
mA.SendToNXT(); % start the motor
motor_running = true; % this is a variable we use to keep track of the motor's state

% Keep iterating while the stopwatch reads less than five seconds
while toc < 5 && motor_running

    % After 3 seconds, apply the brakes. This will only happen once,
    % because on the next iteration the motor will no longer be running.
    % && means "AND", so we only apply the brakes if the stopwatch reads
    % more than 2 seconds and the motor is still running.
    if (motor_running && toc > 4) % Wait for further data to determine the 
        
	mA.Stop('brake');
	motor_running = false; % keep track of the fact that the motor has stopped
    end

end

mA.Stop('off');

% The brake is still applied at this point (try to turn the motor manually),
% consuming a lot of power, so now we will really turn it off

mA.Power = -30;

mA.SendToNXT();
motor_running = true;

tic;

while toc < 5 && motor_running
    % After 3 seconds, apply the brakes. This will only happen once,
    % because on the next iteration the motor will no longer be running.
    % && means "AND", so we only apply the brakes if the stopwatch reads
    % more than 2 seconds and the motor is still running.
    if (motor_running && toc > 3.5) % Wait for further data to determine the 
        
	mA.Stop('brake');
	motor_running = false; % keep track of the fact that the motor has stopped
    end

end


mA.Stop('off');

% Display a message on the console
disp('Stopping tilting the platform');

disp('Move the light sensor');

% Wait 15 seconds to move the light sensor

tic;

while toc < 10

end

% Take the sandard water level measurement

% Establish connection to a light sensor connected to sensor port 1
% Use active mode (i.e. LED on)
OpenLight(SENSOR_1, 'INACTIVE');

% Reset the stopwatch
tic;

% Create an empty matrix to store standard measurement
standard_water_level_measurement = [];

% Display a message on the console
disp('Starting standard water level measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 3
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current light sensor reading (second column)
    standard_water_level_measurement = [standard_water_level_measurement; toc  GetLight(SENSOR_1)];
end

% Close connection to the light sensor, power down LED
CloseSensor(SENSOR_1);

% Display a message on the console
disp('Stopping standard water level measurement');

% Use belt to transport the object

% Set up parameters for driving the motor
mA = NXTMotor('B'); % associate mA with the motor connected to port B
mA.SmoothStart = 0; % do not use the smooth start option
mA.SpeedRegulation = 0; % do not use the speed regulation option
mA.Power = 50; % drive the motor at 40% power in the negative direction

% Reset the stopwatch
tic;

% Display a message on the console
disp('Starting belt');

% Send the information in mA to the motor - it will now start turning
mA.ResetPosition(); % establish the motor's current position as the zero position
mA.SendToNXT(); % start the motor
motor_running = true; % this is a variable we use to keep track of the motor's state

% Keep iterating while the stopwatch reads less than five seconds
while toc < 10 && motor_running

    % After 3 seconds, apply the brakes. This will only happen once,
    % because on the next iteration the motor will no longer be running.
    % && means "AND", so we only apply the brakes if the stopwatch reads
    % more than 2 seconds and the motor is still running.
    if (motor_running && toc > 5) % Wait for further data to determine the 
        mA.Stop('brake'); % stop the motor
        motor_running = false; % keep track of the fact that the motor has stopped
    end

end

% The brake is still applied at this point (try to turn the motor manually),
% consuming a lot of power, so now we will really turn it off
mA.Stop('off');

% Display a message on the console
disp('Stopping belt');

tic;

while toc < 5

end


% Take volume measurement

% Establish connection to a light sensor connected to sensor port 1
% Use inactive mode (i.e. LED off)
OpenLight(SENSOR_1, 'INACTIVE');

% Reset the stopwatch
tic;

% Create an empty matrix to store standard measurement
new_water_level_measurement = [];

% Display a message on the console
disp('Starting new water level measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 3
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current light sensor reading (second column)
    new_water_level_measurement = [new_water_level_measurement; toc  GetLight(SENSOR_1)];
end

% Close connection to the light sensor, power down LED
CloseSensor(SENSOR_1);

% Display a message on the console
disp('Stopping new water level measurement');

% Lift the water platform

% Set up parameters for driving the motor
mA = NXTMotor('C'); % associate mA with the motor connected to port C
mA.SmoothStart = 0; % do not use the smooth start option
mA.SpeedRegulation = 0; % do not use the speed regulation option
mA.Power = 40; % drive the motor at 40% power in the negative direction

% Reset the stopwatch
tic;

% Display a message on the console
disp('Lifting platform');

% Send the information in mA to the motor - it will now start turning
mA.ResetPosition(); % establish the motor's current position as the zero position
mA.SendToNXT(); % start the motor
motor_running = true; % this is a variable we use to keep track of the motor's state

% Keep iterating while the stopwatch reads less than five seconds
while toc < 5 && motor_running == true

    % After 3 seconds, apply the brakes. This will only happen once,
    % because on the next iteration the motor will no longer be running.
    % && means "AND", so we only apply the brakes if the stopwatch reads
    % more than 2 seconds and the motor is still running.
    if (motor_running && toc > 2) % Wait for further data to determine the 
        mA.Stop('brake'); % stop the motor
        motor_running = false; % keep track of the fact that the motor has stopped
    end

end

% The brake is still applied at this point (try to turn the motor manually),
% consuming a lot of power, so now we will really turn it off
mA.Stop('off');

% Display a message on the console
disp('Platform lifted');

mass_base = ex_mean(standard_light_measurement);

mass_light = ex_mean(mass_measurement);

mass = -0.00272 * (mass_light - mass_base);

%mass = -0.00272 * mass_ligh + mass_base;

height_base = ex_mean(standard_water_level_measurement);

height_light = ex_mean(new_water_level_measurement);

height = -0.00036 * (height_light - height_base);

if height < 0
    
    height = height * -1;
    
end

cross_area = 0.0181;

volume = height * cross_area;

density = mass / volume;

fprintf('The density of the object is %f kg/m^3. \n', density)

% Close connection to the NXT brick
COM_CloseNXT(MyNXT);
