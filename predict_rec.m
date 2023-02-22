function out = predict_rec(M,k,player)
%INPUT: M board, player(1/2), k the number of moves anticipated.
%OUTPUT: Score of the most strategic spot to do the next move according to
%the anticipated moves. 

%Recursive function that anticipates k moves and their scores to predict
%the best spot to make the next move.



if k==0 %If k = 0, we dont anticipate any move. we use predict1.
    [out,~]=predict1(M,player); 
    
else
    G=-100000; %Initialization
    list = domain_valid(M); %Lists all columns we can play into.
    
    for i=list
        if scores(M,player,i)>=-100 %If the player's score in the ith column is >= -100 
            [M_,a]=play(M,[player,i]); %We define a new matrix M_ with the move at position i.      
            T = predict_rec(M_,k-1,a); %we iterate over the score. 
        else
            T=0; %otherwise we dont call the function again
        end
        
            T = scores(M,player,i) - T; %returns the players score where they put their token. The predicted score at the previous iteration.
            
            if T >= G
               G = T;
               out = T; %return T.
            end
            
    end
end

end

