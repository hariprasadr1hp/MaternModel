function [estAF, varargout] = estAA(XYR, W, mu)
    % estAA estimates Area Fraction
    
    size_XYR = size(XYR);

    % Generatre position distribution with window area and intensity lambda
    x_space = (W(1,2) - W(1,1));  % samplespace in x-direction
    y_space = (W(2,2) - W(2,1));  % samplespace in y-direction
    sample_space = x_space*y_space;
    total_points = poissrnd(mu*sample_space);
    coord = zeros(total_points,2);
    
    % Store values of diffrent quantities in Matrix
    % Each row represents one point
    for i = 1:total_points
        % X and Y coordinates of the disc
        coord(i,1) = (rand * (W(1,2) - W(1,1)) + W(1,1)) ;  
        coord(i,2) = (rand * (W(2,2) - W(2,1)) + W(2,1)) ;                
    end    
    
    coord_in = coord;
    
    %point count method
    inside = 0;
    for j = 1:size_XYR(1,1)
        for i = 1:total_points
            x = abs(coord_in(i,1)-XYR(j,1));
            y = abs(coord_in(i,2)-XYR(j,2));
            z = sqrt(x^2 + y^2);
            if (z < XYR(j,3))
                coord_in(i,:) = 0;
                inside = inside+1;
            end
        end
    end
    coord_out = coord - coord_in;
    coord_in(~any(coord_in,2),:) = [];
    coord_out(~any(coord_out,2),:) = [];
  
    %estimate area fraction
    estAF = inside/total_points; 
        
    if nargout ==2  
    varargout{1} = coord;  
    end
    if nargout ==3  
    varargout{1} = coord_in;
    varargout{2} = coord_out;
    end
end