%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Romberg integration method
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Instructions to use the function
%
% The user must provide the function as an anonymous function in the comand
% window. This can be done by introducing
%
%       f=@(x) x.*exp(2*x)
% 
% Then, the user should invoke the function by indicating four parameters: 
%
%        Romberg(f,lmin,lmax,k) 
%
% where f is the integrad and k is the number of extrapolations. lmin and lmax 
% are the lower and upper limits of the definitive integrand. It prints the
% table used to performed the extrapolations. 
%
function [P]=Rombergconfun(f,lmin,lmax,k)
% A matrix is create to contain all the necesary values 
P=zeros(k);
% The firs row is filled by using trapezoidal method. Everty row is done in
% a different step
for kk=1:k
    P(kk,1)=Trap(f,lmin,lmax,kk);
    close all
end
% Counter to take account how the table should be filled 
nn=0;
% Every element is calculated using the expression given in the book. For
% loops are used to span all the combinations of indexes. 
for kk=2:k
    for jj=2:k
        if jj+nn>k
            break
        end
        P(jj+nn,kk) = (4^(kk-1)*P(jj+nn,kk-1)-P(jj-1+nn,kk-1))/(4^(kk-1)-1);
    end
    nn=nn+1;
end
end