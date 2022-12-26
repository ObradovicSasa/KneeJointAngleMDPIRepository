fs = 100;
meritvePath = 'data/Meritve/';
rotMat15 = 'data/Meritve/RotationMatrixAlignment/Za kandidate <= 5/RotMat.mat';
rotMatK3 = 'data/Meritve/RotationMatrixAlignment/Za kandidate <= 5/RotationMatricesTestK3.mat';
rotMat67 = 'data/Meritve/RotationMatrixAlignment/Za kandidate >= 6/RotMat.mat';


%% K1 %%
K1.Q.M1 = 'K1/Qualisys/K1_M1.mat';

K1.IMU.M1.S.Acc = 'K1/IMU/1_2022-09-28T14.57.34.945_E085FC57C781_Accelerometer.csv';
K1.IMU.M1.S.Gyro = 'K1/IMU/1_2022-09-28T14.57.34.945_E085FC57C781_Gyroscope.csv';
K1.IMU.M1.S.nOffset = [44980, 46859];
K1.IMU.M1.G.Acc = 'K1/IMU/5_2022-09-28T14.57.34.945_DDBF59C1DA86_Accelerometer.csv';
K1.IMU.M1.G.Gyro = 'K1/IMU/5_2022-09-28T14.57.34.945_DDBF59C1DA86_Gyroscope.csv';
K1.IMU.M1.G.nOffset = [45246, 46962];
K1.IMU.M1.nStartEnd = [122901, 158532];

K1.Q.M2 = 'K1/Qualisys/K1_M2.mat';

K1.IMU.M2.S.Acc = 'K1/IMU/1_2022-09-28T15.52.31.580_E085FC57C781_Accelerometer.csv';
K1.IMU.M2.S.Gyro = 'K1/IMU/1_2022-09-28T15.52.31.580_E085FC57C781_Gyroscope.csv';
K1.IMU.M2.S.nOffset = [21565, 24142];
K1.IMU.M2.G.Acc = 'K1/IMU/5_2022-09-28T15.52.31.580_DDBF59C1DA86_Accelerometer.csv';
K1.IMU.M2.G.Gyro = 'K1/IMU/5_2022-09-28T15.52.31.580_DDBF59C1DA86_Gyroscope.csv';
K1.IMU.M2.G.nOffset = [50436, 53628];
K1.IMU.M2.nStartEnd = [51796, 176813];

%% K2 %%

K2.Q.M1 = 'K2/Qualisys/K2_M1.mat';

K2.IMU.M1.S.Acc = 'K2/IMU/1_2022-09-28T17.43.14.200_E085FC57C781_Accelerometer.csv';
K2.IMU.M1.S.Gyro = 'K2/IMU/1_2022-09-28T17.43.14.200_E085FC57C781_Gyroscope.csv';
K2.IMU.M1.S.nOffset = [86046, 86984];
K2.IMU.M1.G.Acc = 'K2/IMU/5_2022-09-28T17.43.14.200_DDBF59C1DA86_Accelerometer.csv';
K2.IMU.M1.G.Gyro = 'K2/IMU/5_2022-09-28T17.43.14.200_DDBF59C1DA86_Gyroscope.csv';
K2.IMU.M1.G.nOffset = [85576, 86962];
K2.IMU.M1.nStartEnd = [86634, 120678];

K2.Q.M2 = 'K2/Qualisys/K2_M2.mat';

K2.IMU.M2.S.Acc = 'K2/IMU/1_2022-09-28T18.31.56.207_E085FC57C781_Accelerometer.csv';
K2.IMU.M2.S.Gyro = 'K2/IMU/1_2022-09-28T18.31.56.207_E085FC57C781_Gyroscope.csv';
K2.IMU.M2.S.nOffset = [32027, 33136];
K2.IMU.M2.G.Acc = 'K2/IMU/5_2022-09-28T18.31.56.207_DDBF59C1DA86_Accelerometer.csv';
K2.IMU.M2.G.Gyro = 'K2/IMU/5_2022-09-28T18.31.56.207_DDBF59C1DA86_Gyroscope.csv';
K2.IMU.M2.G.nOffset = [32021, 33858];
K2.IMU.M2.nStartEnd = [50260, 173281];

%% K3 %%  
K3.Q.M1 = 'K3/Qualisys/K3_M1.mat';

K3.IMU.M1.S.Acc = 'K3/IMU/1_2022-09-29T19.41.10.131_E085FC57C781_Accelerometer.csv';
K3.IMU.M1.S.Gyro = 'K3/IMU/1_2022-09-29T19.41.10.131_E085FC57C781_Gyroscope.csv';
K3.IMU.M1.S.nOffset = [44035, 44664];
K3.IMU.M1.G.Acc = 'K3/IMU/5_2022-09-29T19.41.10.131_DDBF59C1DA86_Accelerometer.csv';
K3.IMU.M1.G.Gyro = 'K3/IMU/5_2022-09-29T19.41.10.131_DDBF59C1DA86_Gyroscope.csv';
K3.IMU.M1.G.nOffset = [43745, 44753];
K3.IMU.M1.nStartEnd = [46017, 77809];

