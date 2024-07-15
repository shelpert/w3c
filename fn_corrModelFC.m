function[rho_all, p_all, rho_intra, p_intra, rho_inter, p_inter] = ...
    fn_corrModelFC(FC, modelFC, cfg)

% 
% FC(:,[3:4,12,55,63:64])=[];
% FC([3:4,12,55,63:64],:)=[];
% modelFC(:,[3:4,12,55,63:64])=[];
% modelFC([3:4,12,55,63:64],:)=[];
% cfg.num_parc=60;
% cfg.LH_parc=1:30;
% cfg.RH_parc=31:60;
% 
% LH_parc = cfg.LH_parc; 
% RH_parc = cfg.RH_parc; 
% corrType = cfg.corrType;
LH_parc = cfg.LH_parc; 
RH_parc = cfg.RH_parc; 
corrType = cfg.corrType;

% Extract and vectorize FC elements
[FC_vec,FC_intra_vec,FC_inter_vec] = fn_interIntraConnVec(FC, LH_parc, RH_parc);

% Extract and vectorize model FC elements
[modelFC_vec,modelFC_intra_vec,modelFC_inter_vec] = fn_interIntraConnVec(modelFC, LH_parc, RH_parc);

% Correlate between actual and model FC
[rho_all, p_all] = ...
    corr(modelFC_vec,FC_vec,'type',corrType,'rows','pairwise');

[rho_intra, p_intra] = ...
    corr(modelFC_intra_vec,FC_intra_vec,'type',corrType,'rows','pairwise');

[rho_inter, p_inter] = ...
    corr(modelFC_inter_vec,FC_inter_vec,'type',corrType,'rows','pairwise');


end