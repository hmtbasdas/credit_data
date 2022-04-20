clc;
clear;

creditData = readtable("credit_data.csv"); %kullanilan veri tabanı

pt = cvpartition(creditData.default,"HoldOut",0.33); %0.67 lik kismi ögrenme olacak

dataTrain = creditData(training(pt),:); 
dataTest = creditData(test(pt),:);

model = fitctree(dataTrain,"default");

view(model,'mode','graph');
view(model);

err = loss(model,dataTest);
disp("Data Test Hatası Oranı: " + err);

exm = [1 661325.9251 59.0127 4106.532131]; %ornek amacli test verisi
result = predict(model,exm);