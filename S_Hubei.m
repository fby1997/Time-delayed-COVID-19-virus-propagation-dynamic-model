function result=S_Hubei(param,num)

beta1=param(1);
beta=param(2);
r=param(3);
a=param(4);
y=param(5);

I_true=num(:,2); % 现有确诊
S_true=num(:,3); % 现有疑似
D_true=num(:,6); % 累计死亡
R_true=num(:,8); % 累计治愈
E_true=beta1*num(:,9); % 累计医学观察病例
N_true=num(:,12); % 累计追踪密切接触者
N=N_true;

alpha=[0.010577,...
0.075796,...
0.158952,...
0.190474,...
0.171563,...
0.132454,...
0.093285,...
0.062691,...
0.040714,...
0.025884,...
0.016501,...
0.010342,...
0.006619,...
0.004148]; %带截断的LogNormal 得到的参数

T = 131;
S_guess=zeros(117,1);
E_guess=zeros(117,1);
I_guess=zeros(117,1);
R_guess=zeros(117,1);
D_guess=zeros(117,1);

for initial =1:14
        S(initial)=S_true(initial);
        E(initial)=E_true(initial);
        I(initial)=I_true(initial);
        R(initial)=R_true(initial);
        D(initial)=D_true(initial);
end

for idx = 1:T-14

    tmp_value1=0;
    for i =1:14
        tmp_value1=tmp_value1+alpha(i)*E(14+idx-i);
    end
    S(14+idx) = S(13+idx) - r*S(13+idx)*I(13+idx)/(N(13+idx)-N(12+idx));
    E(14+idx) = E(13+idx) + r*S(13+idx)*I(13+idx)/(N(13+idx)-N(12+idx))-a*tmp_value1;
    I(14+idx) = I(13+idx) + a*tmp_value1 - y*I(13+idx)-beta*I(13+idx);
    R(14+idx) = R(13+idx) + y*I(13+idx);
    D(14+idx) = D(13+idx) + beta*I(13+idx);
    
    S_guess(idx,1)=S(14+idx);
    E_guess(idx,1)=E(14+idx);
    I_guess(idx,1)=I(14+idx);
    R_guess(idx,1)=R(14+idx);
    D_guess(idx,1)=D(14+idx);  
    
    S(14+idx)=S_true(14+idx);
    E(14+idx)=E_true(14+idx);
    I(14+idx)=I_true(14+idx);
    R(14+idx)=R_true(14+idx);
    D(14+idx)=D_true(14+idx);
end
result=I_guess;