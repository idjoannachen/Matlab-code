%% 13.4
%compute A and b
n=10;
A=zeros(n,n);
for j=1:n
    for k=1:n
        A(j,k)=j*(j-1)/(j+k-1)-1/(j+k+2);
    end   
end

b=zeros(n,1);
for k=1:n
    b(k,1)=1/(2*k+4);
end

c=A\b;

%% 13.6
%compute S and G
n=10;
S=zeros(n,n);
for j=1:n
    for k=1:n
        S(j,k) = (2*j*k+j+k)/((k+j)*(k+j+1)*(k+j+2));
    end   
end

G=zeros(n,n);
for j=1:n
    for k=1:n
        G(j,k) = 1/(j+k+2) - 2/(j+k+3) + 1/(j+k+4);
    end
end

[V,D]=eig(S,G)
%compare with alpha
alpha=-sqrt(D);

%% 13.10
%need to compute G,-S (note: In the code, I used S to denote -S, ditto for the next problem.)
n=10;
S=zeros(n,n);
for j=1:n
    for k=1:n
        S(j,k) = j*(j-1)/(k+j-1) - j*(j-1)/(k+j) - (j+1)*j/(k+j) + (j+1)*j/(k+j+1);
    end   
end

G=zeros(n,n);
for j=1:n
    for k=1:n
        G(j,k) = 1/(j+k+1) - 2/(j+k+2) + 1/(j+k+3);
    end
end

A = -inv(G)*S;
%solve for c0
b=zeros(n,1);
for k=1:n
    b(k,1)=1/(k+1) - 1/(k+2);
end
c0=G\b;
%Then pulg into u(x,t)=C0+summation from 1 to n c_k * phi_k, where c_k=exp(A*t) * c0

%% 13.14 
% need to compute A and -S
n=10;
S=zeros(n,n);
for i=1:n
    for j=1:n
        S(i,j) = j*(j-1)/(i+j-1) - 2*j^2/(i+j) +j*(j+1)/(i+j+1);
    end   
end

A=zeros(n,n);
for i=1:n
    for j=1:n
        A(i,j) = 1/(i+j+2) - 2/(i+j+3) - 1/(i+j+4);
    end
end

[V,D]=eig(S,A)
lambda=-sqrt(D);

%% 13.16 
%need to compute G,H,-S
n=10;
G=zeros(n,n);
for j=1:n
    for k=1:n
        G(j,k) = 1/(j+k+1) - 2/(j+k+2) + 1/(j+k+3);
    end
end

H=zeros(n,n);
for j=1:n
    for k=1:n
        H(j,k) = j/(j+k) - (2*j+1)/(j+k+1) + (j+1)/(j+k+2);
    end
end

S=zeros(n,n);
for j=1:n
    for k=1:n
        S(j,k) = j*(j-1)/(j+k-1) - 2*j^2/(j+k) + (j+1)*j/(j+k+1);
    end
end

%solve the first order differential equation system
I=eye(n);
A=[zeros(n,n) I;inv(G)*S -0.01*inv(G)*H]

%diagonalize A
[V,D] = eig(A);
y_coeff=V*exp(D)