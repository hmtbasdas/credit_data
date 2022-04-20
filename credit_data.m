clc;
clear;

creditData = readtable("credit_data.csv");

pt = cvpartition(creditData.default,"HoldOut",0.33); 

hdTrain = creditData(training(pt),:); 
hdTest = creditData(test(pt),:);

model = fitctree(hdTrain,"default");

view(model,'mode','graph');
view(model);

hata = loss(model,hdTest);
disp("Test Hatası: " + hata)