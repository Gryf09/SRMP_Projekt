% Order statistic averaging CFAR 2D
function [noise_est,det_vect] = os_ca_cfar_2D(x, N_ref, N_guard, T)
    noise_est = zeros(size(x));
    det_vect = zeros(size(x));
    x_sort = [];
    
    for m = N_guard + N_ref + 1 : length(x) - N_guard - N_ref
       for n = N_guard + N_ref + 1 : length(x) - N_guard - N_ref
           % tworzenie tablicy komórek
           for mm = m-N_guard-N_ref : m+N_guard+N_ref
               for nn = n-N_guard-N_ref : n+N_guard+N_ref
                   if ~( (mm >= m-N_guard && mm <= m+N_guard) && (nn >= n-N_guard && nn <= n+N_guard) ) 
                    x_sort = [x_sort x(mm,nn)];
                   end
               end
           end
           % sort
           x_sort = sort(x_sort(:)); % zeby nie powstala macierz
           noise_est(m,n) = x_sort(round(end/2));
           x_sort = [];
         if x(m,n) > noise_est(m,n) * T
            det_vect(m,n) = 1;
         end
       end 
    end
end