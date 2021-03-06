function row = compare(Usernames,weightMatrix,who)
%who is the row of the corresponding user attempting to log in. For
%instance, if my attempt data is stored in row 14 of the weight matrix, 
%who would be equal to 14


dMatrix = ones(10,6); %10 registered users with 3 signatures each and
% 2 attempts to log in  
for p = 1:14 %check against 10 registered users' signatures and then 4 sets of
             % "empty signatures" that correspond to people who are
             % attmpeting to log in but haven't registered
    h = 1;
    for n = [0,1] %differentiates between first attempt and second attempt
        for m = [0,60,120] %sets beginning points of each recorded signature for the person
            difference = 0;
            for k = 1:60 %iterates through the weights of each segment 
                difference = difference + abs(weightMatrix(p,k+m) - weightMatrix(who,k+(180+60*n)));
            end 
            dMatrix(p,h) = difference;
            h = h + 1;
        end 
    end
end 

disp('  Log in attempt 1 differences | Log in attempt 2 differences');
disp(dMatrix);
[row,J] = find(dMatrix == min(dMatrix(:)));
disp(['Checking status of log in attempt from:', Usernames(who)]); 
if dMatrix(row,J) > 120
    disp('User not registered');
else
    disp('Closest match found at:');
    disp([row,J]);
    disp('With a difference value of:');
    disp(dMatrix(row,J));
    disp('The match belongs to user:');
    disp(Usernames(row));
end 