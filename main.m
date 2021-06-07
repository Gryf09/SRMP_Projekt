% SRMP Projekt

clc; clear all; close all;

x = generate_radar_data();
% x = db(x);

disp('Por�wnanie algorytm�w CFAR 2D')

while(1)
   N_guard = input('Liczba kom�rek ochronnych: ');
   N_ref = input('Liczba kom�rek referencyjnych: ');
   T = input('Sta�a T do wyznaczania progu (1:10): ');
   str = input('Wybierz algorytm (CA, SO, GO, OS): ','s');
   switch str
       case 'CA'
           close all
           imagesc(x)
            colorbar
            title("Dane z Radaru")
           
           disp('Algorytm CA')
            [noise_est,det_vect] = ca_cfar_2D(x, N_ref, N_guard, T);

            figure
            imagesc(noise_est)
            colorbar
            title("Pr�g szum�w CA CFAR 2D")

            figure
            imagesc(det_vect)
            colorbar
            title("Detekcja CA CFAR 2D")
 
       case 'SO'
           close all
           imagesc(x)
            colorbar
            title("Dane z Radaru")
            
            disp('Algorytm SO')
            [noise_est,det_vect] = so_ca_cfar_2D(x, N_ref, N_guard, T);

            figure
            imagesc(noise_est)
            colorbar
            title("Pr�g szum�w SO CA CFAR 2D")

            figure
            imagesc(det_vect)
            colorbar
            title("Detekcja SO CA CFAR 2D")

       case 'GO'
           close all
           imagesc(x)
            colorbar
            title("Dane z Radaru")
            
            disp('Algorytm GO')
            [noise_est,det_vect] = go_ca_cfar_2D(x, N_ref, N_guard, T);

             figure
            imagesc(noise_est)
            colorbar
            title("Pr�g szum�w GO CA CFAR 2D")

            figure
            imagesc(det_vect)
            colorbar
            title("Detekcja GO CA CFAR 2D")
            
       
       
       case 'OS'
           close all
           imagesc(x)
            colorbar
            title("Dane z Radaru")
            
            disp('Algorytm OS')
            [noise_est,det_vect] = os_ca_cfar_2D(x, N_ref, N_guard, T);

            figure
            imagesc(noise_est)
            colorbar
            title("Pr�g szum�w OS CA CFAR 2D")

            figure
            imagesc(det_vect)
            colorbar
            title("Detekcja OS CA CFAR 2D")

       
       case 'q' 
       break
       case 'Q' 
       break
   end
end
