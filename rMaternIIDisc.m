function [XYR, varargout] = rMaternIIDisc(lambda, R, W)
    % rMaternIIDisc  generates a random configuration of discs of some
    % deterministic radius R > 0 according to the Matérn II hard-ball model in 2D. 
    % The output is a matrix containing coordinates of disk centres and disk radii.
    %
    % matrix = rMaternIIDisc(lambda,R,W)
    % lambda =  intensity
    % R = disk radius
    % W =  side of the rectangular Window
    % W = [0,side;0,side];
    
    % Generatre position distribution with window area and intensity lambda
    x_space = (W(1,2) - W(1,1) + 2*R);  % samplespace in x-direction
    y_space = (W(2,2) - W(2,1) + 2*R);  % samplespace in y-direction
    sample_space = x_space*y_space;
    total_points = poissrnd(lambda*sample_space); 
    XYR_old = zeros(total_points,3);    

    % Store values of diffrent quantities in Matrix
    % Each row represents one point
    for i = 1:total_points
        % X and Y coordinates of the disc
        XYR_old(i,1) = (rand * ((W(1,2) - W(1,1)) + 2*R)) + (W(1,1) - R) ;  
        XYR_old(i,2) = (rand * ((W(2,2) - W(2,1)) + 2*R)) + (W(2,1) - R) ; 
        % detrerministic approach to find R
        XYR_old(i,3) = R ;        
    end 
            
    %%%%%%%%%%%% MaternII Model %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    XYR = XYR_old;
    for j = total_points:-1:1
        for i = (j-1):-1:1
            x = abs(XYR(i,1)-XYR(j,1));
            y = abs(XYR(i,2)-XYR(j,2));
            z = sqrt(x^2 + y^2);
            if (z < XYR(i,3)+XYR(j,3))
                XYR(j,:) = 0;
            end
        end
    end
    XYR(~any(XYR,2),:) = []; 
    
    if nargout ==2  
    varargout{1} = XYR_old;  
    end
end


                           
