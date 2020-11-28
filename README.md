# PD-prediction

This repository collects several homemade MATLAB codes used to test the feasibility of brain network-based derived features in predicting the cognitive score of parkinson's disease patients. 
To do that, several steps are needed:

1- Extract the features from the brain networks. Here, we proposed to select features by combining  two approaches: i) edge-wise features derived as proposed by (Ren et al., 2020; Shen et al., 2017) and ii) node-wise features which we propose to employ using graph theoretical measures. While edge-wise modeling identifies the predictive brain connections (i.e edges), node-wise modeling will identify the predictive brain regions (i.e nodes) using several graph measures. 

2- Select the most important features that can be used for prediction. 

3- Test the performance of regression models. 

To use these codes, one should first prepare the edge-wise features (the strength of connections in a network), and the node-wise features (graph measures such as degree, clustering....etc). 
feature_selection_AK will select the important node and edge wise features. 
The performance of regression models is quantified using several assesment measures such as the explained variance (r2), pearson's correlation, pvalue, and MAE, RMSE. 
