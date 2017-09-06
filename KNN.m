function KNN=KNN(x,data,labels,k)
%x:the test vector
%data:the data
%labels: the labels for each vector in data
%k:the number of K
%KNN:the label of vector x
n=size(x,2);
distance=zeros(3,size(data,1));
for j=1:size(data,1)
    for i =1:n
        distance(1,j)=distance(1,j)+sqrt((x(i)-data(j,i))^2);
    end
    distance(2,j)=j;
    distance(3,j)=labels(j);
end
distance=sortrows(distance,1);
choose_labels=zeros(1,size(data,1));
for i=size(data,1):-1:(size(data,1)-k+1)
    choose_labels(distance(3,i))=choose_labels(distance(3,i))+1;
end
max=zeros(1,2);
for i=1:size(data,1)
    if choose_labels(i)>max(1)
        max(1)=choose_labels(i);
        max(2)=i;
    end
end
KNN=max(2);