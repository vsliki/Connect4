
function M = player1(M,column)
%INPUT: M board, column where the move is made.
%OUTPUT: New board with the move played.
%Function that simulates player1's move.


p1=[1,column]; %1, bcs player 1; column = where the player wants to play his token.
M = play(M,p1); %New matrix M with player's move.
end
