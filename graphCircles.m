function graphCircles(XYR,dots1,dots2)
    % graphCircles plots circles, given the coordinates and radii.
    % graphCircles([x-coordinate,y-coordinate,radius])
    
    % Plot a figure with both circles and points
    figure();
    hold on;
    size_XYR = size(XYR);
    size_dots1 = size(dots1);
    size_dots2 = size(dots2);
    for i = 1:size_XYR(1,1)
        % Create random circles to display
        X = XYR(i,1);
        Y = XYR(i,2);
        centers = [X, Y];
        R = XYR(i,3);        
        xlim([0 1])
        ylim([0 1])
        axis square
        title('Random Point Generation ');
        viscircles(centers,R,'color','k');
    end
    for i = 1:size_dots1(1,1)
        % Create points
        X = dots1(i,1);
        Y = dots1(i,2);      
        plot(X,Y,'r.');
    end
    for i = 1:size_dots2(1,1)
        % Create points
        X = dots2(i,1);
        Y = dots2(i,2);      
        plot(X,Y,'r.');
    end   
    hold off;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Plot a figure to show point count process
    figure();
    hold on;
    size_XYR = size(XYR);
    size_dots1 = size(dots1);
    size_dots2 = size(dots2);
    for i = 1:size_XYR(1,1)
        % Create random circles to display
        X = XYR(i,1);
        Y = XYR(i,2);
        centers = [X, Y];
        R = XYR(i,3);        
        xlim([0 1])
        ylim([0 1])
        axis square
        title('Point Count Process ');
        viscircles(centers,R,'color','k');
    end
    for i = 1:size_dots1(1,1)
        % Create points
        X = dots1(i,1);
        Y = dots1(i,2);      
        plot(X,Y,'r.');
    end
    for i = 1:size_dots2(1,1)
        % Create points
        X = dots2(i,1);
        Y = dots2(i,2);      
        plot(X,Y,'b.');
    end   
    hold off;    
end