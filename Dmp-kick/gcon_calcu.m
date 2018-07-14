function b=gcon_calcu(con,t_ex)
%calculate coefficient of moving target g 
A = [1 0 0 0 0 0;
     0 1 0 0 0 0;
     0 0 2 0 0 0;
     1 t_ex t_ex^2 t_ex^3 t_ex^4 t_ex^5;
     0 1 2*t_ex 3*t_ex^2 4*t_ex^3 5*t_ex^4;
     0 0 2 6*t_ex 12*t_ex^2 20*t_ex^3];
B =con';
b = inv(A)*B;
b0=b(1);b1=b(2);b2=b(3);b3=b(4);b4=b(5);b5=b(6);
end