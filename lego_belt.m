% Establish connection with the NXT brick
MyNXT = COM_OpenNXT();
COM_SetDefaultNXT(MyNXT);
% Delete this command when merging into the final programs.

% Set up parameters for driving the motor
mA = NXTMotor('B'); % associate mA with the motor connected to port B
mA.SmoothStart = 0; % do not use the smooth start option
mA.SpeedRegulation = 0; % do not use the speed regulation option
mA.Power = 10; % drive the motor at 40% power in the negative direction

% Reset the stopwatch
tic;

% Display a message on the console
disp('Starting belt');

% Send the information in mA to the motor - it will now start turning
mA.ResetPosition(); % establish the motor's current position as the zero position
mA.SendToNXT(); % start the motor
motor_running = true; % this is a variable we use to keep track of the motor's state

% Keep iterating while the stopwatch reads less than five seconds
while toc < 10 && motor_running == true

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

% Close connection to the NXT brick
COM_CloseNXT(MyNXT);


