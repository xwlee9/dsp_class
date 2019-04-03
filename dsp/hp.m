fcuts5=[19750 20250];
mags5=[0 1];
devs5=[0.01 0.01];
[nlp5,Wn5,beta5,ftype5] = kaiserord(fcuts5,mags5,devs5,fsamp);
hn5 = fir1(nlp5,Wn5,ftype5,kaiser(nlp5+1,beta5),'noscale');
figure(4);
subplot(2,2,1);
plot(hn5);
title('The impluse response of HPF ');
[H5,f5]=freqz(hn5,1,512,FS);
mag5=20*log10(abs(H5));
subplot(2,2,2);
plot(f5,mag5),grid on;
title('The amplitude-frequency response');
xlabel('Frequency (Hz)');
ylabel('Amplitude Response (dB)');

hp5=filter(hn5,1,xn);
subplot(2,2,3);
plot(n*T,hp5),grid on;
title('Signal After the HPF');
xlabel('t(s)')
ylabel('Amplitude');

yhp5=fft(hp5,NFFT)/N;
subplot(2,2,4);
plot(ff,2*abs(yhp5(1:NFFT/2+1)));
title('HPF Signal in Frequency Domain');
xlabel('f(Hz)');
ylabel('Amplitude');