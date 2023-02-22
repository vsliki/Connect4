function out = compVScomp(M)
%INPUT: Matrix board
%OUTPUT: Matrix board
%Function that simulates a game between 2 equally leveled computers. 

out=0;

while out==0 
    M=computer_2(M,1) %Move Computer level2 as player1.
    pause() %shows each move

        if isWin(M,1)==1 %If it wins
            disp('Computer 1 won') 
            out=1;    
        end
    
    M=computer_2(M,2)%Computer 2 plays as 2nd player. 
    pause() %shows each move

        if isWin(M,2)==1 %If it wins
            disp('Computer 2 won') 
            out=2; 
        end 
        if M ~=0
        disp('It is a tie')
        end
end
out=1;
end

