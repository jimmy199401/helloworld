function B = LBP( A )

   [m,n] = size(A);
   B = zeros(m,n);
   for i=2:m-1
        for j = 2:n-1
            T = A(i-1:i+1,j-1:j+1);
            B(i,j) = getLbpCode(T);
        end
   end

end

function value = getLbpCode(t)
    temp = [t(1,1),t(1,2),t(1,3),t(2,3),t(3,3),t(3,2),t(3,1),t(2,1)];
    center = t(2,2);
    tempBool = temp > center;
    i = 7;
    temp = 0;
    for n=tempBool
        temp = n*2^i+temp;
        i = i-1;
    end
    value = temp;
end