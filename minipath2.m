function [distance,path]=dijkstra(A,s,e)

n=size(A,1);
D=A(s,:);
path=[];
visit=ones(1,n);
visit(s)=0;
parent=zeros(1,n);
for i=1:n-1
    temp=zeros(1,n);
    count=0;
    for j=1:n
        if visit(j)
            temp=[temp(1:count) D(j)];
        else
            temp=[temp(1:count) inf];
        end
        count=count+1;
    end
    [value,index]=min(temp);
    j=index; visit(j)=0;
    for k=1:n
        if D(k)>D(j)+A(j,k)
            D(k)=D(j)+A(j,k);
            parent(k)=j;
        end
    end
end


t = e;
while t~=s && t>0
    path =[t,path];
    p=parent(t);t=p;
end
path =[s,path];

if length(path)==1
    distance = A(s,e);
else
    distance=D(e);
end

end
