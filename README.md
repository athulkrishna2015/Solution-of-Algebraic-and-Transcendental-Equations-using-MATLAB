 ![](https://snipboard.io/i59IE8.jpg)

## Term paper

# **Solution of Algebraic and Transcendental Equations using MATLAB**

Submitted by:

**Athulkrishna S V**

Reg. No. 20mscphy08

Department of Physics

### **Abstract**

In this term paper we will discuss different methods to find Solution of Algebraic and Transcendental Equations. And find out which one is better

### **Table of contents**

1. Introduction
2. MATLAB
3. Bisection method
4. False position method
5. Newton Rapson method
6. Reference

### **INTRODUCTION**

In scientific and engineering studies, a frequently occurring problem is to find the roots of equations of the form.

If is a quadratic, cubic or a biquadratic expression, then algebraic formulae are available for expressing the roots in terms of the coefficients. On the other hand, when is a polynomial of higher degree or an expression involving transcendental functions, algebraic methods are not available, and recourse must be taken to find the roots by approximate methods.

algebraic functions of the form

are called polynomials.

non-algebraic function is called a transcendental function, e.g., , etc. The roots of Eq may be either real or complex.

If is a polynomial , the following results, from the theory of equations would be useful in locating its roots.

1. Every polynomial equation of the nth degree has n and only n roots.
2. If n is odd, the polynomial equation has at least one real root whose sign is opposite to that of the last term.
3. If n is even and the constant term is negative, then the equation has at least one positive root and at least one negative root.
4. If the polynomial equation has (a) real coefficients, then imaginary roots occur in pairs and (b) rational coefficients, then irrational roots occur in pairs.
5. Descartes&#39; Rule of Signs

  * A polynomial equation cannot have more number of positive real roots than the number of changes of sign in the coefficients of
  * In (a) above, cannot have more number of negative real roots than the number of changes of sign in the coefficients of .

![](https://snipboard.io/69dNMu.jpg)
### **MATLAB**

MATLAB (an abbreviation of &quot;matrix laboratory&quot;) is a proprietary multi-paradigm programming language and numeric computing environment developed by MathWorks. MATLAB allows matrix manipulations, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs written in other languages. Although MATLAB is intended primarily for numeric computing, an optional toolbox uses the MuPAD symbolic engine allowing access to symbolic computing abilities. An additional package, Simulink, adds graphical multi-domain simulation and model-based design for dynamic and embedded systems. As of 2020, MATLAB has more than 4 million users worldwide. MATLAB users come from various backgrounds of engineering, science, and economics.

### **BISECTION METHOD**

This method is based on Theorem which states that if a function is continuous between and , and and are of opposite signs, then there exists at least one root betweenand For definiteness, let be negative and be positive. Then the root lies between and and let its approximate value be given by . If , we conclude that xO is a root of the equation = 0. Otherwise, the root lies either between xO and b, or between xO and a depending on whether f (xO) is negative or positive. We designate this new interval as [a1, b1] whose length is |b – a|/2. As before, this is bisected at x1 and the new interval will be exactly half the length of the previous one. We repeat this process until the latest interval (which contains the root) is as small as desired, say . It is clear that the interval width is reduced by a factor of

one-half at each step and at the end of the nth step, the new interval will be [an, bn] of

length |b - a |/2ⁿ. We then have

which gives on simplification

Equation gives the number of iterations required to achieve an accuracy . For example, if and , then it can be seen that

The method is shown graphically

![](https://snipboard.io/GXt1wz.jpg)

It should be noted that this method always succeeds. If there are more roots than one in the interval, bisection method finds one of the roots. It can be easily programmed using the following computational steps:

1. Choose two real numbers a and b such that
2. Set
3. If , the root lies in the interval Then, set and go to step 2 above.

(b) If f (a) f (xr) \&gt; 0, the root lies in the interval (xr, b). Then, set a = xr and go to step 2.

(c) If f (a) f (xr) = 0, it means that xr is a root of the equation f (x) = 0 and the computation may be terminated.

In practical problems, the roots may not be exact so that condition (c) above is never satisfied. In such a case, we need to adopt a criterion for deciding when to terminate the computations.

Bisection.m
```matlab
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

```
bsfun.m
```matlab
%bisection Function

function out = bsfun(x)

out=x\*exp(x)-1;
```
output

bisection
```
you can change function in bsfun.m

enter maximum value 1

enter minimum value 0

enter tolerance .001

on 1 th iteration, value of c= 0.500000

on 2 th iteration, value of c= 0.750000

on 3 th iteration, value of c= 0.625000

on 4 th iteration, value of c= 0.562500

on 5 th iteration, value of c= 0.593750

on 6 th iteration, value of c= 0.578125

on 7 th iteration, value of c= 0.570312

on 8 th iteration, value of c= 0.566406

on 9 th iteration, value of c= 0.568359

on 10 th iteration, value of c= 0.567383
```

### **METHOD OF FALSE POSITION**

This is the oldest method for finding the real root of a nonlinear equation and closely resembles the bisection method. In this method, also known as regula-falsi or the method of chords, we choose two points a and b such that f (a) and f (b) are of opposite signs. Hence, a root must lie in between these points. Now, the equation of the chord joining the two points [a, f (a)] and [b, f (b)] is given by

The method consists in replacing the part of the curve between the points [a, f (a)] and [b, f (b)] by means of the chord joining these points, and taking the point of intersection of the chord with the x-axis as an approximation to the root. The point of intersection in the present case is obtained by putting y = 0 in Eq. Thus, we obtain

which is the first approximation to the root of f (x) = 0. If now f (x1) and f (a) are of opposite signs, then the root lies between a and x1, and we replace b by x1 in Eq. and obtain the next approximation. Otherwise, we replace a by x1 and generate the next approximation. The procedure is repeated till the root is obtained to the desired accuracy. Figure gives a graphical representation of the method. The error criterion Eq. can be used in this case also.

![](https://snipboard.io/mkAahg.jpg)

fp.m
```matlab
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
  ```
fpfun.m
```matlab
function out = fpfun(x)

out=(x\*exp(x)-1);
```
output

you can change function in fpfun.m
```
enter maximum value 1

enter minimum value 0

enter tolerance .001

on 1 th iteration, value of c= 0.367879

on 2 th iteration, value of c= 0.503314

on 3 th iteration, value of c= 0.547412

on 4 th iteration, value of c= 0.561115

on 5 th iteration, value of c= 0.565308

on 6 th iteration, value of c= 0.566585

on 7 th iteration, value of c= 0.566974

on 8 th iteration, value of c= 0.567092

on 9 th iteration, value of c= 0.567128

on 10 th iteration, value of c= 0.567139

on 11 th iteration, value of c= 0.567142

on 12 th iteration, value of c= 0.567143

on 13 th iteration, value of c= 0.567143

on 14 th iteration, value of c= 0.567143

on 15 th iteration, value of c= 0.567143

on 16 th iteration, value of c= 0.567143

on 17 th iteration, value of c= 0.567143

on 18 th iteration, value of c= 0.567143

on 19 th iteration, value of c= 0.567143

on 20 th iteration, value of c= 0.567143

on 21 th iteration, value of c= 0.567143

on 22 th iteration, value of c= 0.567143

on 23 th iteration, value of c= 0.567143

on 24 th iteration, value of c= 0.567143

on 25 th iteration, value of c= 0.567143

on 26 th iteration, value of c= 0.567143

on 27 th iteration, value of c= 0.567143

on 28 th iteration, value of c= 0.567143

on 29 th iteration, value of c= 0.567143

on 30 th iteration, value of c= 0.567143
```

### **NEWTON–RAPHSON METHOD**

This method is generally used to improve the result obtained by one of the previous methods. Let x0 be an approximate root of f (x) = 0 and let x₁ = x0 + h be the correct root so that f (x₁) = 0. Expanding f (x0 + h) by Taylor&#39;s series, we obtain

Neglecting he second and higher-order derivatives, we have

which gives

A better approximation than is, therefore, given by , where

Successive approximations are given by , where

which is the _Newton-Raphson formula._

Geometrically, the method consists in replacing the part of the curve between the point [x0, f (x0)] and the x-axis by means of the tangent to the curve at the point, and is described graphically in Fig. 2.3. It can be used for solving both algebraic and transcendental equations and it can also be used when the roots are complex.

![](https://snipboard.io/Q5obNM.jpg)

nr.m
```matlab
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
```

nrfun.m
```matlab
function out = nrfun(x)

out=x\*exp(x)-1;

end
```
nrfun\_diff.m
```matlab
function out = nrfun\_diff(x)

out=x\*exp(x)+exp(x);

end
```
output

```
enter initial guess 5

enter tolerance .001

One root is 4.167790 obtained at 1th iteration

One root is 3.364293 obtained at 2th iteration

One root is 2.601350 obtained at 3th iteration

One root is 1.899619 obtained at 4th iteration

One root is 1.296094 obtained at 5th iteration

One root is 0.850774 obtained at 6th iteration

One root is 0.621848 obtained at 7th iteration

One root is 0.569502 obtained at 8th iteration

One root is 0.567148 obtained at 9th iteration

One root is 0.567143 obtained at 10th iteration
```
### **Conclusion**

In open ended method we only need one guess to find the root. In case of Bracket method, we need 2 guess to find the root. Also in both bracket method we have linear error convergence, but in Newton Rapson method error convergence in Quadratic so we reach root speedily .

### **Reference**

1. S.S. Sastry - Introductory methods of numerical analysis

1. [https://www.mathworks.com/](https://www.mathworks.com/)

1. [https://github.com/athulkrishna2015/Solution-of-Algebraic-and-Transcendental-Equations-using-MATLAB](https://github.com/athulkrishna2015/Solution-of-Algebraic-and-Transcendental-Equations-using-MATLAB)
