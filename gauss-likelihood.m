# Load Data
load digit.mat

# Variance covariance matrix
S=cov(X(:,:,1)');
for i=2:10
  S+=cov(X(:,:,i)');
end
S/=10;
invS=inv(S+0.000001*eye(256));

# Mean
mu=cell(10,1);
for i=1:10
  mu{i}=mean(X(:,:,i),2); 
end

# Test Data
t=cell(10,1);
for i=1:10
  t{i}=T(:,:,i);
end

p=cell(10,10);
classify_res=zeros(10,10);
# Test pattern
for i=1:10
  # Calculate the posterior probability
  for j=1:10
    p{i,j} = mu{j}'*invS*t{i} - mu{j}'*invS*mu{j}/2;
  end

  # 200 test data
  for k=1:200
    # A category with max p (posterior probability) is the estimated category
    max_p = 0;
    max_i = 0;
    for j=1:10
      if (max_p < p{i, j}(k))
        max_p = p{i, j}(k);
        max_i = j;
      end
    end
    classify_res(i, max_i)+=1;
  end
end
classify_res
