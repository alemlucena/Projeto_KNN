function data = outlier(N, r, dist1, outliers, noise)
    if nargin < 1
        N = 600;
    end
    if nargin < 2
        r = 5;
    end
    if nargin < 3
        dist1 = 8;
        dist2 = 6;
    end
    if nargin < 4
        outliers = 0.04;
    end
    if nargin < 5
        noise = 1;
    end
    N1 = round(N * (.5-outliers));
    N2 = N1;
    N3 = round(N * outliers);
    N4 = N-N1-N2-N3;
    phi1 = rand(N1,1) * pi;
    r1 = sqrt(rand(N1,1))*r;
    P1 = [-dist1 + r1.*sin(phi1) r1.*cos(phi1) ones(N1,1)];
    phi2 = rand(N2,1) * pi;
    r2 = sqrt(rand(N2,1))*r;
    P2 = [dist1 - r2.*sin(phi2) r2.*cos(phi2) 4*ones(N2,1)];    
    
    P3 = [rand(N3,1)*noise dist2+rand(N3,1)*noise 3*ones(N3,1)];    
    
    P4 = [rand(N4,1)*noise -dist2-rand(N4,1)*noise 2*ones(N4,1)];
    
    data = [P1; P2; P3; P4];
end