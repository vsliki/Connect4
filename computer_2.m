function M = computer_2(M,player_number)
%INPUT: Board M and player number (1/2)
%OUTPUT: Board with the move made by the computer. 

%This function simulates a level-2 computer, which anticipates the 2 next moves of its opponent.
% It enables to put the token at the most strategic position according to
% its anticipation. 
%pseudo 'level2'.


g=-10000; %initialization
list = domain_valid(M); %list of the non empty columns

for i=list
    M_t=M; %Temporary matrix on which we evaluate the next move.
    [M_t,a] = play(M_t,[player_number,i]); %Simulation of a move in ith column
    [vs,~] = predict1(M_t,a); %Opponent's best score.
    scores_t = scores_temp(M_t,player_number)-vs; %Score of the best simulated move.
    if scores_t>=g %Best score of the simulated scores. 
        
        if scores_t>g %If it's > we keep the column of the move corresponding to this score.
            g=scores_t;
            k=1;
            l=zeros(1,7);
            l(k)=i; %store column
        else
            k=k+1; 
            l(k)=i; %If 2 cols return same score, we store both column numbers. 
        end
        
    end
end
l=l(1:k); %list of the max scores. 
j=l(1,ceil(rand(1)*k)); %We chose randomly in the list, the one where the move will be made.
[M,~] = play(M,[player_number,j]); %New matrix with token in that column (where the score will be maximized). 

end



