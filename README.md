# PD-prediction

This repository collects several homemade MATLAB codes used to test the feasibility of brain network-based derived features in predicting the cognitive scores of parkinson's disease patients. 
To do that, several steps are needed:

1- Extract the features from the brain networks. Here, we proposed to select features by combining  two approaches: i) edge-wise features derived as proposed by (Ren et al., 2020; Shen et al., 2017) and ii) node-wise features which we propose to employ using graph theoretical measures. While edge-wise modeling identifies the predictive brain connections (i.e edges), node-wise modeling will identify the predictive brain regions (i.e nodes) using several graph measures. 

2- Select the most important features that can be used for prediction. This will be done using the function "feature_selection_AK"

3- Test the performance of regression models. The performance of regression models is quantified using several assesment measures such as the explained variance (r2), pearson's correlation, pvalue, and MAE, RMSE. 
