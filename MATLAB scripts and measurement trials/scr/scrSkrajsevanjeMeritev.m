%% Timestamps for the start and end of measurement trial + timestamps for
% the simple gyroscope offset calibration method 
close all

    if exist('nStart', 'var') && exist('nEnd', 'var')
    
    else
        
        % Select two time stamps for the start and end of the measurement
        % trial
        % WARNING! Please choose a start where at least 20 samples of the
        % accelerometer are in statonary position, so that the initial
        % projections of the g vector are determined correctly.

        fig1 = figure;
        subplot(211),plot(accShank)
        subplot(212),plot(omShank)
        [x1, y1] = ginput(2);
        x1 = round(x1);
        close(fig1)

        nStart        = x2(3); nEnd        = x2(4); % Start and end of the measurement trial

    
    end

    if exist('nCalStart1', 'var') && exist('nCalEnd1', 'var') 

    else

        % Two time stamps are for the simple offset calibration,

        fig2 = figure;
        subplot(211),plot(accShank)
        subplot(212),plot(omShank)
        [x2, y2] = ginput(2);
        x2 = round(x2);
        close(fig2)

        nCalStart1    = x2(1); nCalEnd1    = x2(2); % Start and end of simple offset calibration method

        fig3 = figure;
        plot(omShank(nCalStart1:nCalEnd1,:))
        [x3, y3] = ginput(2);
        x3 = round(x3);
        close(fig3)
        nCalStart1    = nCalStart1 + x3(1); nCalEnd1   = nCalStart1 + x3(2);
        % A zoomed in, i.e., more detailed, selection of the simple offset
        % calibration part

    end

    if exist('nCalStart2', 'var') && exist('nCalEnd2', 'var')

    else

        fig4 = figure;
        subplot(211),plot(accThigh)
        subplot(212),plot(omThigh)
        [x4, y4] = ginput(2);
        x4 = round(x4);
        close(fig4)

        nCalStart2    = x4(1); nCalEnd2    = x4(2); % Start and end of simple offset calibration method

        fig5 = figure;
        plot(omThigh(nCalStart2:nCalEnd2,:))
        [x5, y5] = ginput(2);
        x5 = round(x5);
        close(fig5)
        nCalStart2    = nCalStart2 + x5(1); nCalEnd2   = nCalStart2 + x5(2);
        % A zoomed in, i.e., more detailed, selection of the simple offset
        % calibration part

    end