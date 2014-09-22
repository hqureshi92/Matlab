
function dy = sys_ode(t, y, a, b)
%S = y(1), I = y(2), R =y(3)   
dy = zeros(3,1);
   dy(1) = -a*y(1) * y(2);
   dy(2) = a*y(1)*y(2) - b*y(2);
   dy(3) = b*y(2); 
