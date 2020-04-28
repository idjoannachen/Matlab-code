echo on
A=[1 2 3;4 5 6;7 8 9]
b=[1 1 0]
% Getting o.n.b. for R(A) using Fredholm alternative
N=null(A')
Fr=null(N')
Fr(:,1)'*Fr(:,2)
Fr(:,2)'*Fr(:,2)
Pb=(b*Fr(:,1))*Fr(:,1)+(b*Fr(:,2))*Fr(:,2)
6*Pb
% Gram-Schmidt
e1=A(:,1)/norm(A(:,1))
w2=A(:,2)-e1'*A(:,2)*e1
e2=w2/norm(w2)
w3=A(:,3)-e1'*A(:,3)*e1-e2'*A(:,3)*e2
% slash vs pinv
x1=A\b', disp(' What is that ???')
A*x1-Pb
x2=pinv(A)*b'
A*x2-Pb
x2*36
% orth function
colspace=orth(A), disp('What is that ???')
test=[Fr,colspace,e1,e2]
rank(test)
