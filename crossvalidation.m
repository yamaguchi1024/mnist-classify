load digit.mat
%training data
TR_X=[];
TR_Y=[];
for i=1:size(X,3)
  for j=1:size(X,2)
    TR_Y=[TR_Y; i];
    TR_X=[TR_X; X(:,j,i)'];
  end
end

%test data
T_X=[];
T_Y=[];
for i=1:size(T,3)
  for j=1:size(T,2)
    T_Y=[T_Y; i];
    T_X=[T_X; T(:,j,i)'];
  end
end

%randomize training data
r=randperm(size(TR_X,1));
R_X=[]; R_Y=[];
for i=1:size(TR_X,1)
  R_X=[R_X; TR_X(r(i),:)];
  R_Y=[R_Y; TR_Y(r(i),:)];
end

%k candidates
k=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
res=knn(R_X', R_Y', T_X', k);
correct_num=zeros(columns(k),1);
for j=1:rows(res) %k candidates
  for i=1:columns(res) %test data number
    %if this classification is correct
    if (res(j,i)==T_Y(i))
      correct_num(j)+=1;
    end
  end
end
accuracy=correct_num/columns(res);
[max_value index]=max(accuracy)
