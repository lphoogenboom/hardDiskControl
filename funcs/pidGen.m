function pid = pidGen(P,I,D,N,Gain) %PIDGEN generates transfer function of PID controller

%   generates transfer function of PID controller in series/interacting
%   form. Notice that the derivator term is realisable because of the added
%   numerator with N

    s = tf([1,0],[1]);

    pid = Gain*(P+I/s+D*s/(1+s/N));
end