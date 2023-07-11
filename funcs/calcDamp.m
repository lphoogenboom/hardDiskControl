function damps = calcDamp(poles)
%CALCDAMP Summary of this function goes here
%   Compute damping coefficients of complex or real poles
    damps = imag(poles)./abs(poles);
end

