function out = scores_temp(M,player)
%INPUT; M board, player (1/2)
%OUTPUT. temporary score of the move of a player computing only their
%score (score of their possibilities according to their move) (and not their opponents)

%This function calls the position function that lists all the coordinates
%of a players tokens
%At each of them, it looks at every direction to analyze if 4tokens are
%alined.

L=position(M,player); %List containing all the position of the players tokens.
[n,m]=size(L); 
out=0; 

for i=1:n %We analyze all tokens of the player that are already played.
    for j=-1:1:1 %j= -1, 0, 1
        for k=-1:1:1 %k = -1, 0, 1 
            if j~=0||k~=0 %we dont mind (0,0)
                c = direction(M,L(i,:),[j,k]); %We check the score (number of alined tokens) of each played token. 
                out = c+out; %score
            end
        end
    end
    
end