K3.Q.M2 = 'K3/Qualisys/K3_M2.mat';

K3.IMU.M2.S.Acc = 'K3/IMU/1_2022-09-29T20.16.27.891_E085FC57C781_Accelerometer.csv';
K3.IMU.M2.S.Gyro = 'K3/IMU/1_2022-09-29T20.16.27.891_E085FC57C781_Gyroscope.csv';
K3.IMU.M2.S.nOffset = [64052, 64712];
K3.IMU.M2.G.Acc = 'K3/IMU/5_2022-09-29T20.16.27.891_DDBF59C1DA86_Accelerometer.csv';
K3.IMU.M2.G.Gyro = 'K3/IMU/5_2022-09-29T20.16.27.891_DDBF59C1DA86_Gyroscope.csv';
K3.IMU.M2.G.nOffset = [22754, 24050];
K3.IMU.M2.nStartEnd = [64206, 187927];

%% K4 %%  
K4.Q.M1 = 'K4/Qualisys/K4_M1.mat';

K4.IMU.M1.S.Acc = 'K4/IMU/1_2022-10-13T15.27.11.470_E085FC57C781_Accelerometer.csv';
K4.IMU.M1.S.Gyro = 'K4/IMU/1_2022-10-13T15.27.11.470_E085FC57C781_Gyroscope.csv';
K4.IMU.M1.S.nOffset = [17309, 18608];
K4.IMU.M1.G.Acc = 'K4/IMU/5_2022-10-13T15.27.11.470_DDBF59C1DA86_Accelerometer.csv';
K4.IMU.M1.G.Gyro = 'K4/IMU/5_2022-10-13T15.27.11.470_DDBF59C1DA86_Gyroscope.csv';
K4.IMU.M1.G.nOffset = [17393, 18692];
K4.IMU.M1.nStartEnd = [50011, 81495];

K4.Q.M2 = 'K4/Qualisys/K4_M2.mat';

K4.IMU.M2.S.Acc = 'K4/IMU/1_2022-10-13T15.59.45.326_E085FC57C781_Accelerometer.csv';
K4.IMU.M2.S.Gyro = 'K4/IMU/1_2022-10-13T15.59.45.326_E085FC57C781_Gyroscope.csv';
K4.IMU.M2.S.nOffset = [39684, 41150];
K4.IMU.M2.G.Acc = 'K4/IMU/5_2022-10-13T15.59.45.326_DDBF59C1DA86_Accelerometer.csv';
K4.IMU.M2.G.Gyro = 'K4/IMU/5_2022-10-13T15.59.45.326_DDBF59C1DA86_Gyroscope.csv';
K4.IMU.M2.G.nOffset = [39674, 41320];
K4.IMU.M2.nStartEnd = [40431, 163451];


%% K5 %%  
K5.Q.M1 = 'K5/Qualisys/K5_M1.mat';

K5.IMU.M1.S.Acc = 'K5/IMU/1_2022-10-13T17.43.00.733_E085FC57C781_Accelerometer.csv';
K5.IMU.M1.S.Gyro = 'K5/IMU/1_2022-10-13T17.43.00.733_E085FC57C781_Gyroscope.csv';
K5.IMU.M1.S.nOffset = [38632, 39905];
K5.IMU.M1.G.Acc = 'K5/IMU/5_2022-10-13T17.43.00.733_DDBF59C1DA86_Accelerometer.csv';
K5.IMU.M1.G.Gyro = 'K5/IMU/5_2022-10-13T17.43.00.733_DDBF59C1DA86_Gyroscope.csv';
K5.IMU.M1.G.nOffset = [38963, 39880];
K5.IMU.M1.nStartEnd = [39608, 71962];

%% K6 %%  
K6.Q.M1 = 'K6/Qualisys/K6_M1.mat';

K6.IMU.M1.S.Acc = 'K6/IMU/1_2022-10-14T16.28.15.633_E085FC57C781_Accelerometer.csv';
K6.IMU.M1.S.Gyro = 'K6/IMU/1_2022-10-14T16.28.15.633_E085FC57C781_Gyroscope.csv';
K6.IMU.M1.S.nOffset = [34904, 37166];
K6.IMU.M1.G.Acc = 'K6/IMU/5_2022-10-14T16.28.15.633_DDBF59C1DA86_Accelerometer.csv';
K6.IMU.M1.G.Gyro = 'K6/IMU/5_2022-10-14T16.28.15.633_DDBF59C1DA86_Gyroscope.csv';
K6.IMU.M1.G.nOffset = [34732, 37329];
K6.IMU.M1.nStartEnd = [41035, 81419];

K6.Q.M2 = 'K6/Qualisys/K6_M22.mat';

