function [LCSSsignalTBAligned1, LCSSsignalTBAligned2, LCSSAlignedSignal1, LCSSAlignedSignal2, LCSSAlignedSignal3] = fnWindowingLCSS(windowSize, epsilon, delta,signalToBeAlignedWith1,signalToBeAlignedWith2 , alignedSignal1, alignedSignal2, alignedSignal3)

if length(signalToBeAlignedWith1) == length(alignedSignal1)

    numOfIterations = floor(length(signalToBeAlignedWith1)/windowSize);

    currentSignal1 = signalToBeAlignedWith1(1:windowSize, :);
    currentSignal2 = signalToBeAlignedWith2(1:windowSize, :);
    currentSignal4 = alignedSignal1(1:windowSize, :);
    currentSignal5 = alignedSignal2(1:windowSize, :);
    currentSignal6 = alignedSignal3(1:windowSize, :);

    for i = 1:numOfIterations+1

       [P,LCSS,T] = fnLCSS(currentSignal1,currentSignal4, epsilon, delta);

       currentSignal1 = currentSignal1(P(:,1));
       currentSignal2 = currentSignal2(P(:,1));
       currentSignal4 = currentSignal4(P(:,2));
       currentSignal5 = currentSignal5(P(:,2));
       currentSignal6 = currentSignal6(P(:,2));
       
       if i == 1

           LCSSsignalTBAligned1 = currentSignal1;
           LCSSsignalTBAligned2 = currentSignal2;
           LCSSAlignedSignal1   = currentSignal4;
           LCSSAlignedSignal2   = currentSignal5;
           LCSSAlignedSignal3   = currentSignal6;

           lastSample1(i) = P(end,1)+1;
           lastSample2(i) = P(end,2)+1;

       else

           LCSSsignalTBAligned1      = [LCSSsignalTBAligned1; currentSignal1];
           LCSSsignalTBAligned2      = [LCSSsignalTBAligned2; currentSignal2];
           LCSSAlignedSignal1        = [LCSSAlignedSignal1; currentSignal4];
           LCSSAlignedSignal2        = [LCSSAlignedSignal2; currentSignal5];
           LCSSAlignedSignal3        = [LCSSAlignedSignal3; currentSignal6];

           lastSample1(i)            = lastSample1(i-1)+P(end,1)+1;
           lastSample2(i)            = lastSample2(i-1)+P(end,2)+1;


       end
        
       if floor((length(signalToBeAlignedWith1)-lastSample1(i))/windowSize) < 1

           currentSignal1 = signalToBeAlignedWith1(lastSample1(i):length(signalToBeAlignedWith1), :);
           currentSignal2 = signalToBeAlignedWith2(lastSample1(i):length(signalToBeAlignedWith1), :); 
           currentSignal4 = alignedSignal1(lastSample2(i):length(alignedSignal1), :); 
           currentSignal5 = alignedSignal2(lastSample2(i):length(alignedSignal1), :);
           currentSignal6 = alignedSignal3(lastSample2(i):length(alignedSignal1), :);

       else
        
           currentSignal1 = signalToBeAlignedWith1(lastSample1(i):lastSample1(i)+windowSize, :);
           currentSignal2 = signalToBeAlignedWith2(lastSample1(i):lastSample1(i)+windowSize, :);
           currentSignal4 = alignedSignal1(lastSample2(i):lastSample2(i)+windowSize, :);
           currentSignal5 = alignedSignal2(lastSample2(i):lastSample2(i)+windowSize, :);
           currentSignal6 = alignedSignal3(lastSample2(i):lastSample2(i)+windowSize, :);

       end

    end

else

    display('Signals must be of same length!')

end

end