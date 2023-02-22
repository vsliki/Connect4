function M = player2(M,column)
%INPUT: M board, column where the move is made.
%OUTPUT: New board with the move played.
%Function that simulates player2's move.


p=[2,column]; %2, bcs player 2; column = where the player wants to play his token.
M = play(M,p); %New matrix M with player's move.
end

