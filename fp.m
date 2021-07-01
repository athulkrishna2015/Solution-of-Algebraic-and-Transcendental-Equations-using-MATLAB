%this is program to calculate root of Non linear differential eqn
%c=.56...
disp("you can change function in fpfun.m")
b=input("enter maximum value ");
a=input("enter minimum value ");
e=input("enter tolerence ");
if (fpfun(a)*fpfun(b)>0)
  disp("you have not assumed right values")
end
 i=0;
while (abs(a-b)>e)
  c = a-((b-a)*fpfun(a)/(fpfun(b)-fpfun(a)));    %find middile point
  i=i+1;
  if (bsfun(c)==0)    %check middile point is the root 
    break
  elseif (fpfun(a)*fpfun(c)<0)    % Decide the side to repeat the steps
    b=c;
  else 
    a=c;
  end
  fprintf("on %d th iteration, value of c= %f\n",i,c);
  end