function out = position(M,player)
%INPUT: Board, player(1/2)
%OUTPUT: a 2col list giving the coordinates of all the tokens of a player.

l = 6; %initialization nb of lines.
c = 7; %initialization nb of columns.

List_position = zeros(100,2); %initialisazion list of positions.
k=1;

for i = 1:l
    for j = 1:c
        if M(i,j) == player %If a token is in the matrix, 
            List_position(k,1)= i; %Line in the first column of the list
            List_position(k,2)= j; %Column in the second column of the list
            k=k+1;
        end
    end
end
out=List_position(1:k-1,:); %List of all the positions of a player's tokens.
end