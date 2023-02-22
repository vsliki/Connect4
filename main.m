M=zeros(6,7) %Initial matrix

%%
%Player VS Player: 
M=zeros(6,7) %Initial matrix
M = playerVSplayer(M) 
%%
%Player VS Computer level easy: computer plays randomly
M=zeros(6,7) %Initial matrix
M = playerVSrandom(M)

%%
%Player VS Computer level medium:  %computer that anticipates 2 moves of the player 
M=zeros(6,7) %Initial matrix
M = playerVSmedium(M);

%%
%Player VS Computer level difficult:
M=zeros(6,7) %Initial matrix
k=4 ; %Number of anticipated moves by the computer 
M=playerVSdifficult(M,k);

%%
%Computer VS Computer %2computers of same level playing against each other:
M=zeros(6,7) %Initial matrix
M = compVScomp(M)

%%
%Computer VS Computer level difficult: %Computer anticipating 2 moves playing against computer anticipating k moves. 
M=zeros(6,7) %Initial matrix
k=3; %Number of anticipated moves by the compuer:
M=compVScompK(M,k);