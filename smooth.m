function [dataSmoothed] = smooth(data)
dataSmoothed = data;
t = max(data(1:10000));
for k = 1:length(data)
    if abs(data(k)) < t
        dataSmoothed(k) = 0;
    end 
end 
%plot(dataSmoothed);
%soundsc(dataSmoothed, 44100);