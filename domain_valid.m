function list = domain_valid(M)
%INPUT: Matrix M where the game is played
%OUTPUT: list containing the number of the columns in which the upper line is
%empty.

[~,m]=size(M); %m = the columns of M
k=1;
l=zeros(1,m); %initialisazion list of 7 empty elements.
for i=1:m
    
    if M(1,i)==0 %If the first line of the ith column is empty
        l(k)=i; %number of the ith column gets in the list.
        k=k+1; 
    end
  
end
list=l(1:k-1); %output: list of k elements, containing the number of the non complete columns.  
end
