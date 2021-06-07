% CA CFAR 2D
function [noise_est,det_vect] = ca_cfar_2D(x, N_ref, N_guard, T)
    noise_est = zeros(size(x));
    det_vect = zeros(size(x));
    N = (2*N_guard + 2*N_ref + 1)^2 - (2*N_guard + 1)^2; % liczba testowanych komórek
    
    for m = N_guard + N_ref + 1 : length(x) - N_guard - N_ref
       for n = N_guard + N_ref + 1 : length(x) - N_guard - N_ref
         noise_est(m,n) = ( sum(sum( x(m - N_guard - N_ref:m + N_guard  + N_ref,n - N_guard - N_ref : n + N_guard  + N_ref))) - sum(sum( x(m - N_guard : m + N_guard, n - N_guard : n + N_guard  ))) ) / N;
         
         if x(m,n) > noise_est(m,n) * T
            det_vect(m,n) = 1;
         end
       end 
    end
end