function out = direction(M,xy,d)
%INPUT: M the matrix of the game, xy the coordinates of
%a box where a token can be placed, and d a direction. 
%d can be given by any of these possibilities: (-1,-1);(-1,0);(-1,1);(0,-1)
% ;(0,1);(1,-1);(1,0);(1,1).

%OUTPUT: points correspondig to the number of alined tokens. 
%Points: 1 if there is only 1 token, 5 if 2 are alined, 50 for 3 and 1000
%for 4. 

%This function starts at one box given by xy and checks the boxes around it
%given by the direction d. Can tell if they are empty or belonging to the 
%same player as the token in box xy.
%This function also gives the number of alined tokens.


j=M(xy(1),xy(2)); %j = element of the M matrix. line: xy(1), column: xy(2).
next=zeros(1,2); %Matrix 1x2 of zeros
c=1; %initialization
out=0; %initialization
Q=1; %initialization.


%We fill our "next" matrix
for i=1:3
    % 1st element: the element next to the box xy in direction d
    next(1)=xy(1)+i*d(1); 
    % 2nd element: the element spaced by one box from xy in direction d.
    % (at dist 2 from xy)
    next(2)=xy(2)+i*d(2); 

    %Condition not to get out of the bounds of M.
    if next(1)<=0||next(2)<=0||next(1)>6||next(2)>7 
        out=0;
        Q='e'; %error.
        break;
    end
    
    %If the 2 boxes next to xy in direction d are empty
    if M(next(1),next(2))==0  
         c=1;
    
    %If the 2 boxes next to xy in direction d have both a token of the same player inside.     
    elseif M(next(1),next(2))==j 
        c=c+1;
    
    %If there is at least one token of the other player inside the 2 boxes
    %next to xy in direction d.
    else
        if M(next(1),next(2))~=0 
            Q='e'; %error.
            break;
        end
    end
    if c>Q 
        Q=c; 
    end
end

%Counting points
if Q==1 %1token
    out=1; %1 point
elseif Q==2 %2 alined tokens
    out=5; %5 points
elseif Q==3 %3 alined tokens
    out=50; %50 points
elseif Q==4 % 4 alined tokens
    out=1000; %1000 points.
elseif Q=='e' 
    out=0;
end


end

