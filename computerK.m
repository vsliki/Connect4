function M = computerK(M,player_number,k)
%INPUT: M matrix board, player number (1/2) and the number of moves k it
%anticipates on its opponents moves. 
%OUTPUT: Matrix M with its moves

%Function that simulates a computer that anticipates k moves of its
%opponent and chooses the most strategic boxes to pu its token according to its opponent score.  

g=-10000; %Initialization
list = domain_valid(M); %List of all the non empty columns. 

for i=list
    M_t=M; %temporary matrix on which we evaluate our future move. 
    [M_t,a] = play(M_t,[player_number,i]); %Simulation of the next move. 
    vs = predict(M_t,a,k); %oponents score, predicted k moves earlier.
    scores_t = scores_temp(M_t,player_number)-vs; %Score of the simulate move. 
    
    if scores_t>=g %The biggest simulated score
        if scores_t>g
            g=scores_t;
            m=1;
            l=zeros(1,7); 
            l(m)=i; %Store in a matrix the columns of the moves that maximize the score, ie where we simulate our move.
        else
            m=m+1;
            l(m)=i;
        end   
    end
end
l=l(1:m); 
j=l(1,ceil(rand(1)*m)); %If we have multiple identical maximal scores in different columns, we pick randomly the one we will do our next move in.
[M,~] = play(M,[player_number,j]); %Move.

end


