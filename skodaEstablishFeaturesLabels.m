function skodaEstablishFeaturesLabels

%% Retrieve measures

% General parameters
raw = 0; % Set to 3 if RAW instead of CALIBRATED

%% Load original left arm data
load('left_classall_clean')
[n_left,d] = size(left_classall_clean);
labels_left = left_classall_clean(:,1);
classall = left_classall_clean(:,2:d);
% Define initial vectors
left_cal = labels_left;
features_left = left_cal;
% Loop through all ten sensor and retrieve only calibrated data
nb_values = 3;
sensor_values = 7;
sensors_to_keep_left = [1,2,10];
nb_sensors_left = length(sensors_to_keep_left);
sensors = (d-1)/sensor_values;
for i=1:sensors
    if(any(i == sensors_to_keep_left))
        index = 1 + (i-1)*sensor_values + raw;
        index_end = index + nb_values;
        features_left = [features_left classall(:,(index+1):index_end)];
        left_cal = [left_cal classall(:,index:index_end)];
    end
end
features_left = features_left(:,2:end);
save('features_left', 'features_left')
save('labels_left', 'labels_left')

%% Load original right arm data
load('right_classall_clean')
[n_right,d] = size(right_classall_clean);
labels_right = right_classall_clean(:,1);
classall = right_classall_clean(:,2:d);
% Define initial vectors
right_cal = labels_right;
features_right = right_cal;
% Loop through all sensors and retrieve only calibrated data
nb_values = 3;
sensor_values = 7;
sensors = (d-1)/sensor_values;
sensors_to_keep_right = [1,2,7];
nb_sensors_right = length(sensors_to_keep_right);
for i=1:sensors
    if(any(i == sensors_to_keep_right))
        index = 1 + (i-1)*sensor_values + raw;
        index_end = index + nb_values;
        features_right = [features_right classall(:,(index+1):index_end)];
        right_cal = [right_cal classall(:,index:index_end)];
    end
end
features_right = features_right(:,2:end);
save('features_right', 'features_right')
save('labels_right', 'labels_right')

%% Merge data sets

% Assess longest
if(n_right > n_left)
    % Allocate features and labels
    i = 1; k = 1;
    [n,d] = size(features_left);
    features_both = zeros(n,d*2);
    labels_both = zeros(n,1);
    % Establish combined data set
    while(k < n_right)
        if(labels_left(i) == labels_right(k))
            labels_both(i,1) = labels_left(i,1);
            features_both(i,:) = [features_left(i,:) features_right(k,:)];
            i = i + 1;
        end
        k = k + 1;
    end
else
    disp('left arm data set is longer than right arm data set')
end
save('features_both', 'features_both')
save('labels_both', 'labels_both')
