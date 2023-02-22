function s = scores(M,player,i)
%INPUT: M board, player (1/2) and i the simulated move's column
%OUTPUT: score of that move in column i.

%Function that returns our score for the move in column i.


M_t=M; %temporary matrix on which we will evaluate are future move.
[M_t,a] = play(M_t,[player,i]); %Simulation of a move in the ith column.
vs = scores_temp(M_t,a); %score of the opponent(a=1 ou 2, the opponent)
s = scores_temp(M_t,player)-vs; %Score of the simulated move (our score - the opponent's).
end

