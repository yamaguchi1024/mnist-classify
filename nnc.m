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

res=knn(R_X', R_Y', T_X', [1]);
res_mat=zeros(10);
correct_num=0;
for i=1:columns(res)
  for j=1:size(T,3)
    %create res_mat
    if (res(i)==j)
      res_mat(T_Y(i), j)+=1;
    end
  end

  %if this classification is correct
  if (res(i)==T_Y(i))
    correct_num+=1;
  end
end
res_mat
accuracy=correct_num/columns(res)
