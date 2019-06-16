CREATE
  INDEX FK_CMP_PDV ON Pablo.COMPRA
  (
    cmp_pdv_id
  );
CREATE
  INDEX FK_PRO_FOR ON Pablo.PRODUTO
  (
    pro_for_id
  );
CREATE
  INDEX FK_PRO_CAT ON Pablo.PRODUTO
  (
    pro_cat_id
  );
CREATE
  INDEX FK_OPE_FNC ON Pablo.OPERA_PDV
  (
    ope_fnc_id
  );
CREATE
  INDEX FK_OPE_PDV ON Pablo.OPERA_PDV
  (
    ope_pdv_id
  );
CREATE
  INDEX FK_ITC_PRO ON Pablo.ITENS_COMPRA
  (
    itc_pro_id
  );
CREATE
  INDEX FK_ITC_CMP ON Pablo.ITENS_COMPRA
  (
    itc_cmp_id
  );
CREATE
  INDEX FK_ITP_PRO ON Pablo.ITENS_PROMOCAO
  (
    itp_pro_id
  );
CREATE
  INDEX FK_ITP_PRM ON Pablo.ITENS_PROMOCAO
  (
    itp_prm_id
  );
CREATE
  INDEX FK_END_FOR ON Pablo.ENDERECO_FORNECEDOR
  (
    end_for_id
  );