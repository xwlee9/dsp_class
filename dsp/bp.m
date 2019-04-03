fcuts3=[9900 9950 10050 10100];
mags3=[0 1 0];
devs3=[0.01 0.05 0.01];
[nlp3,Wn3,beta3,ftype3] = kaiserord(fcuts3,mags3,devs3,fsamp);
hn3 = fir1(nlp3,Wn3,ftype3,kaiser(nlp3+1,beta3),'noscale');
figure(3);
subplot(2,2,1);
plot(hn3);
title('The impluse response of BPF');
[H3,f3]=freqz(hn3,1,512,FS);
mag3=20*log10(abs(H3));
subplot(2,2,2);
plot(f3,mag3),grid on;
title('The amplitude-frequency response');
xlabel('Frequency (Hz)');
ylabel('Amplitude Response (dB)');

bp3=filter(hn3,1,xn);
subplot(2,2,3);
plot(n*T,bp3),grid on;
title('Signal After the BPF');
xlabel('t(s)')
ylabel('Amplitude');

ybp3=fft(bp3,NFFT)/N;
subplot(2,2,4);
plot(ff,2*abs(ybp3(1:NFFT/2+1)));
title('BPF Signal in Frequency Domain');
xlabel('f(Hz)');
ylabel('Amplitude');