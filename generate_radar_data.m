% Order statistic averaging CFAR 2D
function x = generate_radar_data()
    A = 10;
    A2 = 8;
    N = 100;
    P1 = 60; % Przeszkoda 1
    P2 = [30 40]; % Przeszkoda 2
    P3 = 50; % Przeszkoda 3
    
    x = abs(randn(N)); % szum
    x(P1:N,P1:N) = 2 * abs(randn(N-P1+1)); % Przeszkoda 1
    x(P2(1):P2(2),P2(1):P2(2)) = 2 + abs(randn(P2(2)-P2(2)+1)); % Przeszkoda 2
    x(P3,:) = 3 + abs(randn(1,N));

    x(23,20) = A;
    x(23,19) = A;
    x(23,18) = A2;

    x(45,23) = A;
    x(45,22) = A;

    x(71,68) = A;
    x(70,68) = A;
    x(69,68) = A;
    x(68,68) = A;

    x(21,80) = A2;
    x(20,80) = A2;
    x(20,79) = A2;
    x(21,79) = A2;

    x(80,15) = A2;
    x(80,16) = A2;
    x(79,15) = A2;
    x(79,16) = A;
    x(78,15) = A;
    x(78,16) = A;

    x(21,20) = A;
    x(21,19) = A;
    x(21,18) = A2;
    
    % x = db(x);
    
end