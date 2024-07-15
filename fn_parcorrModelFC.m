function[rho_all, p_all, rho_intra, p_intra, rho_inter, p_inter] = ...
    fn_parcorrModelFC(FC, modelFC, SC, cfg)

% SC(:,[3:4,12,63:64])=[];
% SC([3:4,12,63:64],:)=[];
% FC(:,[3:4,12,63:64])=[];
% FC([3:4,12,63:64],:)=[];
% modelFC(:,[3:4,12,63:64])=[];
% modelFC([3:4,12,63:64],:)=[];
% cfg.num_parc=61;
% cfg.LH_parc=1:30;
% cfg.RH_parc=31:61;

LH_parc = cfg.LH_parc; 
RH_parc = cfg.RH_parc; 
corrType = cfg.corrType;

% Extract and vectorize SC elements
[SC_vec,SC_intra_vec,SC_inter_vec] = fn_interIntraConnVec(SC, LH_parc, RH_parc);

% Extract and vectorize FC elements
[FC_vec,FC_intra_vec,FC_inter_vec] = fn_interIntraConnVec(FC, LH_parc, RH_parc);

% Extract and vectorize model FC elements
[modelFC_vec,modelFC_intra_vec,modelFC_inter_vec] = fn_interIntraConnVec(modelFC, LH_parc, RH_parc);

% Correlate between actual and model FC, controlling for SC
[rho_all, p_all] = ...
    partialcorr(modelFC_vec,FC_vec,SC_vec,'type',corrType,'rows','pairwise');

[rho_intra, p_intra] = ...
    partialcorr(modelFC_intra_vec,FC_intra_vec,SC_intra_vec,'type',corrType,'rows','pairwise');

[rho_inter, p_inter] = ...
    partialcorr(modelFC_inter_vec,FC_inter_vec,SC_inter_vec,'type',corrType,'rows','pairwise');

end