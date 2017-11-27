% Establish connection with the NXT brick
MyNXT = COM_OpenNXT('');
COM_SetDefaultNXT(MyNXT);

% Establish connection to a light sensor connected to sensor port 1
% Use active mode (i.e. LED on)
OpenLight(SENSOR_1, 'ACTIVE');

% Reset the stopwatch
tic;

% Create an empty matrix to store standard measurement
standard_light_measurement = [];

% Display a message on the console
disp('Starting standard light measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 2
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current light sensor reading (second column)
    standard_light_measurement = [standard_light_measurement; toc  GetLight(SENSOR_1)];
end

% Close connection to the light sensor, power down LED
CloseSensor(SENSOR_1);

% Display a message on the console
disp('Stopping standard light measurement');

% Reset the stopwatch
tic;

% Wait 5 seconds
while toc < 5

end

% Establish connection to a light sensor connected to sensor port 1
% Use active mode (i.e. LED on)
OpenLight(SENSOR_1, 'ACTIVE');

% Reset the stopwatch
tic;

%Create an empty matix to store the mass_measurement
mass_measurement = [];

% Display a message on the console
disp('Starting mass measurement');

% Keep iterating while the stopwatch reads less than five seconds
while toc < 2
    % Add a new row to results
    % Each row stores the current time (first column) and the
    % current light sensor reading (second column)
    mass_measurement = [mass_measurement; toc  GetLight(SENSOR_1)];
end
   
% Close connection to the light sensor, power down LED
CloseSensor(SENSOR_1);

% Display a message on the console
disp('Stopping mass measurement');

% Close connection to the NXT brick
COM_CloseNXT(MyNXT);







