function out = isWin(M,player)

%INPUT: M the matrix we play on and a player (either 1 or 2).
%OUTPUT: 1 if the player has won, 0 else. 

%Function analyzes if 4tokens of a same player are alined = they won. 
%Calls the position function, which states all the coordinates of the boxes
%in which one player has a token.
%At each position, the isWin function analyzes in all directions if there
%are 4 alined tokens. (calling the direction function) 

L=position(M,player); %List of the positions of the tokens of the player.
[n,m]=size(L); 
out=0; %False
for i=1:n 
    for j=-1:1:1 %j=-1,0,1
        for k=-1:1:1 %k=-1,0,1
            if j~=0||k~=0 %not (0,0)
                c=direction(M,L(i,:),[j,k]); %compute the number of alined tokens from position i in all directions.
                %if 1: 1, if 2: 5, if 3: 50, if 4: 1000.
                if c>=1000 %if 4 tokens are in a line, functions returns 1.
                    c;
                    out=1; %True
                    break;
                end
            end
        end
    end
    
end

