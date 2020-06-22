# Time-delayed-COVID-19-virus-propagation-dynamic-model

The above matlab file is a time-delayed virus propagation dynamic model, and the prediction result is very similar to the real situation. In addition, you can use the Chinese epidemic situation to infer some unpublished epidemic data in the United States, which is very helpful for the model.

The abstract of my thesis is:

The new coronavirus, named SARS-CoV-2 by the International Committee on Taxonomy of Viruses and named COVID-19 by the World Health Organization, has broken out globally and has had a serious impact on people's lives and the economies of various countries. As of May 1, 2020, more than 3.3 million people worldwide have been diagnosed with new coronary pneumonia, with a total of more than 230,000 deaths. At present, the epidemic in China has been controlled, while the epidemic in the United States is still worrying. To explore the virus transmission situation, this thesis establishes a new coronavirus transmission model based on the traditional SEIR infectious disease transmission model, it also considers the virus incubation period and policy control factors. What's more, this thesis uses the K-Means method to consider the areas of different risk levels in China and the US, it also discusses the reasons for the differences in the development of the epidemic between China and the US.
		
According to the model, the epidemic in China is in the final stage. The number of new patients and the number of rehabilitation are stable. The predicted value of the model has a high correlation with the reported value, and the deviation is very small. Moreover, under the current policy intensity, the probability of imported cases not being detected in the early stages of transmission is extremely low; while the epidemic in the US is still in the development stage. Based on the assumption that the virus lethality is related to medical conditions, this thesis considers the regional economic conditions to dynamically adjust the recovery and death probabilities in the model. The results show that the adjusted model has a better fitting relationship with US data. Besides, this thesis also uses K-Means method divides 34 province-level administrative regions in China and 50 states in the US into three categories and discusses the differences in the development of epidemic situation between China and the US by considering regions with different risk levels. The model shows that there are still a large number of undetected infections in the US, and states such as New York should increase prevention and control efforts to curb the rate of spread before the epidemic deteriorates. The model proposed in this thesis well fits the historical data and has a low-bias prediction effect on the data of China and the US. It can also adaptively adjust the predicted value after data correction. The parameters of the mod are interpretable, and the prediction accuracy is also improved by giving the upper and lower prediction limits.

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

The parameters can be obtained by using "lsqcurvefit". Here I list the parameters used in my thesis.

China:
$(\beta_1,\beta,r,a,y)=(0.0509,0.001,0.0008,0.0015,0.0435)$

America:
$(\beta_1,\beta,r,a,y)=(0.0001,0.001,0.0005,0.0001,0.0187)$

Hubei:
$(\beta_1,\beta,r,a,y)=(0.8531,0.0684,0.001,0.1289,0.1184)$

NY:
$(\beta_1,\beta,r,a,y)=(0.0001,0.001,0.01,0.0361,0.17)$

If you have any questions, please don't hesitate to contact me, the final thesis is written in Chinese and if you get interested in it, I can send it to your e-mail.
