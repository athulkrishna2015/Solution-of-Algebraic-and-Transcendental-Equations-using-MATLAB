%Newton Rapson method to find root 
x0=input('enter inital guss ');  %choose 0.5+
e=input('enter tolerence ');
x1=x0;
k=0;
while(1)
    k=k+1;
    x0=x1;
    x1=x0-nrfun(x0)/nrfun_diff(x0);
    fprintf('One root is %f obtained at %dth iteration\n',x1,k)
    if (abs(x1-x0)<e)
        break
    end
end

