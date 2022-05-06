function [A] = specialMatrix(n,m)
% Created: 1/25/2022
% Edited: 1/26/2022
% Joshua Thatcher
% This function should return a matrix A that has each element in the first
% row is the number of the column. As each element in the first column is
% the number of the row. The rest of the matric has a value that is equal to
% the sum of the element above and to the left. If the user doesn't input
% two arguments than the function will return an error message.

%Errors mesage if there isn't exaclty 2 inputs
if nargin ~= 2
    error(msg)
end

% Generates a matrix of all zeros based on the inputs.
A = zeros(n,m);

% Creates the frist column, in which every row is equal to that row number
for x = 1:1:n
    A(x,1) = x;
end
% Creates the first row in which every column is equal to the column number.
for y = 1:1:m
    A(1,y)=y;
end

% Starts from the 2 row 2 column, and works left to right. 
% Replaces the element it is on with the sum of the element above and to
% the left of it.
for x = 2:1:n 
    for y = 2:1:m
         A(x,y) = A(x,y-1)+A(x-1,y);
    end
end
end

