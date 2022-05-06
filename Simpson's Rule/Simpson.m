function [I] = Simpson(x,y)
%Numerical evaluation of integral by Simpson's 1/3 Rule
%   [I] = Simpson(x,y)
% Inputs:
%   x = the vector of equally spaved indepndent variables
%   y = the vector of function values with respect to x
% Output:
%   I = the numerical integral calculated

[rx,cx] = size(x);
[ry,cy] = size(y);

if cx ~= cy
    error('inputs must be of the same length')
end

sp1 = x(1,2)-x(1,1);
for i = 2:cx
    if i+1>cx
        break
    end
    sp0 = sp1;
    sp1 = x(1,i+1) - x(1,i);
    if sp1 ~= sp0
        error('The x must have uniform spacing')
    end
end

I_s = 0;
I_t = 0;
if cx <= 2
    warning('The trapezodial rule will be used instead of Simpsons Rule, since the number of segments = 1')
    I = (x(1,2)-x(1,1)).*(y(1,1)+y(1,2))./2;
else
    for j = 1:2:cx
       if j+2 > cx
         break
      end
        I = (x(j+2)-x(j))*(y(j)+4*y(j+1)+y(j+2))/6;
        I_s = I + I_s
        i = j+2;
    end
    if rem(cx,2)==0
        warning('The trapezodial rule will be used on the last interval')
    end
    if i~= cx
        I_t = (x(1,cx)-x(1,i)).*(y(1,cx)+y(1,i))./2
    end
    I = I_s + I_t;
end
end