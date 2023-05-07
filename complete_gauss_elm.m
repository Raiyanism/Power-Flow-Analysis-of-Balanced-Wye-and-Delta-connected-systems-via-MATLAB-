function x= complete_gauss_elm(a)
n=length(a)-1;
x=zeros(1,n);
for i=1:n
    a(i,:)=a(i,:)/a(i,i);
    for j=i+1:n
        a(j,:)=a(j,:)-a(j,i)*a(i,:);
    end
end
for p=n:-1:1
    for q=p-1:-1:1
        a(q,:)=a(q,:)-a(q,p)*a(p,:);
    end 
end
x(1:n)=a(1:n,end);
end