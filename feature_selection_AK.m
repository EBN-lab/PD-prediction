
function [N_SI, E_SI]=feature_selection_AK(pthresh,X1,X2,Y)

% % About this function: 
% This function aims at selecting the predictive features (node and edge
% wise) for the prediction of the scores (denotes Y). The selection is
% performed after choosing the parameters that significantly correlate with
% the scores. These features will then contribute to the calculation of the
% summed indices (N_SI and E_SI).

% Inputs:
%  Y=score of all subjects (dim= 1 x N)
%  X1= graph measures for all subjects (node-wise features), dim= N x Features
%  X2= edges weights for all subjects (edge-wise features) , dim= N x edges (without redundancy)
% pthresh= threshold of the pvalue

% Outputs:
% N_SI: the summed index obtained using the node-wise features
% E_SI: the summed index obtained using the edge-wise features

% Contact: aya.kabbara7@gmail.com

% % % % --------------------------------------------------------------

% node-wise feature selection

[r,p]=corr(Y,X1);
pmask=(+(r>0))-(+(r<0)); 
pmask=pmask.*(+(p<pthresh));
for i=1:size(X1,1)
    N_SI(i)=nanmean(X1(i,pmask>0))-nanmean(X1(i,pmask<0));
end
    
% edge-wise feature selection

[r,p]=corr(Y,X2);
pmask=(+(r>0))-(+(r<0)); 
pmask=pmask.*(+(p<pthresh));
for i=1:size(X2,1)
    E_SI(i)=nanmean(X2(i,pmask>0))-nanmean(X2(i,pmask<0));
end
