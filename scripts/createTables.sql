CREATE TABLE Pablo.FORNECEDOR
  (
    for_id                     NUMBER(6,0) NOT NULL,
    for_responsavel_nome       VARCHAR2(50) NOT NULL,
    for_responsavel_nomedomeio VARCHAR2(80) NULL,
    for_responsavel_sobrenome  VARCHAR2(50) NOT NULL,
    for_cnpj                   CHAR(18) NOT NULL,
    for_razao_social           VARCHAR2(150) NOT NULL,
    for_telefone               VARCHAR2(11) NOT NULL,
    for_email                  VARCHAR2(100) NOT NULL,
    for_qtd_update             NUMBER(3,0) DEFAULT 0 NOT NULL,
    for_data_controle          DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.PROMOCAO
  (
    prm_id            NUMBER(6,0) NOT NULL,
    prm_data_inicio   DATE NOT NULL,
    prm_data_fim      DATE NOT NULL,
    prm_nome          VARCHAR2(120) NOT NULL,
    prm_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    prm_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.COMPRA
  (
    cmp_id            NUMBER(6,0) NOT NULL,
    cmp_data          DATETIME NOT NULL,
    cmp_valor_total   NUMBER(6,2) NOT NULL,
    cmp_pdv_id        NUMBER(6,0) NOT NULL,
    cmp_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    cmp_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.PDV
  (
    pdv_id            NUMBER(6,0) NOT NULL,
    pdv_numero        NUMBER(2,0) NOT NULL,
    pdv_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    pdv_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.PRODUTO
  (
    pro_id              NUMBER(6,0) NOT NULL,
    pro_descricao       VARCHAR2(150) NOT NULL,
    pro_preco           NUMBER(8,2) NOT NULL,
    pro_quantidade      NUMBER(6,0) NOT NULL,
    pro_data_vencimento DATE NOT NULL,
    pro_for_id          NUMBER(6,0) NOT NULL,
    pro_cat_id          NUMBER(6,0) NOT NULL,
    pro_qtd_update      NUMBER(3,0) DEFAULT 0 NOT NULL,
    pro_data_controle   DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.CATEGORIA
  (
    cat_id            NUMBER(6,0) NOT NULL,
    cat_descricao     VARCHAR2(30) NOT NULL,
    cat_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    cat_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.FUNCIONARIO
  (
    fnc_id              NUMBER(6,0) NOT NULL,
    fnc_rg              VARCHAR2(15) NOT NULL,
    fnc_cpf             VARCHAR2(14) NOT NULL,
    fnc_nome            VARCHAR2(50) NOT NULL,
    fnc_nomedomeio      VARCHAR2(80) NULL,
    fnc_sobrenome       VARCHAR2(50) NOT NULL,
    fnc_data_nascimento DATE NOT NULL,
    fnc_cep             VARCHAR2(9) NOT NULL,
    fnc_bairro          VARCHAR2(50) NOT NULL,
    fnc_estado          CHAR(2) NOT NULL,
    fnc_logradouro      VARCHAR2(100) NOT NULL,
    fnc_cidade          VARCHAR2(80) NOT NULL,
    fnc_telefone        VARCHAR2(11) NOT NULL,
    fnc_qtd_update      NUMBER(3,0) DEFAULT 0 NOT NULL,
    fnc_data_controle   DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.OPERA_PDV
  (
    ope_data_entrada  DATE NOT NULL,
    ope_data_saida    DATE NOT NULL,
    ope_fnc_id        NUMBER(6,0) NOT NULL,
    ope_pdv_id        NUMBER(6,0) NOT NULL,
    ope_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    ope_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.ITENS_COMPRA
  (
    itc_quantidade    NUMBER(6,0) NOT NULL,
    itc_pro_id        NUMBER(6,0) NOT NULL,
    itc_cmp_id        NUMBER(6,0) NOT NULL,
    itc_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    itc_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.ITENS_PROMOCAO
  (
    itp_qtd_disponivel NUMBER(6,0) NOT NULL,
    itp_desconto       NUMBER(3,2) NOT NULL,
    itp_pro_id         NUMBER(6,0) NOT NULL,
    itp_prm_id         NUMBER(6,0) NOT NULL,
    itp_qtd_update     NUMBER(3,0) DEFAULT 0 NOT NULL,
    itp_data_controle  DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.ENDERECO_FORNECEDOR
  (
    end_id            NUMBER(6,0) NOT NULL,
    end_for_id        NUMBER(6,0) NOT NULL,
    end_logradouro    VARCHAR2(100) NOT NULL,
    end_cep           VARCHAR2(9) NOT NULL,
    end_bairro        VARCHAR2(50) NOT NULL,
    end_cidade        VARCHAR2(80) NOT NULL,
    end_estado        CHAR(2) NOT NULL,
    end_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    end_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.TIPO_PAGAMENTO
  (
    tip_id            NUMBER(6,0) NOT NULL,
    tip_descricao     VARCHAR2(100) NOT NULL,
    tip_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    tip_data_controle DATE DEFAULT sysdate NOT NULL
  );
CREATE TABLE Pablo.PAGAMENTO
  (
    pag_cmp_id        NUMBER(6,0) NOT NULL,
    pag_tip_id        NUMBER(6,0) NOT NULL,
    pag_valor         NUMBER(8,2) NOT NULL,
    pag_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
    pag_data_controle DATE DEFAULT sysdate NOT NULL
  ) ;
-- CRIANDO TABELAS DE HISTÓRICO
CREATE TABLE Pablo.H_COMPRA
  (
    "id"          NUMBER(6,0) NOT NULL,
    "data"        NUMBER(6,0) NOT NULL,
    "valor_total" NUMBER(8,2) NOT NULL,
    "pdv_id"      NUMBER(3,0) DEFAULT 0 NOT NULL,
    "dt_hist"     DATE NOT NULL
  ) ;
CREATE TABLE Pablo.H_OPERA_PDV
  (
    "id"           NUMBER(6,0) NOT NULL,
    "data_entrada" DATE NOT NULL,
    "data_saida"   DATE NOT NULL,
    "fnc_id"       NUMBER(6,0) NOT NULL,
    "pdv_id"       NUMBER(6,0) NOT NULL,
    "dt_hist"      DATE NOT NULL
  ) ;
-- PRIMARY KEYS
ALTER TABLE Pablo.FORNECEDOR ADD CONSTRAINT PK_FOR PRIMARY KEY
(
  for_id
)
;
ALTER TABLE Pablo.PROMOCAO ADD CONSTRAINT PK_PRM PRIMARY KEY
(
  prm_id
)
;
ALTER TABLE Pablo.COMPRA ADD CONSTRAINT PK_CMP PRIMARY KEY
(
  cmp_id
)
;
ALTER TABLE Pablo.PDV ADD CONSTRAINT PK_PDV PRIMARY KEY
(
  pdv_id
)
;
ALTER TABLE Pablo.PRODUTO ADD CONSTRAINT PK_PRO PRIMARY KEY
(
  pro_id
)
;
ALTER TABLE Pablo.CATEGORIA ADD CONSTRAINT PK_CAT PRIMARY KEY
(
  cat_id
)
;
ALTER TABLE Pablo.FUNCIONARIO ADD CONSTRAINT PK_FNC PRIMARY KEY
(
  fnc_id
)
;
ALTER TABLE Pablo.OPERA_PDV ADD CONSTRAINT PK_OPE PRIMARY KEY
(
  ope_fnc_id, ope_pdv_id
)
;
ALTER TABLE Pablo.ITENS_COMPRA ADD CONSTRAINT PK_ITC PRIMARY KEY
(
  itc_pro_id, itc_cmp_id
)
;
ALTER TABLE Pablo.ITENS_PROMOCAO ADD CONSTRAINT PK_ITP PRIMARY KEY
(
  itp_pro_id, itp_prm_id
)
;
ALTER TABLE Pablo.ENDERECO_FORNECEDOR ADD CONSTRAINT PK_END PRIMARY KEY
(
  end_id
)
;
ALTER TABLE Pablo.TIPO_PAGAMENTO ADD CONSTRAINT PK_TIP PRIMARY KEY
(
  tip_id
)
;
ALTER TABLE Pablo.PAGAMENTO ADD CONSTRAINT PK_PAG PRIMARY KEY
(
  pag_cmp_id, pag_tip_id
)
;
-- FOREIGN KEYS
ALTER TABLE Pablo.COMPRA ADD CONSTRAINT FK_CMP_PDV FOREIGN KEY
(
  cmp_pdv_id
)
REFERENCES Pablo.PDV
(
  pdv_id
)
;
ALTER TABLE Pablo.PRODUTO ADD CONSTRAINT FK_PRO_FOR FOREIGN KEY
(
  pro_for_id
)
REFERENCES Pablo.FORNECEDOR
(
  for_id
)
;
ALTER TABLE Pablo.PRODUTO ADD CONSTRAINT FK_PRO_CAT FOREIGN KEY
(
  pro_cat_id
)
REFERENCES Pablo.CATEGORIA
(
  cat_id
)
;
ALTER TABLE Pablo.OPERA_PDV ADD CONSTRAINT FK_OPE_FNC FOREIGN KEY
(
  ope_fnc_id
)
REFERENCES Pablo.FUNCIONARIO
(
  fnc_id
)
;
ALTER TABLE Pablo.OPERA_PDV ADD CONSTRAINT FK_OPE_PDV FOREIGN KEY
(
  ope_pdv_id
)
REFERENCES Pablo.PDV
(
  pdv_id
)
;
ALTER TABLE Pablo.ITENS_COMPRA ADD CONSTRAINT FK_ITC_PRO FOREIGN KEY
(
  itc_pro_id
)
REFERENCES Pablo.PRODUTO
(
  pro_id
)
;
ALTER TABLE Pablo.ITENS_COMPRA ADD CONSTRAINT FK_ITC_CMP FOREIGN KEY
(
  itc_cmp_id
)
REFERENCES Pablo.COMPRA
(
  cmp_id
)
;
ALTER TABLE Pablo.ITENS_PROMOCAO ADD CONSTRAINT FK_ITP_PRO FOREIGN KEY
(
  itp_pro_id
)
REFERENCES Pablo.PRODUTO
(
  pro_id
)
;
ALTER TABLE Pablo.ITENS_PROMOCAO ADD CONSTRAINT FK_ITP_PRM FOREIGN KEY
(
  itp_prm_id
)
REFERENCES Pablo.PROMOCAO
(
  prm_id
)
;
ALTER TABLE Pablo.ENDERECO_FORNECEDOR ADD CONSTRAINT FK_END_FOR FOREIGN KEY
(
  end_for_id
)
REFERENCES Pablo.FORNECEDOR
(
  for_id
)
;
ALTER TABLE Pablo.PAGAMENTO ADD CONSTRAINT FK_PAG_CMP FOREIGN KEY
(
  pag_cmp_id
)
REFERENCES Pablo.COMPRA
(
  cmp_id
)
;
ALTER TABLE Pablo.PAGAMENTO ADD CONSTRAINT FK_PAG_TIP FOREIGN KEY
(
  pag_tip_id
)
REFERENCES Pablo.TIPO_PAGAMENTO
(
  tip_id
)
;
CREATE INDEX FK_CMP_PDV ON Pablo.COMPRA
  ( cmp_pdv_id
  );
CREATE INDEX FK_PRO_FOR ON Pablo.PRODUTO
  ( pro_for_id
  );
CREATE INDEX FK_PRO_CAT ON Pablo.PRODUTO
  ( pro_cat_id
  );
CREATE INDEX FK_OPE_FNC ON Pablo.OPERA_PDV
  ( ope_fnc_id
  );
CREATE INDEX FK_OPE_PDV ON Pablo.OPERA_PDV
  ( ope_pdv_id
  );
CREATE INDEX FK_ITC_PRO ON Pablo.ITENS_COMPRA
  ( itc_pro_id
  );
CREATE INDEX FK_ITC_CMP ON Pablo.ITENS_COMPRA
  ( itc_cmp_id
  );
CREATE INDEX FK_ITP_PRO ON Pablo.ITENS_PROMOCAO
  ( itp_pro_id
  );
CREATE INDEX FK_ITP_PRM ON Pablo.ITENS_PROMOCAO
  ( itp_prm_id
  );
CREATE INDEX FK_END_FOR ON Pablo.ENDERECO_FORNECEDOR
  ( end_for_id
  );