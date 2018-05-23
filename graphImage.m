function graphImage(XYR,W,s)
    % graphImage generates image using the pixels provided
    figure();
    hold on;
    xlim([0 1000])
    ylim([0 1000])
    axis square
    title(['' num2str(s)]);
    B = digitize(XYR,W,0.001);
    [nx,ny] = size(B);
    B = 1-B;
    imagesc((1:ny),(1:nx),B);
    hold off;
end