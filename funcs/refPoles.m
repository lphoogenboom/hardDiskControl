function poles = refPoles(P,I,D,N)
%REFPOLES Summary of this function goes here
%   Detailed explanation goes here
    syms z w s;
    I = 0;
    tel = 2*z*w*s+w^2;
    noem = s^2*(s^2+2*z*w*s+w^2);
    Plant = tel/noem;
    % C = P+I/s+(D*s)/(s/N+1);
    C = P+(D*s)/(s/N+1);
    G = C*Plant/(1+C*Plant);
    G  = subs(G,[z, w],[0.1, 1000]);
    % Compute simplified symbolic expression
    G = simplifyFraction(G);
    % numer = 200*(s+5000);
    [~,denom] = numden(G);
    
    % Compute analytic solution of a symbolic equation
    % zeros = solve(numer,s);
    % Display symbolic solution returned by solve
    % displaySymSolution(zeros);
    % denom = s^4+200*s^3+1e6*s^2+200*s+1e6;
    poles = double(solve(denom,s));
end

