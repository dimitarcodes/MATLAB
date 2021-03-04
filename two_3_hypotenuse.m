a = [1:5];  % initialize array of first leg
b = [1:5];  % initialize array of second leg
for i = 1:5
    a(i) = input(['enter number a', int2str(i),' :']);  % acquire values for first leg
    b(i) = input(['enter number b', int2str(i),' :']);  % acquire values for second leg
end 

hyp = zeros(5,5);   % initialize matrix of hypotenuses

% for each combination of 2 legs calculate the hypotenuse
for i = 1:5
    for j = 1:5
        hyp(i,j) = sqrt(a(i)^2 + b(j)^2);
    end
end

disp(hyp);