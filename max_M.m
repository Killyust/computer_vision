function M=max_M(I)

[x,y,z] = size(I);
M = 0;
A = zeros(x,y);
A = uint8(A);
for i = 2:(x-1)
for j = 2:(y-1)

%R channel cost
aR = I((i-1):(i+1),(j-1):(j+1),1);
dR = zeros(3);
%3*3 matrix of link

dR(1) = abs(aR(2)-aR(4))/sqrt(2);
dR(2) = abs((aR(1)+aR(4))/2 - (aR(3)+aR(6))/2)/2;
dR(3) = abs(aR(2)-aR(6))/sqrt(2);
dR(4) = abs((aR(2)+aR(1))/2 - (aR(7)+aR(8))/2)/2;
dR(6) = abs((aR(2)+aR(3))/2 - (aR(9)+aR(8))/2)/2;
dR(7) = abs(aR(4)-aR(8))/sqrt(2);
dR(8) = abs((aR(4)+aR(7))/2 - (aR(6)+aR(9))/2)/2;
dR(9) = abs(aR(6)-aR(8))/sqrt(2);

%G channel cost
aG = I((i-1):(i+1),(j-1):(j+1),2);
dG = zeros(3);
%3*3 matrix of link

dG(1) = abs(aG(2)-aG(4))/sqrt(2);
dG(2) = abs((aG(1)+aG(4))/2 - (aG(3)+aG(6))/2)/2;
dG(3) = abs(aG(2)-aG(6))/sqrt(2);
dG(4) = abs((aG(2)+aG(1))/2 - (aG(7)+aG(8))/2)/2;
dG(6) = abs((aG(2)+aG(3))/2 - (aG(9)+aG(8))/2)/2;
dG(7) = abs(aG(4)-aG(8))/sqrt(2);
dG(8) = abs((aG(4)+aG(7))/2 - (aG(6)+aG(9))/2)/2;
dG(9) = abs(aG(6)-aG(8))/sqrt(2);

%B channel cost
aB = I((i-1):(i+1),(j-1):(j+1),3);
dB = zeros(3);
%3*3 matrix of link

dB(1) = abs(aB(2)-aB(4))/sqrt(2);
dB(2) = abs((aB(1)+aB(4))/2 - (aB(3)+aB(6))/2)/2;
dB(3) = abs(aB(2)-aB(6))/sqrt(2);
dB(4) = abs((aB(2)+aB(1))/2 - (aB(7)+aB(8))/2)/2;
dB(6) = abs((aB(2)+aB(3))/2 - (aB(9)+aB(8))/2)/2;
dB(7) = abs(aB(4)-aB(8))/sqrt(2);
dB(8) = abs((aB(4)+aB(7))/2 - (aB(6)+aB(9))/2)/2;
dB(9) = abs(aB(6)-aB(8))/sqrt(2);

D = zeros(3);
D(1) = sqrt((dR(1)*dR(1)+dG(1)*dG(1)+dB(1)*dB(1))/3);
D(2) = sqrt((dR(2)*dR(2)+dG(2)*dG(2)+dB(2)*dB(2))/3);
D(3) = sqrt((dR(3)*dR(3)+dG(3)*dG(3)+dB(3)*dB(3))/3);
D(4) = sqrt((dR(4)*dR(4)+dG(4)*dG(4)+dB(4)*dB(4))/3);
D(6) = sqrt((dR(6)*dR(6)+dG(6)*dG(6)+dB(6)*dB(6))/3);
D(7) = sqrt((dR(7)*dR(7)+dG(7)*dG(7)+dB(7)*dB(7))/3);
D(8) = sqrt((dR(8)*dR(8)+dG(8)*dG(8)+dB(8)*dB(8))/3);
D(9) = sqrt((dR(9)*dR(9)+dG(9)*dG(9)+dB(9)*dB(9))/3);

if M < max(max(D))
M = max(max(D));
end
end
end
