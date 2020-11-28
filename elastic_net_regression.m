function results_elastic=elastic_net_regression(x,y)
% This function evaluates the results of kfold cross validation using the elastic net regression model 

% % Inputs: 
% % x= selected features dim: Nsubjects x features
% % y= scores dim: Nsubjects

% % Outputs
% % results_elastic = structure that containes MAE, RMSE, R2, corr, pvalue

% Contact: aya.kabbara7@gmail.com
% ---------------------------------------------------


x=x'
nsubs=size(x,2);
randinds=randperm(nsubs);
ksample=floor(nsubs/kfolds);
y_predict = zeros(nsubs, 1);
% Run  over all folds
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
    [B,FitInfo] = lasso(x_train',y_train,'Alpha',0.75,'CV',10);
    idxLambda1SE = FitInfo.Index1SE;
    coef = B(:,idxLambda1SE);
    coef0 = FitInfo.Intercept(idxLambda1SE);
        % est 

    y_predict(testinds) = x_test'*coef + coef0;

end
%% Assess performance
result_elastic=assesment(y_predict,y)

