function M = playerVSrandom(M)
%INPUT: Matrix board
%OUTPUT: Matrix of the game. 

%Function that simulates a game between a human player and a computer playing randomly.

win=0; %Initialization

while win==0
    STR = input('In which column do you want to place your token? \n(Press 0 to exit the game)','s'); %press a column's number on the keyboard.
    column=str2num(STR);  %Converts answer to a number
    list = cat(2,domain_valid(M),0);
    while ~ismember(column,list) %If we play outside the bounds of the board. Start over
        disp('The move is invalid. Type 0 to exit or enter a valid column');   
        STR = input('In which column do you want to place your token? \n(Press 0 to exit the game)','s');
        column=str2num(STR);
    end

    if column == str2num('0')%If we press 0
        win = 1; %We exit the game
        disp('Game over')
        return;
    end
            
    p1=[1,column]; %Player1
    M = play(M,p1)  %Matrix after player1's move
    win=isWin(M,1); %Checks if player1 won
    if win==1 %If player1 is a winner
    disp('Congratulations! You won'); %
        break;
    end

    M = random_computer(M,2) %Computer (level random ) as player2
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
