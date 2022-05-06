function [L,U,P] = luFactor(A)
% LU Factorization of Matrix A
%   [L,U,P] = luFactor(A)
% Uses Gaussian Eleimation and pivioting to break down matrix A
% Inputs:
%   A = Matrix 
% Outputs:
%   L = Lower diagonal matrix (Shows the coefficients used to break down
%       the matrix
%   U = Upper diagonal matrix (Shows the number's solved)
%   P = pivoting matrix (Shows how the matrix was moved to solve)

% Checks to see if the matrix inputed is a square matrix
[r,c] = size(A);
if r ~= c
    error('Matrix needs to be square')
end

%P = A*inv(A);
P = eye(r);
L = eye(r);
U = A;
 %max iterations of the computation
for i = 1:r-1
    [m, r_m] = max(U);
    [n, r_n] = min(U);
    n = abs(n(i));
    r_n(i);
    if U(i,i) ~= m(1, i) || U(i,i) ~= n
        if m(1,i) >= n && r_m(1,i) > i 
             x = U(i,:);
             U(i,:) = U(r_m(1,i),:);
             U(r_m(1,i),:) = x;
             %Changes the pivot matrix
             y = P(i,:);
             P(1,:) = P(r_m(1,i),:);
             P(r_m(1,i),:) = y;
              a = A(i,:);
             A(i,:) = A(r_mn(i),:);
             A(r_mn(i),:);
        end
        
        if n > m(1,i) && r_n(i) > i
             x = U(i,:);
             U(i,:) = U(r_n(i),:);
             U(r_n(i),:) = x;
             %Changes the pivot matrix
             y = P(i,:);
             P(i,:) = P(r_n(i),:);
             P(r_n(i),:) = y;
             a = A(i,:);
             A(i,:) = A(r_n(i),:);
             A(r_n(i),:) = a;
        end
    end
    for j = 1:r-i
        c = U(i,i)/U(i,i);
        coe = U(i*1+j,i)./U(i,i);
        z = U(i*1+j,:)-coe.*U(i,:);
        U(i*1+j,:) = z;
        L(i*1+j,i) = coe;
        L(i,i) = 1;
    end
end
end

