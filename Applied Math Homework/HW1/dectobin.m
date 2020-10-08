function y=dectobin(num,N)
%input: number in base 10
%decimal place: N-1
N=N-1
count=0;
temp_num=num;
binary=zeros(1,N);
while(N)
    count=count+1;%length<N
    if(count>N)
        N=0;
    end
    temp_num=temp_num*2;%times 2, take the integer part. 
    if temp_num>1
        binary(count)=1;
        temp_num=temp_num-1;  
    elseif(temp_num==1)
        binary(count)=1;
        N=0; %stop the loop
    else
       binary(count)=0;     
    end
end
y=binary;

