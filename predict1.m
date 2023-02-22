function [s,j] = predict1(M,player)
%INPUT: Matrix board M, player (1/2)
%OUTPUT: s: score, j: column number where the player should do their next
%move to maximize their score.

%Function that allows the player to evaluate his score according to the
%possible future moves. 

g=-10000; %initialization
list = domain_valid(M); %Looks at possible move positions.

for i=list
    scores_t=scores(M,player,i);  %CComputes players score if he does a move in the ith column.
    if scores_t>=g %the greatest score amongst the simulated ones.
        if scores_t>g %Score strictly greater
            g=scores_t; %store score 
            k=1; 
            l=zeros(1,7); 
            l(k)=i; %We store in this matrix the column where the move's score is the highest
        else
            k=k+1; %If 2 similar scores in 2diff cols we store both cols.
            l(k)=i;
        end
        
    end
end

l=l(1:k); %lists the columns where the score is maximized
j=l(1,ceil(rand(1)*k)); %Choose randomly between the columns where the score is maximal where to play.
s=g; 

end

