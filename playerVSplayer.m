function M = playerVSplayer(M)
%INPUT: Board M
%OUTPUT: Board of the game.

%Function that simulates a game between two human players. 

win=0; %Initialization

while win==0
    STR = input('Player 1: In which column do you want to place your token?  \n(Press 0 to quit the game). ','s'); %The computer asks us to press the number of the column on the keyboard.
    column = str2num(STR); %Converts the reply into a number.
    list = cat(2,domain_valid(M),0);
    while ~ismember(column,list) %If we play in an impossible position: play again.
        disp('The move is invalid. Type 0 to exit or enter a valid column');
        STR = input('Player 1: In which column do you want to place your token?  \n(Press 0 to quit the game). ','s');
        column = str2num(STR);
    end
    
    if column==str2num('0') %If we press 0
        win = 1; %We get out of the loop and quit the game.
        disp('Game over')
        return;
    end
    
    p1=[1,column]; %player1
    M = play(M,p1) %Matrix after player1's move.
    win=isWin(M,1); %Checks if he is a winner or not.
    if win==1 %If they won:
        disp('Player 1: You won'); 
        break;
    end
    
    STR = input('Player 2: In which column do you want to place your token?  \n(Press 0 to quit the game). ','s'); %The computer asks us to press the number of the column on the keyboard.
    column=str2num(STR); %Converts string to a number
    
    list = cat(2,domain_valid(M),0);
    while ~ismember(column,list) %Impossible place to play: Try again
        disp('The move is invalid. Type 0 to exit or enter a valid column');
        STR = input('Player 2: In which column do you want to place your token?  \n(Press 0 to quit the game). ','s');
        column=str2num(STR);
    end
    
    if column==str2num('0') %If we press 0
        win=1; %We get out of the loop and quit the game
        disp('Game over')
        return;
    end
    
    p2=[2,column]; %Player2
    M = play(M,p2) %Matrix after player2's move.
    win=isWin(M,2); %Checks if they won
    if win==1 %If player 2 won: 
        disp('Player 2: You won');
        break;
    end
    
    if M ~=0
        disp('It is a tie')
    end
    
end
end
