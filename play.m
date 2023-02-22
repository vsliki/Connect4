function [M,p] = play(M,c)
%INPUT: M matrix of the game, c (of size 1x2) where the first element is
%the player(1/2) and the second the column in which they play.
%OUTPUT: M matrix with a token (1/2) in position c(2) and p (=1/2) the
%player who should play next.

%This function represents one's turn in the game.

m=6; %nb of lines of the matrix.

g=-10000; %initialization

%Random move.
%If we write 'r' instead of 1/2 for the column in which we want to play,
%the computer chooses randomly a column (1-7) in which to put a token.
if c(2)=='r' %write 'r'
    c(2)=ceil(rand(1)*7); %random column.
end

    for i=1:m         
        %If there is already a token in the column, we add ours over it
        if M(i,c(2))~=0 %if position i different from 0 ->,c(2) is busy
            
            if i>1
            M(i-1,c(2))=c(1); %we play (player c(1)) over that position.
            end
            break;
            
        %If the column is empty    
        elseif i==m %lowest row of the matrix. 
             M(i,c(2))=c(1); %we play (player c(1)) in the lowest position. 
        end
        
        
    end
    p=1+mod((c(1)),2); %=2 if player is 1, 1 if player is 2. 
    %Defines the next player.
end

