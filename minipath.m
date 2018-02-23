function COST=minipath(I,m,n)
[a,b,c] = size(I);
COST = zeros(a*b,3);
sum = 0;
for i = 1:a*b
cost = pixel_node(I,m,n);
a = min(min(cost));
sum = sum + a;
COST(i,1) = m;
COST(i,2) = n;
COST(i,3) = sum;
[x,y] = find(cost == a);
if x == 1
  if y == 1
    m = m-1;
    n = n-1;
  elseif  y == 2
    m = m-1;
  elseif y == 3
    m = m-1;
    n = n+1;
  end
elseif x == 2
  if y == 1;
    n = n-1;
  elseif y == 3
    n = n+1;
  end
elseif x == 3
  if y == 1;
    m = m+1;
    n = n-1;
  elseif y == 2
    m = m+1;
  elseif y == 3
    m = m+1;
    n = n+1;
  end
  end
if a == 0
  break;
end
end
