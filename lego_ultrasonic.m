% Establish connection with the NXT brick
MyNXT = COM_OpenNXT('');
COM_SetDefaultNXT(MyNXT);

% Establish connection to an ultrasonic range sensor connected to sensor port 2
OpenUltrasonic(SENSOR_2);

% Reset the stopwatch
tic;

% Create an empty matrix to store the standard water level
standard_water_level = [];

% Display a message on the console
disp('Starting standard water level measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 3
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current ultrasonic sensor reading (second column)
    standard_water_level = [standard_water_level; toc  GetUltrasonic(SENSOR_2)];
end

% Display a message on the console
disp('Stopping standard water level measurement');

% Close connection to the ultrasonic sensor
CloseSensor(SENSOR_2);

% Reset the stopwatch
tic;

% Wait 5 seconds
while toc < 5

end

% Establish connection to an ultrasonic range sensor connected to sensor port 2
OpenUltrasonic(SENSOR_2);

% Reset the stopwatch
tic;

% Create an empty matrix to store the new water level
new_water_level = [];

% Display a message on the console
disp('Starting new water level measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 5
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current ultrasonic sensor reading (second column)
    new_water_level = [new_water_level; toc  GetUltrasonic(SENSOR_2)];
end

% Display a message on the console
disp('Stopping new water level measurement');

% Close connection to the ultrasonic sensor
CloseSensor(SENSOR_2);

% Close connection to the NXT brick
COM_CloseNXT(MyNXT);

