% Greatest of averaging CFAR 2D
function [noise_est,det_vect] = go_ca_cfar_2D(x, N_ref, N_guard, T)
    noise_est = zeros(size(x));
    det_vect = zeros(size(x));
    mean_l = 0;
    mean_r = 0;
    noise_guard = 0;
    
    N = sum([1:2*N_guard + 2*N_ref + 1]) - sum([1:2*N_guard + 1]) ; % liczba komórek testowanych w jednej po³ówce
    for m = N_guard + N_ref + 1 : length(x) - N_guard - N_ref
       for n = N_guard + N_ref + 1 : length(x) - N_guard - N_ref
           
        mean_l = 0;
        mean_r = 0;
            
           % xl 
           noise_guard = 0;
           for k = 0 : 2*(N_ref + N_guard)
               mean_l = mean_l + sum(x(m-N_guard-N_ref : m+N_guard+N_ref-k,n-N_guard-N_ref+k)) ;
           end
           for k = 0 : 2*N_guard
               noise_guard = noise_guard + sum(x(m-N_guard : m+N_guard-k,n-N_guard+k)) ;
           end
           mean_l = mean_l - noise_guard;
           mean_l = mean_l/N;
           
           % xr 
           noise_guard = 0;
           for k = 0 : 2*(N_ref + N_guard)
               mean_r = mean_r + sum(x(m-N_guard-N_ref : m+N_guard+N_ref-k,n+N_guard+N_ref-k)) ;
           end
           for k = 0 : 2*N_guard
               noise_guard = noise_guard + sum(x(m-N_guard : m+N_guard-k,n+N_guard-k)) ;
           end
           mean_r = mean_r - noise_guard;
           mean_r = mean_r/N;
           
           % MAX
           noise_est(m,n) = max(mean_l,mean_r);
         
         if x(m,n) > noise_est(m,n) * T
            det_vect(m,n) = 1;
         end
         
       end 
    end
end