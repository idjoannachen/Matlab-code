function U=gauss_elim_pivoting(M)
% gaussian elimination with full pivoting
[m,n] = size(M);
k=1;
j=1;

while (j <= m) && (k <= n)
   
    a=abs(M(j:end,k)); %find absolute value below the pivot position
    
    if max(a)==0
        k=k+1;
        continue    % if all zeros below (and possibly including) the pivot, no need to swap rows, so move on to next column, 
                    % but stay on same row! <- this is where k is important
        
    elseif (max(a) > 0) && (M(j,k) == 0)  %need to deal with case that entry in the pivot position is zero
        b=M(j:end,k); %set b to be portion of k-th column below (and including) (j,k) position
        idx=find(b~=0,1); %selects first index for which entry under pivot position (j,k) is non-zero
        idx=idx+j-1; %reindex to get correct index for full j-th column
        
        %swap rows to get rid of zero in pivot position
        swap = M(j,:);
        M(j,:) = M(idx,:); 
        M(idx,:) = swap;
    end
    
    for i = j+1:m
        M(i,:) = M(i,:) - (M(i,k)/M(j,k))*M(j,:); % perform type III operations 
    end
    j=j+1;
    k=k+1;
end

U=M;
