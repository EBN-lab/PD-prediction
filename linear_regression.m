function results_linear=linear_regression(x,y)
% This function evaluates the results of kfold cross validation using the linear regression model 

% % Inputs: 
% % x= selected features dim: Nsubjects x features
% % y= scores dim: Nsubjects

% % Outputs
% % results_linear = structure that containes MAE, RMSE, R2, corr, pvalue

% Contact: aya.kabbara7@gmail.com
% ---------------------------------------------------

 
x=x';
nsubs=size(x,2);
randinds=randperm(nsubs);
ksample=floor(nsubs/kfolds);
y_predict = zeros(nsubs, 1);
% Run CPM over all folds
fprintf('\n# Running over %1.0f Folds.\nPerforming fold no. ',kfolds);
for leftout = 1:kfolds
    fprintf('%1.0f ',leftout);
    
    if kfolds == nsubs % doing leave-one-out
        testinds=randinds(leftout);
        traininds=setdiff(randinds,testinds);
    else
        si=1+((leftout-1)*ksample);
        fi=si+ksample-1;
        
        testinds=randinds(si:fi);
        traininds=setdiff(randinds,testinds);
    end
    
    % Assign x and y data to train and test groups 
    x_train = x(:,traininds);
    y_train = y(traininds);
    x_test = x(:,testinds);
    
    % Train 
      mdl=fitlm(x_train',y_train);
    % Test 
      y_predict(testinds)=predict(mdl,x_test'); 
end
%% Assess performance
results_linear=assesment(y_predict,y);