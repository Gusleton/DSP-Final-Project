function [weights] = plotFFT(data)
%data needs to be a file string like 'myvoice.wav' recorded in Mono, not
%stereo
[person,fs] = audioread(data);
user = smooth(person);
L = length(user);
Y = fft(user);
P2 = abs(Y/L);
P1 = P2(1:ceil(L/2)+1);
% f = fs*(0:(L/2))/L;
P1 = rescale(P1);
% plot(f,P1)
% xlim([0 3000]); %3000 Hz is the peak of most human speech
% ylim([0 1.2]);
% title(['Single-Sided Amplitude Spectrum of ', data])
% xlabel('f (Hz)')
% ylabel('|P1(f)|')

%maybe from here check integral value of a ton of segments and use that to
%compare

%create array integral values of 60 50 Hz wide data segments from 0 to
%3000 Hz
weights = ones(1,60);
for k = 1:60
    weights(k) = trapz(P1((k*50):((k+1)*50)));
    disp(weights(k))
end 

%from here, weights is output, add that to 2D array of weights 
%The names need to be stored in a seperated array, just make sure to match
%the row of the name with the row of the data
