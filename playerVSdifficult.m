function M = playerVSdifficult(M,k)
%INPUT: Matrix board, level of difficulty
%OUTPUT: Matrix of the game. 

%Function that simulates a game between a human player and a computer level
%'k'.

win=0;  %Initialization

while win==0
STR = input('In which column do you want to place your token? \n(Press 0 to exit the game)','s'); %press a column's number on the keyboard.
column=str2num(STR);%Converts answer to a number.
list = cat(2,domain_valid(M),0);
    while  ~ismember(column,list) %If invalid position to play, Try again.
        disp('The move is invalid. Type 0 to exit or enter a valid column');
        STR = input('In which column do you want to place your token? \n(Press 0 to exit the game)','s');
        column=str2num(STR);
    end
  
if column == str2num('0') %If we press 0
    win = 1; %We exit the game
    disp('Game over')
    return;
end

%p1=[1,column]; %Player1
M = player1(M,column)  %Matrix after player1's move
win=isWin(M,1); %Checks if winner or not.
if win==1  %if player 1 won
    disp('Congratulations! You won'); 
end

M = computerK(M,2,k) %Computer (level k ) as player2
win=isWin(M,2);  %Checks if winner or not
if win==1  %if computer won
    disp('You lost'); 
end

if M ~=0
    disp('It is a tie')
end

end
end