fsamp=FS;
fcuts1=[5000 5250];
mags1=[1 0];
devs1=[0.01 0.01];
[nlp1,Wn1,beta1,ftype1] = kaiserord(fcuts1,mags1,devs1,fsamp);
hn1 = fir1(nlp1,Wn1,ftype1,kaiser(nlp1+1,beta1),'noscale');
figure(2);
subplot(2,2,1);
plot(hn1);
title('The impluse response of LPF');
[H1,f1]=freqz(hn1,1,512,FS);
mag1=20*log10(abs(H1));
subplot(2,2,2);
plot(f1,mag1),grid on;
title('The amplitude-frequency response');
xlabel('Frequency (Hz)');
ylabel('Amplitude Response (dB)');

lp1=filter(hn1,1,xn);
subplot(2,2,3);
plot(n*T,lp1),grid on;
title('Signal After the LPF');
xlabel('t(s)')
ylabel('Amplitude');

ylp1=fft(lp1,NFFT)/N;
ff=FS/2*linspace(0,1,NFFT/2+1);
subplot(2,2,4);
plot(ff,2*abs(ylp1(1:NFFT/2+1)));
title('LPF Signal in Frequency Domain');
xlabel('f(Hz)');
ylabel('Amplitude');
