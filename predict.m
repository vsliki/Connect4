function out = predict(M,player,k)
%INPUT: M board, player and k the number of moves anticipated. 
%OUTPUT: returns the score predicted after k anticipations + the one at
%that move.

out = predict_rec(M,k,player); %Predicted score for k anticipations.
out= out + predict1(M,player); %Score + predicted one.
end

