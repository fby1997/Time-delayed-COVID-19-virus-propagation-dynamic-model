# Time-delayed-COVID-19-virus-propagation-dynamic-model

The above matlab file is a time-delayed virus propagation dynamic model, and the prediction result is very similar to the real situation. In addition, you can use the Chinese epidemic situation to infer some unpublished epidemic data in the United States, which is very helpful for the model.

The model is as follows:
![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/model.png)

The notations are as follow:
![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/notation.png)

And the comparison between the predicted value and the true value is as follows:

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/A_D.pdf)

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/A_I.pdf)

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/A_R.pdf)

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/C_D.pdf)

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/C_I.pdf)

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/C_R.pdf)

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/Hubei_I.pdf)

![image](https://github.com/fby1997/Time-delayed-COVID-19-virus-propagation-dynamic-model/blob/master/NY_I.pdf)

The (A_D,A_I,A_R) represents the nummber of (death, positive_now, recover) patients in America.

The (C_D,C_I,C_R) represents the nummber of (death, positive_now, recover) patients in China.

Hubei_I and NY_I represent the number of positive_now patients in Hubei and New York. 


# How to use the code

The code is easy to understand, all the functions contain two parameters, the first one is parameters in our dynamic model, the second one is the data. 

For example, if you prepare to predict what will happen in NY tomorrow, you can use the followiing code:

```
[xdata] = xlsread('C:\Users\Boyue Fang\Desktop\0603_N.xlsx',1,'A:G');
params=(0.0001,0.001,0.01,0.0361,0.17);
predict_value= S_NY(params,xdata);
```

Then use
```
xlswrite('C:\Users\Boyue Fang\Desktop\tmp_0604_NY.xlsx',predict_value)
```
to save the result.

The parameters can be obtained by using "lsqcurvefit". Here I will list the parameters I got in my thesis.

China:
$(\beta_1,\beta,r,a,y)=(0.0509,0.001,0.0008,0.0015,0.0435)$

America:
$(\beta_1,\beta,r,a,y)=(0.0001,0.001,0.0005,0.0001,0.0187)$

Hubei:
$(\beta_1,\beta,r,a,y)=(0.8531,0.0684,0.001,0.1289,0.1184)$

NY:
$(\beta_1,\beta,r,a,y)=(0.0001,0.001,0.01,0.0361,0.17)$

If you have any questions, please don't hesitate to contact me, the final thesis is written in Chinese and if you get interested in it, I can send it to your e-mail.
