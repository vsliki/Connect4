function out = compVScompK(M,k)
%INPUT: Matrix board
%OUTPUT: Matrix board
%Function that simulates a game between a computer level 2 and a computer level k. 

out=0;

while out==0
    list = position(M,0); %Lists all coords where we have a zero in the matrix
    j=length(list(:,1)); %Length of the list.
    
    
    if j>=(k+3) %If list's legth is bigger thant the number of anticipations of the computer (k+3) 
        M=computerK(M,1,k) %The computer anticipates k moves.
    elseif j>=3 %Else its >= 3, it anticipates 2 moves.
        M=computer_2(M,1)
    else %Otherwise it doesnt anticipate and just plays one move.
        M=computer(M,1)
    end
    
    if isWin(M,1)==1 %If second computer wins:
        fprintf('Level %d computer won',k) 
        out=2;
        break;
    end
    
    
    if j>=2 %If the length of the list is >=2, computer anticipates 2 moves
        M=computer_2(M,2)
    else %Else plays without anticipating.
        M=computer(M,2)
    end
   
    if isWin(M,2)==1 %If first computer wins
        disp('Level 2 computer won.') 
        out=1;
        break;
    end
    
    
    
    if M ~=0
    disp('It is a tie')
    end
end
out=1;


end

