function [resultsvr_gaussian,resultsvr_linear,resultsvr_poly]=SVR_regression(x,y)
% This function evaluates the results of kfold cross validation using the elastic net regression model 

% % Inputs: 
% % x= selected features dim: Nsubjects x features
% % y= scores dim: Nsubjects

% % Outputs
% % results_elastic = structure that containes MAE, RMSE, R2, corr, pvalue

% Contact: aya.kabbara7@gmail.com
% ---------------------------------------------------

%% SVR with Gaussian Kernel
% option CrossVal built in fitrsvm model 
CVMsvr = fitrsvm(x',y,'CrossVal','on','KFold',kfolds,'KernelFunction','gaussian',...
                'KernelScale','auto', 'Standardize',true);                     
Ypredictsvr = kfoldPredict(CVMsvr);
resultsvr_gaussian=assesment(Ypredictsvr,y);

PlotReg(y,Ypredictsvr,'SVR');
%%  SVR with linear Kernel
CVMsvr = fitrsvm(x',y,'CrossVal','on','KFold',kfolds,'KernelFunction','linear',...
                'KernelScale','auto', 'Standardize',true);                     
Ypredictsvr = kfoldPredict(CVMsvr);
resultsvr_linear=assesment(Ypredictsvr,y)

%% SVR with poly Kernel
CVMsvr = fitrsvm(x',y,'CrossVal','on','KFold',kfolds,'KernelFunction','polynomial',...
                'KernelScale','auto', 'Standardize',true);                     
Ypredictsvr = kfoldPredict(CVMsvr);
resultsvr_poly=assesment(Ypredictsvr,y)

