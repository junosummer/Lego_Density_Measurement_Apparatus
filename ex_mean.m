function [result] = ex_mean(A)
first_mean = mean(A(:,2));
B = [];
for i = 1:length(A)
    if A(i, 2) < (first_mean+10) && A(i, 2) > (first_mean-10)
    B = [B; A(i, 2)];
    end
end
result = mean(B);
