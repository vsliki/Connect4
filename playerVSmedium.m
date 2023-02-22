function M = playerVSmedium(M)
%INPUT: Matrix board
%OUTPUT: Matrix of the game. 

%Function that simulates a game between a human player and a computer level
%2 (medium level).

win=0; %Initialization

while win==0
STR = input('In which column do you want to place your token? \n(Press 0 to exit the game)','s'); %press a column's number on the keyboard.
column=str2num(STR); %Converts answer to a number
list = cat(2,domain_valid(M),0);
     while  ~ismember(column,list) %Move out of bonds, play again.
        disp('The move is invalid. Type 0 to exit or enter a valid column');        
        STR = input('In which column do you want to place your token? \n(Press 0 to exit the game)','s');
        column=str2num(STR);
     end
        
if column == str2num('0') %If we press 0
    win = 1; %We exit the game
    disp('Game over')
    return;
end

M = player1(M,column) %Matrix after player1's move
win=isWin(M,1); %Checks if player1 won
if win==1 %If player1 is a winenr
    disp('Congratulations! You won'); 
    break;
    
end
M = computer_2(M,2) %Computer (level k ) as player2
win=isWin(M,2); %Checks if winner or not  
if win==1 %if computer won
    disp('You lost');
    break;
end

if M ~=0
    disp('It is a tie')
end

end
end

