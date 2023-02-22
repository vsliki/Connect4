function M = computer(M,player_number)
%INPUT: Board M and player number (1/2)
%OUTPUT: Board with the move made by the computer. 

%This function simulates a move from the computer. It enables to put the
%token at the best spot without taking in account the opponents score. 


    [~,j] = predict1(M,player_number); %Column where the score is zero 
    [M,~] = play(M,[player_number,j]); %Matrix with a move in the jth column.
end

