function [theta, u, orientation] = fnConnectingRotationMatrices(Rot1,Rot2)
% Function returns the angle of rotation and the unit vector of rotation
% between two rotation matrices
% the equation is inv(Rot1)*Rot2 since we are looking for a way to rotate
% the first coordinate system to the second one with the same coordinate
% frame

if length(Rot1) == length(Rot2)

    orientation = zeros(3, 3, length(Rot1));
    theta = zeros(length(Rot1),1);
    u = zeros(length(Rot1),3);

    for i = 1 : length(orientation)
        orientation(:,:,i) = Rot1(:,:,i)\(Rot2(:,:,i));
        [theta(i), u(i,:)] = fnAngleAndAxisFromR(orientation(:,:,i));
    end
    
else
    disp("The length of the compared rotation matrices needs to be the same!");
end

end
