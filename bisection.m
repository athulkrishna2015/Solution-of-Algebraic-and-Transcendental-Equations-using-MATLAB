%this is program to calculate root of Non linear differential eqn
%c=.5 so choose  apropriate a abd b

disp('you can change function in bsfun.m')
b=input("enter maximum value ");
a=input("enter minimum value ");
e=input("enter tolerence ");
if (bsfun(a)*bsfun(b)>0)
  disp("you have not assumed right values")
end
 i=0;
while (abs(b-a)>e)
  c=(b+a)/2;    %find middile point
  i=i+1;
  if (bsfun(c)==0)    %check middile point is the root 
    break
  elseif (bsfun(a)*bsfun(c)<0)    % Decide the side to repeat the steps
    b=c;
  else 
    a=c;
  end
  fprintf("on %d th iteration, value of c= %f\n",i,c);
end
