clc;clear;close all;
 
choice = 1;         % Select your Choice

switch choice
    case 1
        task1();    %to run task (a)
    case 2
        task2();    %to run task (b)
    case 3
        task3();    %to run task (c)
    otherwise
        task3();    %default-->task(c)
end

%%%%%%%%%%%%%%%%%%%%%%%% TASK 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function task1()
    % To Create a random configuration of discs
    % Change the parameters, if needed
    lambda = 110;   % intensity
    R = 0.032;      % disk radius
    W = [0,1;0,1];  % side of the rectangular Window    
    [XYR, XYR_before] = rMaternIIDisc(lambda, R, W);
    graphImage(XYR_before,W,'Random Configurartion of disks');
    graphImage(XYR,W,'Matern II hard-ball Model');
end

%%%%%%%%%%%%%%%%%%%%%%%% TASK 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function task2()
    % Estimates the area fraction for a union of discs
    % Change the parameters, if needed
    lambda = 110;   % intensity for disc generation
    R = 0.032;      % disk radius
    W = [0,1;0,1];  % side of the rectangular Window
    mu = 1000;       % intensity for point count method
    XYR = rMaternIIDisc(lambda, R, W);
    [estAF,coord_in,coord_out] = estAA(XYR, W, mu);
    graphImage(XYR,W,'Matern II hard-ball Model');
    graphCircles(XYR,coord_in,coord_out);
    fprintf("Area Fraction: %f \n",estAF)
end

%%%%%%%%%%%%%%%%%%%%%%%% TASK 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function task3()
    lambda = 110;   % intensity
    R = 0.032;      % disk radius
    W = [0,1;0,1];  % side of the rectangular Window
    n = 100;        % no.of realizations
    mu1 = 100;      % poisson point process
    mu2 = 1000;       
    
    %for mu = 100
    AF_vals=zeros(100,1);
    for i = 1:n    
        [XYR] = rMaternIIDisc(lambda,R,W);
        estAF = estAA(XYR, W, mu1);
        AF_vals(i,1) = estAF;
    end
    mean100 = mean(AF_vals);
    var100 = var(AF_vals);
    fprintf("Mean for mu=100: %f \n",mean100);
    fprintf("Variance for mu=100: %f \n",var100);
    
    figure(3);
    hold on;
    title('Area fraction distribution for 100 realizations, mu = 100')
    xlabel('Realization')
    ylabel('Area Fraction')
    % Fix the axis limits
    xlim([0 100])
    ylim([0 0.5])
    x = 1:100;
    plot(x,(mean100*(ones(100,1))),'LineWidth',1.5)
    plot(x,AF_vals,'*r');
    legend('Mean')
    hold off;
    
    
    %for mu=1000
    AF_vals=zeros(100,1);
    for i = 1:n    
        [XYR] = rMaternIIDisc(lambda,R,W);
        estAF = estAA(XYR, W, mu2);
        AF_vals(i,1) = estAF;
    end
    mean1000 = mean(AF_vals);
    var1000 = var(AF_vals);
    fprintf("Mean for mu=1000: %f \n",mean1000);
    fprintf("Variance for mu=1000: %f \n",var1000);
    
    figure(4);
    hold on;
    title('Area fraction distribution for 100 realizations, mu = 1000')
    xlabel('Realization')
    ylabel('Area Fraction')
    % Fix the axis limits
    xlim([0 100])
    ylim([0 0.5])
    x = 1:100;
    plot(x,(mean1000*(ones(100,1))),'LineWidth',1.5)
    plot(x,AF_vals,'*r');
    legend('Mean')
    hold off;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




