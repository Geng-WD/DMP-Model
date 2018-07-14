function out=gF(t,b)
% moving target g function
y=b(1) + b(2)*t + b(3)*t^2 + b(4)*t^3 + b(5)*t^4 + b(6)*t^5;
v= b(2) + 2*b(3)*t + 3*b(4)*t^2 + 4*b(5)*t^3 + 5*b(6)*t^4;
a=2*b(3) + 6*b(4)*t + 12*b(5)*t^2 + 20*b(6)*t^3;
out=[y v a];
end