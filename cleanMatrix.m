function clean = cleanMatrix( A, tol )

    for i = 1:size(A,1)
        for j = 1:size(A,2)
           if A(i,j) <= tol
                A(i,j) = 0;
           end
        end
    end
clean = A;
end
