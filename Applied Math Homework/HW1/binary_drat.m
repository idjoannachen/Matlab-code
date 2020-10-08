tic
digits(100000);
num=vpa(pi)-3;
N=1000;
binary=zeros(1,N)

for i=1:N
    if (2.*num)<1
        binary(i)=0;
        num=2.*num;
    else
        binary(i)=1;
        num=2.*num-1;
    end
end
binary
toc