K6.IMU.M2.S.Acc = 'K6/IMU/1_2022-10-14T17.58.35.742_E085FC57C781_Accelerometer.csv';
K6.IMU.M2.S.Gyro = 'K6/IMU/1_2022-10-14T17.58.35.742_E085FC57C781_Gyroscope.csv';
K6.IMU.M2.S.nOffset = [8329, 15743];
K6.IMU.M2.G.Acc = 'K6/IMU/5_2022-10-14T17.58.35.742_DDBF59C1DA86_Accelerometer.csv';
K6.IMU.M2.G.Gyro = 'K6/IMU/5_2022-10-14T17.58.35.742_DDBF59C1DA86_Gyroscope.csv';
K6.IMU.M2.G.nOffset = [8329, 15896];
K6.IMU.M2.nStartEnd = [14750, 138513];


%% K7 %%  
K7.Q.M1 = 'K7/Qualisys/K7_M1.mat';

K7.IMU.M1.S.Acc = 'K7/IMU/1_2022-10-15T11.05.16.259_E085FC57C781_Accelerometer.csv';
K7.IMU.M1.S.Gyro = 'K7/IMU/1_2022-10-15T11.05.16.259_E085FC57C781_Gyroscope.csv';
K7.IMU.M1.S.nOffset = [38124, 44072];
K7.IMU.M1.G.Acc = 'K7/IMU/5_2022-10-15T11.05.16.259_DDBF59C1DA86_Accelerometer.csv';
K7.IMU.M1.G.Gyro = 'K7/IMU/5_2022-10-15T11.05.16.259_DDBF59C1DA86_Gyroscope.csv';
K7.IMU.M1.G.nOffset = [38294, 44387];
K7.IMU.M1.nStartEnd = [46560, 78884];

K7.Q.M2 = 'K7/Qualisys/K7_M2.mat';

K7.IMU.M2.S.Acc = 'K7/IMU/1_2022-10-15T11.43.14.996_E085FC57C781_Accelerometer.csv';
K7.IMU.M2.S.Gyro = 'K7/IMU/1_2022-10-15T11.43.14.996_E085FC57C781_Gyroscope.csv';
K7.IMU.M2.S.nOffset = [33759, 39050];
K7.IMU.M2.G.Acc = 'K7/IMU/5_2022-10-15T11.43.14.996_DDBF59C1DA86_Accelerometer.csv';
K7.IMU.M2.G.Gyro = 'K7/IMU/5_2022-10-15T11.43.14.996_DDBF59C1DA86_Gyroscope.csv';
K7.IMU.M2.G.nOffset = [33297, 38583];
K7.IMU.M2.nStartEnd = [40781, 163605]; 


%% RotationMatrixAlignment 1


Rot1.IMU.S.Acc = 'RotationMatrixAlignment/Za kandidate <= 5/IMU/1_2022-10-14T15.24.45.371_E085FC57C781_Accelerometer.csv';
Rot1.IMU.S.Gyro = 'RotationMatrixAlignment/Za kandidate <= 5/IMU/1_2022-10-14T15.24.45.371_E085FC57C781_Gyroscope.csv';
Rot1.IMU.S.nOffset = [57, 927];
Rot1.IMU.G.Acc = 'RotationMatrixAlignment/Za kandidate <= 5/IMU/5_2022-10-14T15.24.45.371_DDBF59C1DA86_Accelerometer.csv';
Rot1.IMU.G.Gyro = 'RotationMatrixAlignment/Za kandidate <= 5/IMU/5_2022-10-14T15.24.45.371_DDBF59C1DA86_Gyroscope.csv';
Rot1.IMU.G.nOffset = [74, 981];
Rot1.IMU.nStartEnd = [461, 5920];


Rot1.Q = 'RotationMatrixAlignment/Za kandidate <= 5/Qualisys/rotationMatrixAlignment1.mat';


%% RotationMatrixAlignment 2

Rot2.IMU.S.Acc = 'RotationMatrixAlignment/Za kandidate >= 6/IMU/1_2022-10-14T15.47.01.478_E085FC57C781_Accelerometer.csv';
Rot2.IMU.S.Gyro = 'RotationMatrixAlignment/Za kandidate >= 6/IMU/1_2022-10-14T15.47.01.478_E085FC57C781_Gyroscope.csv';
Rot2.IMU.S.nOffset = [617, 931];
Rot2.IMU.G.Acc = 'RotationMatrixAlignment/Za kandidate >= 6/IMU/5_2022-10-14T15.47.01.478_DDBF59C1DA86_Accelerometer.csv';
Rot2.IMU.G.Gyro = 'RotationMatrixAlignment/Za kandidate >= 6/IMU/5_2022-10-14T15.47.01.478_DDBF59C1DA86_Gyroscope.csv';
Rot2.IMU.G.nOffset = [675, 930];
Rot2.IMU.nStartEnd = [927, 6207];


Rot2.Q = 'RotationMatrixAlignment/Za kandidate >= 6/Qualisys/rotationMatrixAlignment2.mat';
