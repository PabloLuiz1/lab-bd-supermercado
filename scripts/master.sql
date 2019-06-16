CREATE USER Pablo IDENTIFIED BY 123;
  GRANT CONNECT, RESOURCE, DBA TO Pablo;
  CREATE
    TABLE Pablo.FORNECEDOR
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
  CREATE
    TABLE Pablo.PROMOCAO
    (
      prm_id            NUMBER(6,0) NOT NULL,
      prm_data_inicio   DATE NOT NULL,
      prm_data_fim      DATE NOT NULL,
      prm_nome          VARCHAR2(120) NOT NULL,
      prm_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      prm_data_controle DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.COMPRA
    (
      cmp_id            NUMBER(6,0) NOT NULL,
      cmp_data          DATE NOT NULL,
      cmp_valor_total   NUMBER(6,2) NOT NULL,
      cmp_pdv_id        NUMBER(6,0) NOT NULL,
      cmp_fnc_id        NUMBER(6,0) NOT NULL,
      cmp_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      cmp_data_controle DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.PDV
    (
      pdv_id            NUMBER(6,0) NOT NULL,
      pdv_numero        NUMBER(2,0) NOT NULL,
      pdv_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      pdv_data_controle DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.PRODUTO
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
  CREATE
    TABLE Pablo.CATEGORIA
    (
      cat_id            NUMBER(6,0) NOT NULL,
      cat_descricao     VARCHAR2(30) NOT NULL,
      cat_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      cat_data_controle DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.FUNCIONARIO
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
  CREATE
    TABLE Pablo.OPERA_PDV
    (
      ope_data_entrada  DATE NOT NULL,
      ope_data_saida    DATE NOT NULL,
      ope_fnc_id        NUMBER(6,0) NOT NULL,
      ope_pdv_id        NUMBER(6,0) NOT NULL,
      ope_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      ope_data_controle DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.ITENS_COMPRA
    (
      itc_quantidade    NUMBER(6,0) NOT NULL,
      itc_pro_id        NUMBER(6,0) NOT NULL,
      itc_cmp_id        NUMBER(6,0) NOT NULL,
      itc_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      itc_data_controle DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.ITENS_PROMOCAO
    (
      itp_qtd_disponivel NUMBER(6,0) NOT NULL,
      itp_desconto       NUMBER(3,2) NOT NULL,
      itp_pro_id         NUMBER(6,0) NOT NULL,
      itp_prm_id         NUMBER(6,0) NOT NULL,
      itp_qtd_update     NUMBER(3,0) DEFAULT 0 NOT NULL,
      itp_data_controle  DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.ENDERECO_FORNECEDOR
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
  CREATE
    TABLE Pablo.TIPO_PAGAMENTO
    (
      tip_id            NUMBER(6,0) NOT NULL,
      tip_descricao     VARCHAR2(100) NOT NULL,
      tip_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      tip_data_controle DATE DEFAULT sysdate NOT NULL
    );
  CREATE
    TABLE Pablo.PAGAMENTO
    (
      pag_cmp_id        NUMBER(6,0) NOT NULL,
      pag_tip_id        NUMBER(6,0) NOT NULL,
      pag_valor         NUMBER(8,2) NOT NULL,
      pag_qtd_update    NUMBER(3,0) DEFAULT 0 NOT NULL,
      pag_data_controle DATE DEFAULT sysdate NOT NULL
    ) ;
  -- CRIANDO TABELAS DE HISTÓRICO
  CREATE
    TABLE Pablo.H_COMPRA
    (
      hcm_id          NUMBER(6,0) NOT NULL,
      hcm_cmp_id      NUMBER(6,0) NOT NULL,
      hcm_cmp_data    DATE NOT NULL,
      hcm_cmp_valor_total NUMBER(8,2) NOT NULL,
      hcm_cmp_pdv_id      NUMBER(3,0) NOT NULL,
      hcm_dt_hist     DATE NOT NULL
    ) ;
  CREATE
    TABLE Pablo.H_OPERA_PDV
    (
      hop_id           NUMBER(6,0) NOT NULL,
      hop_ope_data_entrada DATE NOT NULL,
      hop_ope_data_saida   DATE NOT NULL,
      hop_ope_fnc_id       NUMBER(6,0) NOT NULL,
      hop_ope_pdv_id       NUMBER(6,0) NOT NULL,
      hop_dt_hist      DATE NOT NULL
    ) ;
	-- CRIANDO TABELA DE AUDITORIA
  CREATE
    TABLE Pablo.AUDITORIA
	(
		aud_id NUMBER(6,0),
		aud_tabela VARCHAR2(30),
		aud_evento VARCHAR2(30),
		aud_data DATE,
		aud_usu_so VARCHAR2(255),
		aud_usu_bd VARCHAR2(30),
		aud_ident_host VARCHAR2(255),
		aud_ident_terminal VARCHAR2(255)
) ;
	-- CRIANDO INDEXES DE TODAS AS TABELAS
  CREATE
    INDEX FK_CMP_PDV ON Pablo.COMPRA
    (
      cmp_pdv_id
    );
    CREATE
    INDEX FK_CMP_FNC ON Pablo.COMPRA
    (
      cmp_fnc_id
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
  CREATE
    INDEX PK_H_CMP ON Pablo.H_COMPRA
    (
      hcm_id
    );
  CREATE
    INDEX FK_H_CMP ON Pablo.H_COMPRA
    (
      hcm_cmp_id
    );
    CREATE
    INDEX FK_H_CMP_PDV ON Pablo.H_COMPRA
    (
      hcm_cmp_pdv_id
    );
  CREATE
    INDEX PK_H_OPE ON Pablo.H_OPERA_PDV
    (
      hop_id
    );
  CREATE
    INDEX FK_H_OPE_FNC ON Pablo.H_OPERA_PDV
    (
      hop_ope_fnc_id
    );  
  CREATE
    INDEX FK_H_OPE_PDV ON Pablo.H_OPERA_PDV
    (
      hop_ope_pdv_id
    );
  CREATE
    INDEX PK_AUD_ID ON Pablo.AUDITORIA
    (
      aud_id
    );
  -- DESCREVENDO AS TABELAS
  COMMENT ON TABLE Pablo.CATEGORIA
IS
  'Tabela que armazena os dados das categorias de produtos';
  COMMENT ON TABLE Pablo.COMPRA
IS
  'Tabela que armazena os dados das compras realizadas por clientes';
  COMMENT ON TABLE Pablo.ENDERECO_FORNECEDOR
IS
  'Tabela que armazena os dados referentes aos endereços dos fornecedores';
  COMMENT ON TABLE Pablo.FORNECEDOR
IS
  'Tabela que armazena os dados dos fornecedores';
  COMMENT ON TABLE Pablo.FUNCIONARIO
IS
  'Tabela que armazena os dados dos funcionários';
  COMMENT ON TABLE Pablo.ITENS_COMPRA
IS
  'Tabela associativa que armazena os dados das compras e seus respectivos itens, que são produtos'
  ;
  COMMENT ON TABLE Pablo.ITENS_PROMOCAO
IS
  'Tabela associativa que armazena os dados das promoções e seus respectivos itens, que são produtos participantes'
  ;
  COMMENT ON TABLE Pablo.OPERA_PDV
IS
  'Tabela associativa que armazena os dados dos funcionários e dos pontos de vendas que foram operados por eles'
  ;
  COMMENT ON TABLE Pablo.PDV
IS
  'Tabela que armazena os dados dos pontos de venda';
  COMMENT ON TABLE Pablo.PRODUTO
IS
  'Tabela que armazena os dados dos produtos';
  COMMENT ON TABLE Pablo.PROMOCAO
IS
  'Tabela que armazena os dados das promoções';
  COMMENT ON TABLE Pablo.TIPO_PAGAMENTO
IS
  'Tabela que armazena os tipos de pagamento';
  COMMENT ON TABLE Pablo.PAGAMENTO
IS
  'Tabela que armazena os dados de pagamento realizado';
    COMMENT ON TABLE Pablo.H_COMPRA
IS
  'Tabela que armazena os dados referente ao histórico de alterações na tabela COMPRA';
    COMMENT ON TABLE Pablo.H_OPERA_PDV
IS
  'Tabela que armazena os dados referente ao histórico de alterações na tabela OPERA_PDV';
  COMMENT ON TABLE Pablo.AUDITORIA
IS
  'Tabela que armazena os dados para auditoria na utilização do banco de dados';
  -- DESCREVENDO OS CAMPOS
  -- CATEGORIA
  COMMENT ON COLUMN Pablo.CATEGORIA.CAT_ID
IS
  'Campo que armazena o identificador único da categoria';
  COMMENT ON COLUMN Pablo.CATEGORIA.CAT_DESCRICAO
IS
  'Campo que armazena a descrição da categoria';
  -- COMPRA
  COMMENT ON COLUMN Pablo.COMPRA.CMP_ID
IS
  'Campo que armazena o identificador único da compra';
  COMMENT ON COLUMN Pablo.COMPRA.CMP_DATA
IS
  'Campo que armazena a data na qual a compra foi realizada';
  COMMENT ON COLUMN Pablo.COMPRA.CMP_VALOR_TOTAL
IS
  'Campo que armazena o valor total da compra, somando o valor de cada item dela'
  ;
  COMMENT ON COLUMN Pablo.COMPRA.CMP_PDV_ID
IS
  'Campo que armazena o identificador do ponto de venda onde a compra foi registrada'
  ;
  COMMENT ON COLUMN Pablo.COMPRA.CMP_FNC_ID
IS
  'Campo que armazena o identificador do funcionário registrou a compra'
  ;
  -- ENDERECO_FORNECEDOR
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_ID
IS
  'Campo que armazena o identificador do endereço do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_FOR_ID
IS
  'Campo que armazena o identificador do fornecedor pertencente de um endereço'
  ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_LOGRADOURO
IS
  'Campo que armazena o nome do logradouro do endereço do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_CEP
IS
  'Campo que armazena o número do CEP do endereço do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_BAIRRO
IS
  'Campo que armazena o nome do bairro do endereço do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_CIDADE
IS
  'Campo que armazena o nome da cidade do endereço do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_ESTADO
IS
  'Campo que armazena a sigla (duas letras) referente ao estado do endereço do fornecedor'
  ;
  -- FORNECEDOR
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_ID
IS
  'Campo que armazena o identificador único do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RESPONSAVEL_NOME
IS
  'Campo que armazena o primeiro nome do responsável fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RESPONSAVEL_NOMEDOMEIO
IS
  'Campo que armazena o nome do meio do responsável fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RESPONSAVEL_SOBRENOME
IS
  'Campo que armazena o sobrenome do responsável fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_CNPJ
IS
  'Campo que armazena o número de CNPJ do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RAZAO_SOCIAL
IS
  'Campo que armazena o nome da razão social do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_TELEFONE
IS
  'Campo que armazena o número de telefone do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_EMAIL
IS
  'Campo que armazena o endereço de e-mail do fornecedor' ;
  -- FUNCIONARIO
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_ID
IS
  'Campo que armazena o identificador único do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_RG
IS
  'Campo que armazena o número do RG do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_CPF
IS
  'Campo que armazena o número de CPF do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_NOME
IS
  'Campo que armazena o primeiro nome do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_NOMEDOMEIO
IS
  'Campo que armazena o nome do meio do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_SOBRENOME
IS
  'Campo que armazena o sobrenome do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_CEP
IS
  'Campo que armazena o número do CEP do endereço do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_BAIRRO
IS
  'Campo que armazena o nome do bairro do endereço do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_ESTADO
IS
  'Campo que armazena a sigla (duas letras) do estado do endereço do funcionário'
  ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_LOGRADOURO
IS
  'Campo que armazena o nome do logradouro do endereço do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_CIDADE
IS
  'Campo que armazena o o nome da cidade do endereço do funcionário' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_TELEFONE
IS
  'Campo que armazena o número de telefone do funcionário' ;
  -- ITENS_COMPRA
  COMMENT ON COLUMN Pablo.ITENS_COMPRA.ITC_QUANTIDADE
IS
  'Campo que armazena a quantidade do respectivo item da compra' ;
  COMMENT ON COLUMN Pablo.ITENS_COMPRA.ITC_PRO_ID
IS
  'Campo que armazena o identificador único do produto item da compra' ;
  COMMENT ON COLUMN Pablo.ITENS_COMPRA.ITC_CMP_ID
IS
  'Campo que armazena o identificador único da compra respectiva aos itens da compra'
  ;
  --ITENS_PROMOCAO
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_QTD_DISPONIVEL
IS
  'Campo que armazena a quantidade disponível de um certo item da promoção' ;
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_DESCONTO
IS
  'Campo que armazena a porcentagem de desconto de um certo item na promoção' ;
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_PRO_ID
IS
  'Campo que armazena o identificador único do produto em promoção' ;
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_PRM_ID
IS
  'Campo que armazena o identificador único da promoção referente ao item' ;
  --OPERA_PDV
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_DATA_ENTRADA
IS
  'Campo que armazena a data e hora de entrada do operador do ponto de venda' ;
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_DATA_SAIDA
IS
  'Campo que armazena a data e hora de saída do operador do ponto de venda' ;
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_FNC_ID
IS
  'Campo que armazena o identificador único funcionário operador do ponto de venda'
  ;
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_PDV_ID
IS
  'Campo que armazena o identificador único do ponto de venda operado pelo funcionário'
  ;
  --PDV
  COMMENT ON COLUMN Pablo.PDV.PDV_ID
IS
  'Campo que armazena o identificador único do ponto de venda' ;
  COMMENT ON COLUMN Pablo.PDV.PDV_NUMERO
IS
  'Campo que armazena o número (1-99) do ponto de venda' ;
  --PRODUTO
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_ID
IS
  'Campo que armazena o identificador único do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_DESCRICAO
IS
  'Campo que armazena a descrição do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_PRECO
IS
  'Campo que armazena o preço do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_QUANTIDADE
IS
  'Campo que armazena a quantidade em estoque do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_FOR_ID
IS
  'Campo que armazena o identificador único do fornecedor do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_CAT_ID
IS
  'Campo que armazena o identificador único da categoria do produto' ;
  --PROMOCAO
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_ID
IS
  'Campo que armazena o identificador único da promoção' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_INICIO
IS
  'Campo que armazena a data do ínicio da promoção' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_FIM
IS
  'Campo que armazena a data do fim da promoção' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_NOME
IS
  'Campo que armazena o nome da promoção' ;
  --PROMOCAO
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_ID
IS
  'Campo que armazena o identificador único da promoção' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_INICIO
IS
  'Campo que armazena a data do ínicio da promoção' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_FIM
IS
  'Campo que armazena a data do fim da promoção' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_NOME
IS
  'Campo que armazena o nome da promoção' ;
  --TIPO_PAGAMENTO
  COMMENT ON COLUMN Pablo.TIPO_PAGAMENTO.TIP_ID
IS
  'Campo que armazena o identificador único do tipo de pagamento' ;
  COMMENT ON COLUMN Pablo.TIPO_PAGAMENTO.TIP_DESCRICAO
IS
  'Campo que armazena a descrição do tipo de pagamento' ;
  --PAGAMENTO
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_CMP_ID
IS
  'Campo que armazena o identificador único da compra referente ao pagamento realizado'
  ;
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_TIP_ID
IS
  'Campo que armazena o identificador único do tipo de pagamento utilizado no pagamento'
  ;
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_VALOR
IS
  'Campo que armazena o valor do pagamento realizado' ;
  -- H_COMPRA
  COMMENT ON COLUMN Pablo.H_COMPRA.HCM_ID
IS
  'Campo que armazena o identificador único do registro de histórico inserido na tabela H_COMPRA'
  ;
  COMMENT ON COLUMN Pablo.H_COMPRA.HCM_CMP_ID
IS
  'Campo que armazena o antigo identificador único da compra que foi alterada ou excluída'
  ;
  COMMENT ON COLUMN Pablo.H_COMPRA.HCM_CMP_DATA
IS
  'Campo que armazena a antiga data da compra que foi alterada ou excluída'
  ;
  COMMENT ON COLUMN Pablo.H_COMPRA.HCM_CMP_VALOR_TOTAL
IS
  'Campo que armazena o antigo valor total da compra que foi alterada ou excluída'
  ;
  COMMENT ON COLUMN Pablo.H_COMPRA.HCM_CMP_PDV_ID
IS
  'Campo que armazena o antigo identificador único do ponto de venda utilizado na compra que foi alterada ou excluída'
  ;
  COMMENT ON COLUMN Pablo.H_COMPRA.HCM_DT_HIST
IS
  'Campo que armazena a data na qual a operação de alteração ou exclusão na tabela COMPRA foi realizada'
  ;
  -- H_OPERA_PDV
    COMMENT ON COLUMN Pablo.H_OPERA_PDV.HOP_ID
IS
  'Campo que armazena o identificador único do registro de histórico inserido na tabela H_OPERA_PDV'
  ;
      COMMENT ON COLUMN Pablo.H_OPERA_PDV.HOP_OPE_DATA_ENTRADA
IS
  'Campo que armazena a antiga data de entrada do registro que foi alterado ou excluído'
  ;
      COMMENT ON COLUMN Pablo.H_OPERA_PDV.HOP_OPE_DATA_SAIDA
IS
  'Campo que armazena a antiga data de saída do registro que foi alterado ou excluído'
  ;
      COMMENT ON COLUMN Pablo.H_OPERA_PDV.HOP_OPE_FNC_ID
IS
  'Campo que armazena o antigo identificador único do funcionário que operou o ponto de venda no registro que foi alterado ou excluído'
  ;
      COMMENT ON COLUMN Pablo.H_OPERA_PDV.HOP_OPE_PDV_ID
IS
  'Campo que armazena o antigo identificador único do ponto de venda no registro que foi alterado ou excluído'
  ;
      COMMENT ON COLUMN Pablo.H_OPERA_PDV.HOP_DT_HIST
IS
  'Campo que armazena a data na qual a operação de alteração ou exclusão na tabela OPERA_PDV foi realizada'
  ;
  -- AUDITORIA
    COMMENT ON COLUMN Pablo.AUDITORIA.AUD_ID
IS
  'Campo que armazena o identificador único do registro de auditoria'
  ;
      COMMENT ON COLUMN Pablo.AUDITORIA.AUD_TABELA
IS
  'Campo que armazena a tabela respectiva ao registro de auditoria'
  ;
      COMMENT ON COLUMN Pablo.AUDITORIA.AUD_EVENTO
IS
  'Campo que armazena o evento (operação de banco de dados) realizado no registro de auditoria'
  ;
      COMMENT ON COLUMN Pablo.AUDITORIA.AUD_DATA
IS
  'Campo que armazena a data na qual o registro de auditoria foi inserido'
  ;
      COMMENT ON COLUMN Pablo.AUDITORIA.AUD_USU_SO
IS
  'Campo que armazena o sistema operacional utilizado pelo usuário de banco de dados que efetuou o evento a ser inserido na auditoria'
  ;
      COMMENT ON COLUMN Pablo.AUDITORIA.AUD_USU_BD
IS
  'Campo que armazena o usuário do banco de dados que efeutou o evento a ser inserido na auditoria'
  ;
      COMMENT ON COLUMN Pablo.AUDITORIA.AUD_IDENT_HOST
IS
  'Campo que armazena a identidade do host respectivo do evento a ser inserido na auditoria'
  ;
       COMMENT ON COLUMN Pablo.AUDITORIA.AUD_IDENT_TERMINAL
IS
  'Campo que armazena a identidade do terminal respectivo do evento a ser inserido na auditoria'
  ;
  -- INSERINDO OS DADOS
  -- CATEGORIA
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '1',
   'Bebidas',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '2',
   'Carnes e aves',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '3',
   'Cereais',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '4',
   'Enlatados',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '5',
   'Frios',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '6',
   'Laticínios',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '7',
   'Material de limpeza',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '8',
   'Material de higiene',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '9',
   'Peixes',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '10',
   'Frutas e verduras',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '11',
   'Alimentos',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.CATEGORIA
    (
      CAT_ID,
      CAT_DESCRICAO,
      CAT_QTD_UPDATE,
      CAT_DATA_CONTROLE
    )
    VALUES
    (
   '12',
   'Padaria',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  -- PDV
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '1',
   '1',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '2',
   '2',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '3',
   '3',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '4',
   '4',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '5',
   '5',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '6',
   '6',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '7',
   '7',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '8',
   '8',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '9',
   '9',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '10',
   '10',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '11',
   '11',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '12',
   '12',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '13',
   '13',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '14',
   '14',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.PDV
    (
      PDV_ID,
      PDV_NUMERO,
      PDV_QTD_UPDATE,
      PDV_DATA_CONTROLE
    )
    VALUES
    (
   '15',
   '15',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  -- TIPO PAGAMENTO
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '1',
   'Dinheiro',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '2',
   'Cartão de crédito Mastercard',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '3',
   'Cartão de crédito Visa',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '4',
   'Cartão de crédito Elo',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '5',
   'Cartão de crédito American Express',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '6',
   'Cartão de crédito Hiper Card',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '7',
   'Cartão de crédito Sorocred',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '8',
   'Cartão de débito Mastercard',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '9',
   'Cartão de débito Visa',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '10',
   'Cartão de débito Elo',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '11',
   'Cartão de débito American Express',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '12',
   'Cartão de débito Hiper Card',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.TIPO_PAGAMENTO
    (
      TIP_ID,
      TIP_DESCRICAO,
      TIP_QTD_UPDATE,
      TIP_DATA_CONTROLE
    )
    VALUES
    (
   '13',
   'Cartão de débito Sorocred',
   '0',
      to_date('03/05/19', 'DD/MM/RR')
    );
  -- PROMOCAO
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      1,
   '01/01/2019',
   '08/01/2019',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      2,
   '08/01/2019',
   '15/01/2019',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      3,
   '15/01/2019',
   '22/01/2019',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      4,
   '22/01/2019',
   '29/01/2019',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      5,
   '29/01/2019',
   '05/02/2019',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      6,
   '05/02/2019',
   '12/02/2019',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      7,
   '12/02/2019',
   '19/02/2019',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      8,
   '19/02/2019',
   '26/02/2019',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      9,
   '26/02/2019',
   '05/03/2019',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      10,
   '05/03/2019',
   '12/03/2019',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      11,
   '12/03/2019',
   '19/03/2019',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      12,
   '19/03/2019',
   '26/03/2019',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      13,
   '26/03/2019',
   '02/04/2019',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      14,
   '02/04/2019',
   '09/04/2019',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      15,
   '09/04/2019',
   '16/04/2019',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      16,
   '16/04/2019',
   '23/04/2019',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      17,
   '23/04/2019',
   '30/04/2019',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      18,
   '30/04/2019',
   '07/05/2019',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      19,
   '07/05/2019',
   '14/05/2019',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      20,
   '14/05/2019',
   '21/05/2019',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      21,
   '21/05/2019',
   '28/05/2019',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      22,
   '28/05/2019',
   '04/06/2019',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      23,
   '04/06/2019',
   '11/06/2019',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      24,
   '11/06/2019',
   '18/06/2019',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      25,
   '18/06/2019',
   '25/06/2019',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      26,
   '25/06/2019',
   '02/07/2019',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      27,
   '02/07/2019',
   '09/07/2019',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      28,
   '09/07/2019',
   '16/07/2019',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      29,
   '16/07/2019',
   '23/07/2019',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      30,
   '23/07/2019',
   '30/07/2019',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      31,
   '30/07/2019',
   '06/08/2019',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      32,
   '06/08/2019',
   '13/08/2019',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      33,
   '13/08/2019',
   '20/08/2019',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      34,
   '20/08/2019',
   '27/08/2019',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      35,
   '27/08/2019',
   '03/09/2019',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      36,
   '03/09/2019',
   '10/09/2019',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      37,
   '10/09/2019',
   '17/09/2019',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      38,
   '17/09/2019',
   '24/09/2019',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      39,
   '24/09/2019',
   '01/10/2019',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      40,
   '01/10/2019',
   '08/10/2019',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      41,
   '08/10/2019',
   '15/10/2019',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      42,
   '15/10/2019',
   '22/10/2019',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      43,
   '22/10/2019',
   '29/10/2019',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      44,
   '29/10/2019',
   '05/11/2019',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      45,
   '05/11/2019',
   '12/11/2019',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      46,
   '12/11/2019',
   '19/11/2019',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      47,
   '19/11/2019',
   '26/11/2019',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      48,
   '26/11/2019',
   '03/12/2019',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      49,
   '03/12/2019',
   '10/12/2019',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      50,
   '10/12/2019',
   '17/12/2019',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      51,
   '17/12/2019',
   '24/12/2019',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      52,
   '24/12/2019',
   '31/12/2019',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      53,
   '31/12/2019',
   '07/01/2020',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      54,
   '07/01/2020',
   '14/01/2020',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      55,
   '14/01/2020',
   '21/01/2020',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      56,
   '21/01/2020',
   '28/01/2020',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      57,
   '28/01/2020',
   '04/02/2020',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      58,
   '04/02/2020',
   '11/02/2020',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      59,
   '11/02/2020',
   '18/02/2020',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      60,
   '18/02/2020',
   '25/02/2020',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      61,
   '25/02/2020',
   '03/03/2020',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      62,
   '03/03/2020',
   '10/03/2020',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      63,
   '10/03/2020',
   '17/03/2020',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      64,
   '17/03/2020',
   '24/03/2020',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      65,
   '24/03/2020',
   '31/03/2020',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      66,
   '31/03/2020',
   '07/04/2020',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      67,
   '07/04/2020',
   '14/04/2020',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      68,
   '14/04/2020',
   '21/04/2020',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      69,
   '21/04/2020',
   '28/04/2020',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      70,
   '28/04/2020',
   '05/05/2020',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      71,
   '05/05/2020',
   '12/05/2020',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      72,
   '12/05/2020',
   '19/05/2020',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      73,
   '19/05/2020',
   '26/05/2020',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      74,
   '26/05/2020',
   '02/06/2020',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      75,
   '02/06/2020',
   '09/06/2020',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      76,
   '09/06/2020',
   '16/06/2020',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      77,
   '16/06/2020',
   '23/06/2020',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      78,
   '23/06/2020',
   '30/06/2020',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      79,
   '30/06/2020',
   '07/07/2020',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      80,
   '07/07/2020',
   '14/07/2020',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      81,
   '14/07/2020',
   '21/07/2020',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      82,
   '21/07/2020',
   '28/07/2020',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      83,
   '28/07/2020',
   '04/08/2020',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      84,
   '04/08/2020',
   '11/08/2020',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      85,
   '11/08/2020',
   '18/08/2020',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      86,
   '18/08/2020',
   '25/08/2020',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      87,
   '25/08/2020',
   '01/09/2020',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      88,
   '01/09/2020',
   '08/09/2020',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      89,
   '08/09/2020',
   '15/09/2020',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      90,
   '15/09/2020',
   '22/09/2020',
   'Feriado'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      91,
   '22/09/2020',
   '29/09/2020',
   'Semana maluca'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      92,
   '29/09/2020',
   '06/10/2020',
   'Quarta é feira'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      93,
   '06/10/2020',
   '13/10/2020',
   'Fim de semana'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      94,
   '13/10/2020',
   '20/10/2020',
   'Churrasco'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      95,
   '20/10/2020',
   '27/10/2020',
   'Fim de ano'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      96,
   '27/10/2020',
   '03/11/2020',
   'Natal'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      97,
   '03/11/2020',
   '10/11/2020',
   'Páscoa'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      98,
   '10/11/2020',
   '17/11/2020',
   'Dia das mães'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      99,
   '17/11/2020',
   '24/11/2020',
   'Dia dos pais'
    );
  INSERT
  INTO
    PABLO.PROMOCAO
    (
      prm_id,
      prm_data_inicio,
      prm_data_fim,
      prm_nome
    )
    VALUES
    (
      100,
   '24/11/2020',
   '01/12/2020',
   'Feriado'
    );
  -- FUNCIONARIO
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      1,
   '856644179',
   '464.264.828-38',
   'CAMILA',
   'DA SILVA CESAR',
   'DE AZEVEDO',
   '09/04/1997',
   '08790-859',
   'Vila Socorro',
   'SP',
   'Avenida Albino Durães (Real Park Jd Colégio)',
   'Mogi das Cruzes',
   '1125522877'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      2,
   '591796978',
   '448.183.798-59',
   'NICOLAS',
   'HENRIQUE',
   'BORGES',
   '10/04/1997',
   '08725-740',
   'Jardim Nathalie',
   'SP',
   'Avenida Antônio Vieira do Nascimento',
   'Mogi das Cruzes',
   '1245578897'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      3,
   '398259976',
   '469.630.478-71',
   'EDUARDA',
   'GONÇALVES',
   'FRANCISCHINI',
   '11/04/1997',
   '08717-260',
   'Mogi Moderno',
   'SP',
   'Avenida Brasil - até 598/599',
   'Mogi das Cruzes',
   '1135456789'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      4,
   '879546858',
   '465.024.258-44',
   'MARIANA',
   'REGINA',
   'SILVA',
   '12/04/1997',
   '08717-435',
   'Mogi Moderno',
   'SP',
   'Avenida Brasil - de 1100/1101 ao fim',
   'Mogi das Cruzes',
   '1154487987'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      5,
   '300810977',
   '468.428.668-12',
   'MIKAELA',
   'STEFANI',
   'DOS SANTOS',
   '13/04/1997',
   '08717-345',
   'Mogi Moderno',
   'SP',
   'Avenida Brasil - de 600/601 a 1098/1099',
   'Mogi das Cruzes',
   '1928288848'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      6,
   '556406178',
   '472.089.828-99',
   'MARINA',
   'DOS SANTOS',
   'DIAS',
   '14/04/1997',
   '08730-020',
   'Vila Vitória',
   'SP',
   'Avenida Braz de Pina',
   'Mogi das Cruzes',
   '19999334395'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      7,
   '376468266',
   '353.640.148-19',
   'VANDERLEI',
   'DA SILVA PASCOAL',
   'JUNIOR',
   '15/04/1997',
   '08770-040',
   'Vila Industrial',
   'SP',
   'Avenida Cavalheiro Nami Jafet',
   'Mogi das Cruzes',
   '1335368239'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      8,
   '797808467',
   '472.539.498-03',
   'EVELIN',
   'CLOTILDE DE MOURA FELIPE',
   'DOS SANTOS',
   '16/04/1997',
   '08744-000',
   'Vila Cintra',
   'SP',
   'Avenida Conceição',
   'Mogi das Cruzes',
   '13986056146'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      9,
   '859476526',
   '451.448.708-21',
   'LUCAS',
   'BARCELLI COSTA',
   'SOUZA',
   '17/04/1997',
   '08738-255',
   'Vila Brasileira',
   'SP',
   'Avenida Doutor Álvaro de Campos Carneiro',
   'Mogi das Cruzes',
   '1129486804'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      10,
   '418933973',
   '473.241.078-26',
   'LORRANY',
   'ARAUJO',
   'DIAS',
   '18/04/1997',
   '08773-325',
   'Vila Mogilar',
   'SP',
   'Avenida Doutor Benedicto Laporte Vieira da Motta',
   'Mogi das Cruzes',
   '11982574889'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      11,
   '932010657',
   '341.020.168-80',
   'LARISSA',
   'BARBOSA',
   'MARQUES',
   '19/04/1997',
   '08744-020',
   'Vila Paulista',
   'SP',
   'Avenida Edith Inácia da Silva',
   'Mogi das Cruzes',
   '1137568718'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      12,
   '300699830',
   '447.939.168-13',
   'RODRIGO',
   'PEREIRA',
   'DA SILVA',
   '20/04/1997',
   '08770-070',
   'Vila Industrial',
   'SP',
   'Avenida Expedicionário Firmino Ladeira',
   'Mogi das Cruzes',
   '11987357660'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      13,
   '526309124',
   '337.737.108-79',
   'VINICIUS',
   'AUGUSTO MOTA',
   'GRITTI',
   '21/04/1997',
   '08730-130',
   'Centro',
   'SP',
   'Avenida Fausta Duarte de Araújo',
   'Mogi das Cruzes',
   '1126743980'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      14,
   '442263282',
   '425.722.638-23',
   'JOAO',
   'EDUARDO LEITE',
   'GOFFI',
   '22/04/1997',
   '08840-030',
   'Vila São Paulo',
   'SP',
   'Avenida Felipe Sawaya',
   'Mogi das Cruzes',
   '11992410371'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      15,
   '816954219',
   '446.045.718-05',
   'JULIE',
   'ANNE DA SILVA ANTUNES',
   'MOREIRA',
   '23/04/1997',
   '08735-000',
   'Centro',
   'SP',
   'Avenida Fernando Costa',
   'Mogi das Cruzes',
   '1439992209'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      16,
   '376528599',
   '317.053.828-43',
   'JOAO',
   'VICTOR BARROS',
   'QUEIROZ',
   '24/04/1997',
   '08744-050',
   'Jardim Modelo',
   'SP',
   'Avenida Florêncio de Paiva',
   'Mogi das Cruzes',
   '14988969770'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      17,
   '579937153',
   '454.387.258-45',
   'EDUARDO',
   'ALVES',
   'DE SOUZA',
   '25/04/1997',
   '08735-200',
   'Vila Lavínia',
   'SP',
   'Avenida Francisco Ferreira Lopes - até 1909/1910',
   'Mogi das Cruzes',
   '1129372097'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      18,
   '871584117',
   '448.811.748-19',
   'THAYNA',
   'APARECIDA NUNES',
   'DA SILVA',
   '26/04/1997',
   '08740-000',
   'Braz Cubas',
   'SP',
   'Avenida Francisco Ferreira Lopes - de 1911/1912 a 2219/2220',
   'Mogi das Cruzes',
   '11995853074'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      19,
   '213184741',
   '458.317.648-18',
   'THAIS',
   'VIEIRA',
   'RAMOS',
   '27/04/1997',
   '08840-000',
   'Botujuru',
   'SP',
   'Avenida Francisco Rodrigues Filho',
   'Mogi das Cruzes',
   '11255747382'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      20,
   '171577284',
   '444.553.038-71',
   'YAGO',
   'FERREIRA MONTEIRO',
   'MORAIS',
   '28/04/1997',
   '08773-380',
   'Vila Mogilar',
   'SP',
   'Avenida Francisco Rodrigues Filho',
   'Mogi das Cruzes',
   '11987477372'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      21,
   '394945280',
   '459.087.178-51',
   'KAREN',
   'DAIANE',
   'DOS SANTOS',
   '29/04/1997',
   '08725-130',
   'Vila Caputera',
   'SP',
   'Avenida Francisco Ruiz',
   'Mogi das Cruzes',
   '1137548172'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      22,
   '330631127',
   '446.976.348-96',
   'THIAGO',
   'ALVES',
   'FARIA',
   '30/04/1997',
   '08720-230',
   'Jardim Camila',
   'SP',
   'Avenida Gilberto Rodrigues de Souza',
   'Mogi das Cruzes',
   '1125606936'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      23,
   '590351689',
   '452.932.238-60',
   'JOAO',
   'MARCOS HODZIESZ',
   'PINTO',
   '01/05/1997',
   '08710-580',
   'Centro',
   'SP',
   'Avenida Governador Adhemar de Barros',
   'Mogi das Cruzes',
   '1154488789'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      24,
   '503775130',
   '466.194.418-66',
   'PEDRO',
   'AUGUSTO VEIGA',
   'SANTOS',
   '02/05/1997',
   '08735-075',
   'Vila Rubens',
   'SP',
   'Avenida Governador Adhemar de Barros',
   'Mogi das Cruzes',
   '1125522433'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      25,
   '582179764',
   '408.918.258-19',
   'GABRIELA',
   'REGINA CORREA',
   'PEREIRA',
   '03/05/1997',
   '08752-590',
   'Real Park Tietê Jundiapeba',
   'SP',
   'Avenida Gumercindo Gonçalves',
   'Mogi das Cruzes',
   '1124422332'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      26,
   '979876409',
   '372.802.698-00',
   'MARIA',
   'IANK ROSILAINE',
   'DOS SANTOS',
   '04/05/1997',
   '08730-590',
   'Alto Ipiranga',
   'SP',
   'Avenida Henrique Eroles - até 1058/1059',
   'Mogi das Cruzes',
   '1126623445'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      27,
   '937805419',
   '460.249.458-76',
   'JEFFERSON',
   'ROSBERG',
   'ALVES',
   '05/05/1997',
   '08730-493',
   'Centro',
   'SP',
   'Avenida Henrique Eroles - de 1060/1061 a 1298/1299',
   'Mogi das Cruzes',
   '1125762529'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      28,
   '659946775',
   '475.110.988-00',
   'JOSE',
   'VICTOR HONORATO DE JESUS',
   'CESAR',
   '06/05/1997',
   '08735-400',
   'Vila Bernadotti',
   'SP',
   'Avenida Henrique Peres',
   'Mogi das Cruzes',
   '1126655644'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      29,
   '207207271',
   '449.535.058-75',
   'GABRIEL',
   'AUGUSTO BONIFACIO',
   'DE OLIVEIRA',
   '07/05/1997',
   '08725-745',
   'Jardim Nathalie',
   'SP',
   'Avenida Herminio Raphael da Silva',
   'Mogi das Cruzes',
   '1128721666'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      30,
   '779644845',
   '461.624.598-37',
   'GESIELE',
   'POLIANA ALMEIDA',
   'SILVA',
   '08/05/1997',
   '08770-042',
   'Vila Industrial',
   'SP',
   'Avenida Inal',
   'Mogi das Cruzes',
   '1136690378'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      31,
   '259460369',
   '477.144.728-47',
   'RICARDO',
   'D ALBUQUERQUE',
   'DE OLIVEIRA',
   '09/05/1997',
   '08730-330',
   'Alto Ipiranga',
   'SP',
   'Avenida Japão',
   'Mogi das Cruzes',
   '1139908367'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      32,
   '728829155',
   '472.025.768-21',
   'GUSTAVO',
   'CALAZANS DOS SANTOS',
   'REIS',
   '10/05/1997',
   '08738-010',
   'Vila Brasileira',
   'SP',
   'Avenida Japão',
   'Mogi das Cruzes',
   '1125888367'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      33,
   '670077720',
   '454.325.878-90',
   'LUIZ',
   'GUSTAVO RODRIGO',
   'DOS SANTOS',
   '11/05/1997',
   '08730-010',
   'Vila Vitória',
   'SP',
   'Avenida Japão',
   'Mogi das Cruzes',
   '1128585375'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      34,
   '415524096',
   '448.424.468-38',
   'SARA',
   'OLIVEIRA MENDES',
   'DOS SANTOS',
   '12/05/1997',
   '08720-070',
   'Jardim Camila',
   'SP',
   'Avenida Jorge Salvarani',
   'Mogi das Cruzes',
   '1127782804'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      35,
   '318620734',
   '464.877.838-38',
   'NADIA',
   'DE CASSIA',
   'RAMALHO',
   '13/05/1997',
   '08715-530',
   'Alto da Boa Vista',
   'SP',
   'Avenida José Glicério de Mello - até 399/400',
   'Mogi das Cruzes',
   '1128316116'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      36,
   '705133865',
   '400.793.328-62',
   'MILENA',
   'DIOGENES BATISTA',
   'ALVES',
   '14/05/1997',
   '08720-060',
   'Jardim Camila',
   'SP',
   'Avenida José Glicério de Mello - de 401/402 ao fim',
   'Mogi das Cruzes',
   '1136624027'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      37,
   '272115437',
   '413.976.548-80',
   'MATHEUS',
   'AUGUSTO DOS SANTOS',
   'E SILVA',
   '15/05/1997',
   '08773-480',
   'Vila Mogilar',
   'SP',
   'Avenida José Maria de Albuquerque Freitas',
   'Mogi das Cruzes',
   '1139264009'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      38,
   '880891692',
   '477.087.768-48',
   'KAWAI',
   'ARIADNE MARCOLINO',
   'FRANÇA',
   '16/05/1997',
   '08773-120',
   'Vila Mogilar',
   'SP',
   'Avenida José Meloni',
   'Mogi das Cruzes',
   '1125904964'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      39,
   '425994011',
   '426.744.958-98',
   'GABRIELA',
   'NOGUEIRA',
   'LOPES',
   '17/05/1997',
   '08773-310',
   'Vila Mogilar',
   'SP',
   'Avenida José Moreira Filho',
   'Mogi das Cruzes',
   '1125904964'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      40,
   '409782186',
   '388.932.938-11',
   'LUIZ',
   'FELIPE GONZAGA',
   'DE ALMEIDA',
   '18/05/1997',
   '08738-520',
   'Vila Brasileira',
   'SP',
   'Avenida Julio Simões',
   'Mogi das Cruzes',
   '1136115610'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      41,
   '432428744',
   '469.291.788-10',
   'MARIA',
   'LETICIA',
   'DE SOUZA',
   '19/05/1997',
   '08735-285',
   'Vila São Francisco',
   'SP',
   'Avenida Katsuji Kitaguchi',
   'Mogi das Cruzes',
   '1137403950'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      42,
   '406982726',
   '357.294.938-60',
   'AMANDA',
   'CRISTINA SANTOS',
   'RANGEL',
   '20/05/1997',
   '08773-070',
   'Vila Mogilar',
   'SP',
   'Avenida Luciano Frezato',
   'Mogi das Cruzes',
   '1126181239'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      43,
   '532064949',
   '450.285.888-99',
   'LIDIANE',
   'MARIANO',
   'BERNARDO',
   '21/05/1997',
   '08790-853',
   'Vila Socorro',
   'SP',
   'Avenida Luiz Miyatake (Real Park Jd Colégio)',
   'Mogi das Cruzes',
   '1126403996'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      44,
   '723972985',
   '392.791.948-95',
   'REBECCA',
   'JUNQUEIRA SILVA',
   'ROSA',
   '22/05/1997',
   '08715-620',
   'Alto da Boa Vista',
   'SP',
   'Avenida Manoel Pinto de Almeida',
   'Mogi das Cruzes',
   '1127411772'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      45,
   '973606326',
   '447.275.108-98',
   'FERNANDA',
   'APARECIDA PEREIRA',
   'RODRIGUES',
   '23/05/1997',
   '08730-060',
   'Alto Ipiranga',
   'SP',
   'Avenida Maria Osório Valle',
   'Mogi das Cruzes',
   '1137044695'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      46,
   '199844404',
   '424.343.918-42',
   'ALECSANDER',
   'CORREA DA SILVA DE CASTRO',
   'OLIVEIRA',
   '24/05/1997',
   '08773-330',
   'Vila Mogilar',
   'SP',
   'Avenida Mariano Souza Mello',
   'Mogi das Cruzes',
   '1135947197'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      47,
   '696369222',
   '476.834.288-41',
   'THIAGO',
   'AMORIM MACHADO',
   'LEITE',
   '25/05/1997',
   '08726-035',
   'Parque Morumbi',
   'SP',
   'Avenida Monte das Oliveiras',
   'Mogi das Cruzes',
   '1125273347'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      48,
   '965020077',
   '399.112.118-27',
   'PABLO',
   'LUIS DE OLIVEIRA',
   'SILVA',
   '26/05/1997',
   '08726-040',
   'Parque Morumbi',
   'SP',
   'Avenida Monte das Samarias',
   'Mogi das Cruzes',
   '1126575656'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      49,
   '666980048',
   '423.928.798-77',
   'TIAGO',
   'DA SILVA',
   'BORGES',
   '27/05/1997',
   '08726-060',
   'Parque Morumbi',
   'SP',
   'Avenida Monte Sião',
   'Mogi das Cruzes',
   '1128077699'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      50,
   '296667182',
   '469.813.688-11',
   'NATALIA',
   'DE FREITAS',
   'SIQUEIRA',
   '28/05/1997',
   '08790-740',
   'Vila Natal',
   'SP',
   'Avenida Orlando Sebastião Mascarelli',
   'Mogi das Cruzes',
   '1136322766'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      51,
   '803616294',
   '450.702.398-05',
   'DALTON',
   'JULIO CELESTINO',
   'SILVA',
   '29/05/1997',
   '08720-140',
   'Jardim Camila',
   'SP',
   'Avenida Oscar Lopes de Campos',
   'Mogi das Cruzes',
   '1125690267'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      52,
   '467122025',
   '434.133.458-18',
   'ALINE',
   'LAURENTINA',
   'DE LIMA',
   '30/05/1997',
   '08720-550',
   'Jardim Camila',
   'SP',
   'Avenida Pedro Battani',
   'Mogi das Cruzes',
   '1127525359'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      53,
   '855417300',
   '427.618.848-25',
   'LUIS',
   'GUSTAVO DOS SANTOS',
   'SILVA',
   '31/05/1997',
   '08717-720',
   'Mogi Moderno',
   'SP',
   'Avenida Pedro Machado',
   'Mogi das Cruzes',
   '1138567858'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      54,
   '737607218',
   '437.533.368-58',
   'MATHEUS',
   'DE ARAUJO',
   'SOUZA',
   '01/06/1997',
   '08720-290',
   'Mogi Moderno',
   'SP',
   'Avenida Prefeito Carlos Alberto Lopes',
   'Mogi das Cruzes',
   '1126367994'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      55,
   '315719858',
   '421.935.958-36',
   'PAULO',
   'HENRIQUE MAGALHAES',
   'PIRES',
   '02/06/1997',
   '08773-490',
   'Vila Mogilar',
   'SP',
   'Avenida Prefeito Carlos Ferreira Lopes',
   'Mogi das Cruzes',
   '1139563667'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      56,
   '142245524',
   '450.675.578-26',
   'THAMIRES',
   'GERALDO',
   'DE OLIVEIRA',
   '03/06/1997',
   '08717-490',
   'Mogi Moderno',
   'SP',
   'Avenida Prefeito Francisco Ribeiro Nogueira',
   'Mogi das Cruzes',
   '1135143720'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      57,
   '692817988',
   '474.035.158-70',
   'AMANDA',
   'CRISTINA',
   'CORREA',
   '04/06/1997',
   '08720-340',
   'Jardim Camila',
   'SP',
   'Avenida Professor Mariano Salvarani',
   'Mogi das Cruzes',
   '1135406895'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      58,
   '323439473',
   '434.234.988-46',
   'WELLINGTON',
   'LUIZ ALVES',
   'MOREIRA',
   '05/06/1997',
   '08753-310',
   'Parque das Varinhas',
   'SP',
   'Avenida Ricieri Bertaiolli Júnior',
   'Mogi das Cruzes',
   '1139809562'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      59,
   '513699380',
   '451.946.188-08',
   'ESLIEL',
   'MOREIRA',
   'MARTINS',
   '06/06/1997',
   '08725-730',
   'Jardim Nathalie',
   'SP',
   'Avenida Roque Stilhano',
   'Mogi das Cruzes',
   '1137748695'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      60,
   '823989130',
   '447.251.868-64',
   'JONAS',
   'GUILHERME',
   'DOS SANTOS',
   '07/06/1997',
   '08725-060',
   'Conjunto Residencial Nova Bertioga',
   'SP',
   'Avenida São Lourenço',
   'Mogi das Cruzes',
   '1127973714'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      61,
   '451210943',
   '458.808.118-75',
   'ANA',
   'CAROLINA MARTINS',
   'DA SILVA',
   '08/06/1997',
   '08773-080',
   'Vila Mogilar',
   'SP',
   'Avenida Teóphilo Salustiano',
   'Mogi das Cruzes',
   '1129341276'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      62,
   '510678752',
   '448.487.508-06',
   'MAIARA',
   'BONFIM',
   'CANDIDO',
   '09/06/1997',
   '08735-270',
   'Vila São Francisco',
   'SP',
   'Avenida Valentina Mello Freire Borenstein',
   'Mogi das Cruzes',
   '1126028391'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      63,
   '427798226',
   '399.354.628-89',
   'TAMIRIS',
   'CRISTINA DA COSTA',
   'MARTINS',
   '10/06/1997',
   '08710-500',
   'Centro',
   'SP',
   'Avenida Voluntário Fernando Pinheiro Franco',
   'Mogi das Cruzes',
   '1138054976'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      64,
   '419128287',
   '453.289.718-17',
   'JULIA',
   'STEFANIE',
   'DOS SANTOS',
   '11/06/1997',
   '08753-397',
   'Parque das Varinhas',
   'SP',
   'Caminho Cinco',
   'Mogi das Cruzes',
   '1128976003'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      65,
   '233675625',
   '446.808.128-77',
   'THAIS',
   'LINS DE OLIVEIRA',
   'MARQUES',
   '12/06/1997',
   '08753-387',
   'Parque das Varinhas',
   'SP',
   'Caminho Oito',
   'Mogi das Cruzes',
   '1127249466'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      66,
   '688984629',
   '447.704.518-22',
   'JORGE',
   'LUIZ CORREA',
   'FRANCA',
   '13/06/1997',
   '08753-403',
   'Parque das Varinhas',
   'SP',
   'Caminho Um',
   'Mogi das Cruzes',
   '1127328705'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      67,
   '770491859',
   '466.761.778-03',
   'FERNANDA',
   'JAQUELINE DE MOURA',
   'FELIX',
   '14/06/1997',
   '08840-070',
   'Vila São Paulo',
   'SP',
   'Estrada Antiga Imperial',
   'Mogi das Cruzes',
   '1129146253'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      68,
   '936233027',
   '419.475.778-59',
   'MILENA',
   'CESAR',
   'DA SILVA',
   '15/06/1997',
   '08767-370',
   'Biritiba Ussu',
   'SP',
   'Estrada Hayama',
   'Mogi das Cruzes',
   '1136102369'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      69,
   '372753349',
   '477.425.828-80',
   'ANDRE',
   'LUIS DOS SANTOS',
   'VIEIRA',
   '16/06/1997',
   '08769-520',
   'Barroso',
   'SP',
   'Estrada Isao Ishida',
   'Mogi das Cruzes',
   '1127585485'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      70,
   '968232998',
   '470.074.318-28',
   'JOAO',
   'VICTOR LORENA',
   'GONÇALVES',
   '17/06/1997',
   '08725-225',
   'Vila Caputera',
   'SP',
   'Estrada Jinichi Shigeno',
   'Mogi das Cruzes',
   '1128236073'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      71,
   '936253568',
   '474.480.358-00',
   'THALITA',
   'VILEGAS',
   'DE OLIVEIRA',
   '18/06/1997',
   '08767-390',
   'Biritiba Ussu',
   'SP',
   'Estrada Kem Saito',
   'Mogi das Cruzes',
   '1125384591'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      72,
   '324253440',
   '459.605.168-29',
   'LUIS',
   'FELIPE MIRANDA DA SILVA',
   'BRITO',
   '19/06/1997',
   '08725-630',
   'Conjunto Habitacional Ana Paula',
   'SP',
   'Estrada Municipal',
   'Mogi das Cruzes',
   '1128208548'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      73,
   '215537710',
   '459.517.918-98',
   'WILLIAN',
   'ARAUJO',
   'ROQUE',
   '20/06/1997',
   '08832-240',
   'Cézar de Souza',
   'SP',
   'Estrada Municipal (Cj Res Ver Jeferson da Silva)',
   'Mogi das Cruzes',
   '1137778958'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      74,
   '810684246',
   '475.460.068-13',
   'THAINARA',
   'HELEN DA SILVA',
   'LUCIANO',
   '21/06/1997',
   '08767-500',
   'Biritiba Ussu',
   'SP',
   'Estrada Municipal Shibata',
   'Mogi das Cruzes',
   '1137313334'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      75,
   '708472789',
   '477.553.658-32',
   'DAIANE',
   'FERNANDA DE OLIVEIRA',
   'PINTO',
   '22/06/1997',
   '08725-655',
   'Vila Caputera',
   'SP',
   'Estrada Rikio Suenaga',
   'Mogi das Cruzes',
   '1127896990'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      76,
   '627520807',
   '464.197.698-84',
   'FERNANDO',
   'BARROSO',
   'DIAS',
   '23/06/1997',
   '08832-000',
   'Cézar de Souza',
   'SP',
   'Estrada Santa Catarina',
   'Mogi das Cruzes',
   '1128041091'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      77,
   '571419363',
   '451.230.518-13',
   'JOSE',
   'EDUARDO GOMES VENTURA',
   'FLORENTINO',
   '24/06/1997',
   '08710-340',
   'Centro',
   'SP',
   'Largo do Bom Jesus',
   'Mogi das Cruzes',
   '1136105670'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      78,
   '489069071',
   '471.873.078-37',
   'LETICIA',
   'TEBERGA',
   'DA COSTA',
   '25/06/1997',
   '08710-080',
   'Centro',
   'SP',
   'Largo do Carmo',
   'Mogi das Cruzes',
   '1125800815'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      79,
   '767115809',
   '394.044.298-48',
   'RAFAELA',
   'CRISTINA ARAUJO DE OLIVEIRA',
   'MARCONDES',
   '26/06/1997',
   '08710-060',
   'Centro',
   'SP',
   'Largo do Rosário',
   'Mogi das Cruzes',
   '1136561001'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      80,
   '615861935',
   '370.828.478-07',
   'GERALDO',
   'GAMA',
   'NETO',
   '27/06/1997',
   '08727-000',
   'Cidade Jardim',
   'SP',
   'Loteamento Cidade Jardim',
   'Mogi das Cruzes',
   '1136664250'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      81,
   '301895895',
   '371.092.728-50',
   'FERNANDA',
   'BUENO',
   'DE OLIVEIRA',
   '28/06/1997',
   '08726-000',
   'Parque Morumbi',
   'SP',
   'Loteamento Parque Morumbi',
   'Mogi das Cruzes',
   '1138601675'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      82,
   '553141912',
   '441.020.818-79',
   'KENNEDY',
   'ROBERT DE OLIVEIRA',
   'SOARES',
   '29/06/1997',
   '08769-000',
   'Taiaçupeba',
   'SP',
   'Loteamento Quatinga',
   'Mogi das Cruzes',
   '1125877362'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      83,
   '149278008',
   '454.466.888-30',
   'ANA',
   'CLAUDIA DA SILVA',
   'PRADO',
   '30/06/1997',
   '08727-500',
   'Braz Cubas',
   'SP',
   'Loteamento Vila Oropo',
   'Mogi das Cruzes',
   '1136187842'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      84,
   '293157239',
   '450.400.788-62',
   'ISABELLA',
   'SAAR',
   'E SILVA',
   '01/07/1997',
   '08725-545',
   'Conjunto Habitacional São Sebastião',
   'SP',
   'Praça Alexandre de D. Carvalho Santos',
   'Mogi das Cruzes',
   '1128465637'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      85,
   '804281712',
   '458.215.078-04',
   'ELCILENE',
   'SALGADO',
   'GONÇALVES',
   '02/07/1997',
   '08730-340',
   'Alto Ipiranga',
   'SP',
   'Praça Antônio Costa Filho',
   'Mogi das Cruzes',
   '1129762929'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      86,
   '198733801',
   '453.439.488-80',
   'KAREN',
   'ALINE',
   'FERREIRA',
   '03/07/1997',
   '08730-580',
   'Alto Ipiranga',
   'SP',
   'Praça Antônio Ferry',
   'Mogi das Cruzes',
   '1129539256'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      87,
   '878023950',
   '436.572.178-00',
   'LEILA',
   'GONÇALVES',
   'BARREIRA',
   '04/07/1997',
   '08715-440',
   'Alto da Boa Vista',
   'SP',
   'Praça Antônio Frederico Ozanan',
   'Mogi das Cruzes',
   '1135432617'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      88,
   '504457933',
   '431.249.008-20',
   'ANA',
   'FLAVIA PALAZZI',
   'MOURA',
   '05/07/1997',
   '08773-505',
   'Vila Mogilar',
   'SP',
   'Praça Assumpção Ramirez Eroles',
   'Mogi das Cruzes',
   '1125066128'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      89,
   '778523296',
   '448.656.668-85',
   'JULIANE',
   'APARECIDA LEMES',
   'DA SILVA',
   '06/07/1997',
   '08715-435',
   'Alto da Boa Vista',
   'SP',
   'Praça Cícero Alves dos Anjos',
   'Mogi das Cruzes',
   '1135380300'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      90,
   '706558138',
   '403.379.118-35',
   'ABRAAO',
   'RODRIGUES',
   'DE ARAUJO',
   '07/07/1997',
   '08710-090',
   'Centro',
   'SP',
   'Praça Coronel Benedito de Almeida',
   'Mogi das Cruzes',
   '1126857739'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      91,
   '211178147',
   '461.519.148-05',
   'ANA',
   'FLAVIA BARBOSA ALBANO',
   'DE DEUS',
   '08/07/1997',
   '08738-110',
   'Conjunto Residencial Álvaro Bovolenta',
   'SP',
   'Praça Coronel Chead Abdalla',
   'Mogi das Cruzes',
   '1138424924'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      92,
   '695145277',
   '342.166.128-65',
   'ANA',
   'CAROLINE SEBASTIAO',
   'FORTES',
   '09/07/1997',
   '08710-560',
   'Centro',
   'SP',
   'Praça da Bandeira',
   'Mogi das Cruzes',
   '1126563886'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      93,
   '749433945',
   '447.362.808-67',
   'MALATI',
   'DE FREITAS',
   'SANTANA',
   '10/07/1997',
   '08710-670',
   'Jardim Avenida',
   'SP',
   'Praça da Maçonaria',
   'Mogi das Cruzes',
   '1129265146'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      94,
   '431025486',
   '457.609.788-10',
   'RAFAEL',
   'ALVES',
   'DE MENEZES',
   '11/07/1997',
   '08773-390',
   'Vila Mogilar',
   'SP',
   'Praça do Expedicionário',
   'Mogi das Cruzes',
   '1139487750'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      95,
   '982238196',
   '469.875.998-66',
   'KEILA',
   'MAELE DOS SANTOS',
   'PENA',
   '12/07/1997',
   '08710-510',
   'Centro',
   'SP',
   'Praça Dona Firmina Santana',
   'Mogi das Cruzes',
   '1135073223'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      96,
   '597531673',
   '453.245.618-51',
   'SARAH',
   'DIAS',
   'RABELO',
   '13/07/1997',
   '08735-080',
   'Jardim Avenida',
   'SP',
   'Praça dos Imigrantes',
   'Mogi das Cruzes',
   '1139881701'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      97,
   '154507010',
   '457.347.268-18',
   'MATHEUS',
   'GABRIEL DA SILVA',
   'FOLHA',
   '14/07/1997',
   '08735-060',
   'Jardim Avenida',
   'SP',
   'Praça Ferdinando Jungers',
   'Mogi das Cruzes',
   '1135137683'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      98,
   '937310549',
   '375.251.998-33',
   'ERISLAINE',
   'MENDES SOARES',
   'FERREIRA',
   '15/07/1997',
   '08717-055',
   'Centro',
   'SP',
   'Praça Francisco Ferreira Lopes',
   'Mogi das Cruzes',
   '1139845629'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      99,
   '665557508',
   '439.022.678-95',
   'MATEUS',
   'BORGES',
   'ALVES',
   '16/07/1997',
   '08715-085',
   'Centro',
   'SP',
   'Praça Francisco Ribeiro Nogueira',
   'Mogi das Cruzes',
   '1136350880'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      100,
   '858149690',
   '451.878.628-98',
   'DAIANE',
   'DE CASTRO',
   'CORREA',
   '17/07/1997',
   '08740-020',
   'Braz Cubas',
   'SP',
   'Praça Francisco Urbano',
   'Mogi das Cruzes',
   '1128595012'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      101,
   '757618187',
   '445.829.918-23',
   'ALANA',
   'STEPHANIE DE FREITAS',
   'SANTOS',
   '18/07/1997',
   '08717-120',
   'Centro',
   'SP',
   'Praça Galdino Pinheiro Franco',
   'Mogi das Cruzes',
   '1138094683'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      102,
   '501939505',
   '417.674.528-29',
   'PAOLA',
   'ISABELLE DOS SANTOS',
   'TAKEZAWA',
   '19/07/1997',
   '08710-540',
   'Vila Hélio',
   'SP',
   'Praça Hélio Borenstein',
   'Mogi das Cruzes',
   '1129263701'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      103,
   '988973493',
   '464.188.508-74',
   'LUCIANA',
   'CARMONA FARIA',
   'DE BARROS',
   '20/07/1997',
   '08725-170',
   'Conjunto Habitacional Ana Paula',
   'SP',
   'Praça Januário Figueira da Silva',
   'Mogi das Cruzes',
   '1147788978'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      104,
   '811793379',
   '448.759.008-64',
   'MARCIO',
   'DE AMORIM ROCHA',
   'JUNIOR',
   '21/07/1997',
   '08710-320',
   'Centro',
   'SP',
   'Praça João Antônio Batalha',
   'Mogi das Cruzes',
   '1120074587'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      105,
   '668983447',
   '453.682.698-03',
   'BRUNO',
   'RAFAEL PADUA',
   'DE ARAUJO',
   '22/07/1997',
   '08715-040',
   'Centro',
   'SP',
   'Praça João Martins de Melo',
   'Mogi das Cruzes',
   '1133789987'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      106,
   '850952313',
   '449.753.238-00',
   'LAIS',
   'LETICIA',
   'DOS SANTOS',
   '23/07/1997',
   '08715-020',
   'Centro',
   'SP',
   'Praça Luiz Vaz de Camões',
   'Mogi das Cruzes',
   '1127788691'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      107,
   '924046302',
   '464.997.558-18',
   'ISABELA',
   'ALANA ALEIXO',
   'COUTINHO',
   '24/07/1997',
   '08715-070',
   'Centro',
   'SP',
   'Praça Marechal Deodoro',
   'Mogi das Cruzes',
   '1123469784'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      108,
   '755368311',
   '469.771.928-01',
   'JOSE',
   'ARMANDO RAMOS',
   'DE MORAES',
   '25/07/1997',
   '08710-330',
   'Centro',
   'SP',
   'Praça Ministro Roque Pinto de Barros',
   'Mogi das Cruzes',
   '1124231243'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      109,
   '767361753',
   '446.783.508-37',
   'MATHEUS',
   'DA SILVA',
   'E SOUZA',
   '26/07/1997',
   '08715-230',
   'Centro',
   'SP',
   'Praça Nagib Elias G. Bou-Ghosson',
   'Mogi das Cruzes',
   '1135011487'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      110,
   '548291108',
   '462.096.608-86',
   'EVELYN',
   'ANA DA SILVA',
   'XISTO',
   '27/07/1997',
   '08710-700',
   'Centro',
   'SP',
   'Praça Odmar Amaral Gurgel',
   'Mogi das Cruzes',
   '1125548797'
    );
  INSERT
  INTO
    PABLO.FUNCIONARIO
    (
      fnc_id,
      fnc_rg,
      fnc_cpf,
      fnc_nome,
      fnc_nomedomeio,
      fnc_sobrenome,
      fnc_data_nascimento,
      fnc_cep,
      fnc_bairro,
      fnc_estado,
      fnc_logradouro,
      fnc_cidade,
      fnc_telefone
    )
    VALUES
    (
      111,
   '814335076',
   '235.158.478-39',
   'VITORIA',
   'PEREIRA',
   'DA SILVA',
   '28/07/1997',
   '08710-300',
   'Centro',
   'SP',
   'Praça Oswaldo Cruz',
   'Mogi das Cruzes',
   '1135546987'
    );
  -- FORNECEDOR
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '1',
   'CLEITON',
   nvl('', 'ALVES'),
   'FEITOSA',
   '60.206.208/0001-93',
   'Johnson E Johnson do Brasil',
   '1125522877',
   'empresa@johnsons.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '2',
   'DAVID',
   'BARRETO LESSA',
   'CARVALHO',
   '60.206.123/9482-84',
   'Coca E Cola do Brasil',
   '1245578897',
   'cocacola@cocacola.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '3',
   'PAULO',
   'GONÇALVES',
   'CORTEZ',
   '42.423.386/0001-94',
   'Dolly S.A',
   '1135456789',
   'empresa@dolly.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '4',
   'KARINE',
   'DA SILVA',
   'FILHO',
   '35.022.563/0001-65',
   'Sérgio e Ian Restaurante Ltda',
   '1154487987',
   'empresa@sergio.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '5',
   'JAIRO',
   '',
   'NEPOMUCENO',
   '62.735.578/0001-43',
   'Giovanna e Felipe Joalheria ME',
   '1928288848',
   'empresa@giovanna.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '6',
   'DENES',
   'FEITOSA DUQUE',
   'DUQUE',
   '03.049.038/0001-47',
   'Liz e Mariane Ferragens Ltda',
   '19999334395',
   'empresa@liz.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '7',
   'WILLAMY',
   '',
   'DASILVA',
   '90.738.567/0001-52',
   'Pedro e Antônia Marketing ME',
   '1335368239',
   'empresa@pedro.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '8',
   'JOSE',
   '',
   'DOS SANTOS',
   '72.091.896/0001-72',
   'Ambev',
   '13986056146',
   'empresa@ambev.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '9',
   'GUSTAVO',
   'PAULO',
   'DA SILVA',
   '81.142.198/0001-40',
   'Severino e Larissa Pizzaria Ltda',
   '1129486804',
   'empresa@severino.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '10',
   'LEANDRO',
   'SILVINO ARAÚJO',
   'DOS SANTOS',
   '45.474.129/0001-70',
   'Benedita e Carlos Eduardo Gráfica Ltda',
   '11982574889',
   'empresa@benedita.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '11',
   'MARIA',
   '',
   'DE OLIVEIRA',
   '68.969.668/0001-85',
   'Giovana e Laís Filmagens ME',
   '1137568718',
   'empresa@giovana.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '12',
   'JULLIENY',
   'SANTOS',
   'ROCHA',
   '82.869.262/0001-51',
   'Antonio e Manoel Marcenaria ME',
   '11987357660',
   'empresa@antonio.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '13',
   'DANIEL',
   '',
   'DE CARVALHO',
   '59.230.914/0001-91',
   'Rafael e Stefany Financeira Ltda',
   '1126743980',
   'empresa@rafael.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '14',
   'JAMES',
   'CARVALHO',
   'SOUZA',
   '73.653.545/0001-70',
   'Tânia e Helena Informática Ltda',
   '11992410371',
   'empresa@tania.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '15',
   'ITAMAR',
   '',
   'DE SOUSA',
   '40.921.155/0001-85',
   'Elaine e Mirella Vidros ME',
   '1439992209',
   'empresa@elaine.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '16',
   'ERITA',
   '',
   'DA SILVA',
   '69.965.852/0001-10',
   'Marli e Alana Padaria Ltda',
   '14988969770',
   'empresa@marli.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '17',
   'RISALDO',
   '',
   'BATISTA',
   '23.936.699/0001-00',
   'Carlos e Elisa Financeira Ltda',
   '1129372097',
   'empresa@carlos.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '18',
   'ÁLVARO',
   '',
   'RIBEIRO',
   '60.206.123/9482-10',
   'Arthur e Gael Eletrônica ME',
   '11995853074',
   'empresa@arthur.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '19',
   'RITA',
   'CÁSSIA  ',
   'DOS SANTOS ',
   '54.940.702/0001-84',
   'Isabella e Manuel Marcenaria ME',
   '11255747382',
   'empresa@isabella.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '20',
   'ALCIONE',
   'DE HOLANDA FLORÊNCIO ',
   'E SILVA',
   '14.935.778/0001-05',
   'Allana e Francisca Pães e Doces Ltda',
   '11987477372',
   'empresa@allana.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '21',
   'CARLOS',
   'DE OLIVEIRA',
   'SOUSA',
   '94.602.113/0001-00',
   'Rebeca e Cecília Assessoria Jurídica Ltda',
   '1137548172',
   'empresa@rebeca.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '22',
   'ANA',
   'LIRA',
   'MELO',
   '50.383.138/0001-95',
   'Carolina e Laís Mudanças Ltda  ',
   '1125606936',
   'empresa@carolina.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '23',
   'CLÁUDIA',
   'DE SOUZA',
   'FONSECA',
   '51.478.355/0001-21',
   'JBS S.A ',
   '1154488789',
   'empresa@jbs.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '24',
   'PEDRO',
   '',
   'DA SILVA',
   '91.231.681/0001-54',
   'Sophia e Julia Restaurante Ltda  ',
   '1125522433',
   'empresa@sophia.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '25',
   'FABIANA',
   '',
   'CORREIA',
   '91.924.815/0001-12',
   'Vitória e Victor Marcenaria ME  ',
   '1124422332',
   'empresa@vitoria.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '26',
   'MARIANNA',
   '',
   'DE SOUZA',
   '34.039.685/0001-00',
   'Letícia e Arthur Doces e Salgados Ltda',
   '1126623445',
   'empresa@leticia.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '27',
   'CAROLINA',
   '',
   'DO NASCIMENTO',
   '97.535.897/0001-90',
   'Eduardo e Alícia Pães e Doces ME',
   '1125762529',
   'empresa@eduardo.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '28',
   'SILVANO',
   'BEZERRA ',
   'DE LIMA  ',
   '34.472.072/0001-53',
   'Priscila e Martin Pizzaria ME  ',
   '1126655644',
   'empresa@priscila.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '29',
   'LAURA',
   'DE BARROS',
   'CHAVES',
   '44.396.401/0001-88',
   'Osvaldo e Aline Telecomunicações ME  ',
   '1128721666',
   'empresa@osvaldo.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '30',
   'JONAS',
   '',
   'DE AGUIAR',
   '80.486.200/0001-35',
   'Sophie e Anderson Pizzaria ME  ',
   '1136690378',
   'empresa@sophie.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '31',
   'DORGIVANIA',
   '',
   'DA SILVA',
   '71.047.722/0001-40',
   'Rafael e Raquel Limpeza Ltda  ',
   '1139908367',
   'empresa@rafael.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '32',
   'CARLOS',
   'DE OLIVEIRA',
   'SILVA',
   '31.546.036/0001-07',
   'Thales e Liz Lavanderia Ltda  ',
   '1125888367',
   'empresa@thales.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '33',
   'DAWSON',
   '',
   'DA SILVA',
   '70.705.112/0001-23',
   'Davi e Gabriela Ferragens ME  ',
   '1128585375',
   'empresa@davi.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '34',
   'ELISABETE',
   '',
   'DA SILVA',
   '47.123.542/0001-15',
   'Augusto e Simone Advocacia ME  ',
   '1127782804',
   'empresa@augusto.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '35',
   'MARIA',
   '',
   'DE ALMEIDA',
   '85.699.391/0001-37',
   'Vicente e Carlos Eletrônica Ltda  ',
   '1128316116',
   'empresa@vicente.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '36',
   'ALEXSANDRO',
   'DA SILVA SOUZA  ',
   'VELOSO',
   '43.370.408/0001-68',
   'Rafaela e Lucas Entulhos ME  ',
   '1136624027',
   'empresa@rafaela.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '37',
   'MARCELLO',
   'CAVALCANTI',
   'RICARTE',
   '13.413.909/0001-13',
   'Gustavo e Kevin Mudanças ME  ',
   '1139264009',
   'empresa@gustavo.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '38',
   'LUCIANA',
   'DE QUEIROZ',
   'SILVA',
   '10.843.138/0001-06',
   'Felipe e Tereza Gráfica ME  ',
   '1125904964',
   'empresa@felipe.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '39',
   'DENYS',
   '',
   'DA SILVA',
   '79.238.209/0001-48',
   'Vinicius e Rosângela Joalheria ME  ',
   '1125904964',
   'empresa@vinicius.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '40',
   'JOELMA',
   '',
   'CARRAVETTA',
   '47.897.833/0001-60',
   'Guilherme e Francisco Construções Ltda  ',
   '1136115610',
   'empresa@guilherme.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '41',
   'ALINE',
   '',
   'VIGORITO',
   '52.070.181/0001-26',
   'Allana e Maya Mudanças ME  ',
   '1137403950',
   'empresa@allana.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '42',
   'ALINE',
   '',
   'FABBRIS',
   '47.205.722/0001-46',
   'Nelson e Renan Contábil Ltda  ',
   '1126181239',
   'empresa@nelson.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '43',
   'AMANDA',
   'SILVA',
   'KIESLARCK',
   '96.312.010/0001-31',
   'José e Heloise Publicidade e Propaganda Ltda',
   '1126403996',
   'empresa@jose.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '44',
   'ANA',
   'RODRIGUES',
   'ALVES',
   '35.286.460/0001-02',
   'Bianca e Elias Adega Ltda  ',
   '1127411772',
   'empresa@bianca.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '45',
   'ANA',
   '',
   'MALTA',
   '48.778.909/0001-00',
   'Sueli e Mário Consultoria Financeira Ltda ',
   '1137044695',
   'empresa@sueli.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '46',
   'ARIANE',
   '',
   'BRAGA',
   '24.951.916/0001-95',
   'Enrico e Enrico Advocacia Ltda  ',
   '1135947197',
   'empresa@enrico.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '47',
   'BEATRIZ',
   'ROSA',
   'ALBUQUERQUE',
   '04.967.193/0001-05',
   'Vinicius e Enzo Mudanças Ltda  ',
   '1125273347',
   'empresa@vinicius.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '48',
   'BIANCA',
   '',
   'DE SOUZA',
   '03.425.546/0001-82',
   'Caroline e Breno Eletrônica Ltda  ',
   '1126575656',
   'empresa@caroline.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '49',
   'BRUNO',
   '',
   'SCHNEIDER',
   '31.233.593/0001-60',
   'Márcia e Jaqueline Marcenaria Ltda  ',
   '1128077699',
   'empresa@marcia.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '50',
   'CAMILA',
   '',
   'COSTA',
   '21.749.544/0001-20',
   'Elaine e Cecília Joalheria ME  ',
   '1136322766',
   'empresa@elaine.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '51',
   'CAMILA',
   'GUERRA',
   'FERREIRA',
   '21.426.725/0001-16',
   'Mariah e Carla Transportes Ltda  ',
   '1125690267',
   'empresa@mariah.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '52',
   'CARLA',
   '',
   'NETO',
   '84.104.066/0001-11',
   'Tânia e Elias Entregas Expressas ME ',
   '1127525359',
   'empresa@tania.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '53',
   'CARLOS',
   '',
   'AMARAL',
   '64.006.589/0001-18',
   'Igor e Daniela Assessoria Jurídica ME ',
   '1138567858',
   'empresa@igor.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '54',
   'CAROLINA',
   '',
   'TAROUCO',
   '22.388.796/0001-34',
   'Ana e Mateus Mudanças ME  ',
   '1126367994',
   'empresa@ana.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '55',
   'CASSIUS',
   '',
   'ULGUIM',
   '61.868.659/0001-59',
   'Joaquim e Benjamin Ferragens ME  ',
   '1139563667',
   'empresa@joaquim.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '56',
   'CINTIA',
   'MACHADO',
   'BALOTA',
   '41.449.209/0001-14',
   'Malu e Elias Doces E Salgados Ltda',
   '1135143720',
   'empresa@malu.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '57',
   'CLEIR',
   '',
   'SILVEIRA',
   '89.892.255/0001-10',
   'Maitê e Giovanni Limpeza Ltda  ',
   '1135406895',
   'empresa@maite.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '58',
   'CRISTIANE',
   'OLIVEIRA',
   'FARIAS',
   '68.579.321/0001-26',
   'Renan e Sara Ferragens ME  ',
   '1139809562',
   'empresa@renan.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '59',
   'CRISTIANE',
   '',
   'SCHONS',
   '63.043.035/0001-28',
   'Thiago e Mariah Contábil ME  ',
   '1137748695',
   'empresa@thiago.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '60',
   'CRISTINA',
   '',
   'CONDE',
   '81.680.596/0001-10',
   'Teresinha e Sara Corretores Associados Ltda ',
   '1127973714',
   'empresa@teresinha.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '61',
   'DAIANE',
   '',
   'DA SILVA',
   '65.185.782/0001-26',
   'Noah e Milena Advocacia Ltda  ',
   '1129341276',
   'empresa@noah.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '62',
   'DANIELE',
   '',
   'DE ABREU',
   '32.228.733/0001-74',
   'Giovanni e Lúcia Telas ME  ',
   '1126028391',
   'empresa@giovanni.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '63',
   'DANIELLE',
   'DOS SANTOS',
   'FROES',
   '04.797.541/0001-43',
   'Pedro e Fátima Marcenaria Ltda  ',
   '1138054976',
   'empresa@pedro.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '64',
   'DARLISE',
   'DA SILVA',
   'MENDES',
   '60.537.476/0001-98',
   'Laís e Leonardo Doces E Salgados ME',
   '1128976003',
   'empresa@lais.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '65',
   'DEBORA',
   '',
   'DE FREITAS',
   '01.177.065/0001-70',
   'Antônia e Mirella Alimentos ME  ',
   '1127249466',
   'empresa@antônia.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '66',
   'ELIANDRA',
   'SILVA ABREU ',
   'DE SOUSA ',
   '32.684.726/0001-87',
   'Oliver e Cauã Vidros ME  ',
   '1127328705',
   'empresa@oliver.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '67',
   'ELICINEI',
   'CRUZ',
   'LISBOA',
   '68.621.667/0001-45',
   'Edson e Laura Ferragens ME  ',
   '1129146253',
   'empresa@edson.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '68',
   'FERNANDA',
   '',
   'COELHO',
   '84.876.821/0001-86',
   'Emanuel e José Filmagens Ltda  ',
   '1136102369',
   'empresa@emanuel.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '69',
   'FERNANDA',
   '',
   'DE OLIVEIRA',
   '56.691.033/0001-80',
   'Catarina e Bárbara Transportes ME  ',
   '1127585485',
   'empresa@catarina.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '70',
   'FERNANDO',
   '',
   'OLIVEIRA',
   '59.018.855/0001-92',
   'Paulo e Melissa Gráfica ME  ',
   '1128236073',
   'empresa@paulo.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '71',
   'GABRIELA',
   'SILVEIRA',
   'NEVES',
   '85.089.647/0001-94',
   'Gustavo e Edson Adega Ltda  ',
   '1125384591',
   'empresa@gustavo.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '72',
   'GABRIELA',
   'SANTOS',
   'TOMAZ',
   '60.817.421/0001-31',
   'Nicole e Fátima Construções ME  ',
   '1128208548',
   'empresa@nicole.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '73',
   'GISELE',
   '',
   'MORAES',
   '94.656.164/0001-15',
   'André e Carlos Pizzaria ME  ',
   '1137778958',
   'empresa@andre.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '74',
   'GIULIA',
   'FELIPPE',
   'NETO',
   '78.033.956/0001-87',
   'Caroline e Heloisa Financeira ME  ',
   '1137313334',
   'empresa@caroline.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '75',
   'IRIO',
   '',
   'CRUZ',
   '74.248.253/0001-15',
   'Otávio e Leonardo Publicidade e Propaganda Ltda',
   '1127896990',
   'empresa@otavio.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '76',
   'JEFERSON',
   '',
   'CAMINHA',
   '87.473.804/0001-96',
   'Marli e Guilherme Assessoria Jurídica Ltda ',
   '1128041091',
   'empresa@marli.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '77',
   'JENIFER',
   '',
   'PEREIRA',
   '63.436.462/0001-76',
   'Francisca e Luciana Marketing ME  ',
   '1136105670',
   'empresa@francisca.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '78',
   'JOICE',
   'DIAS',
   'JUNIOR',
   '61.646.755/0001-52',
   'Juliana e Bárbara Pizzaria ME  ',
   '1125800815',
   'empresa@juliana.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '79',
   'JOSE',
   'ROCHA',
   'GAMBOA',
   '35.626.349/0001-18',
   'Francisco e Sônia Gráfica ME  ',
   '1136561001',
   'empresa@francisco.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '80',
   'JULIANA',
   'ARAUJO',
   'MEDEIROS',
   '06.677.798/0001-97',
   'Benício e Isadora Transportes ME  ',
   '1136664250',
   'empresa@benicio.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '81',
   'KAREN',
   '',
   'DE AGUIAR',
   '00.764.610/0001-61',
   'Eloá e Emilly Esportes ME  ',
   '1138601675',
   'empresa@eloa.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '82',
   'ARINE',
   '',
   'AVILA',
   '74.921.160/0001-00',
   'Pietra e Clarice Adega Ltda  ',
   '1125877362',
   'empresa@pietra.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '83',
   'KARINE',
   '',
   'LOPES',
   '42.199.181/0001-77',
   'Fernanda e Rafaela Pizzaria Delivery ME ',
   '1136187842',
   'empresa@fernanda.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '84',
   'KAROLINE',
   'DE CASTRO',
   'TEIXEIRA',
   '76.064.134/0001-38',
   'Teresinha e Arthur Advocacia Ltda  ',
   '1128465637',
   'empresa@teresinha.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '85',
   'LARISSA',
   '',
   'MONTEIRO',
   '31.194.542/0001-76',
   'Marcela e César Casa Noturna ME ',
   '1129762929',
   'empresa@marcela.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '86',
   'LIDIANE',
   '',
   'CAURIO',
   '43.164.381/0001-57',
   'Lavínia e Rayssa Telas ME  ',
   '1129539256',
   'empresa@lavinia.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '87',
   'LILIANE',
   'MATTOS',
   'FERRER',
   '20.088.528/0001-71',
   'Luciana e Eduardo Restaurante ME  ',
   '1135432617',
   'empresa@luciana.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '88',
   'LIVIA',
   'PINHO',
   'SOUZA',
   '73.141.427/0001-83',
   'Pietra e Thiago Corretores Associados Ltda ',
   '1125066128',
   'empresa@pietra.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '89',
   'MAICON',
   '',
   'DA SILVA',
   '84.460.070/0001-12',
   'Jéssica e Bernardo Contábil Ltda  ',
   '1135380300',
   'empresa@jessica.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '90',
   'MAIRA',
   'DE ARAUJO',
   'MADRUGA',
   '17.716.865/0001-51',
   'Eliane e Arthur Advocacia Ltda  ',
   '1126857739',
   'empresa@eliane.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '91',
   'MARCUS',
   'BORGES ',
   'DA SILVA  ',
   '59.667.707/0001-07',
   'Rodrigo e Sebastiana Restaurante Ltda  ',
   '1138424924',
   'empresa@rodrigo.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '92',
   'MARIA',
   'SILVA',
   'BROD',
   '92.266.785/0001-67',
   'Matheus e Isabelle Mudanças Ltda  ',
   '1126563886',
   'empresa@matheus.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '93',
   'MARTA',
   'SANTOS',
   'AFONSO',
   '61.188.146/0001-05',
   'Mariah e Simone Fotografias ME  ',
   '1129265146',
   'empresa@mariah.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '94',
   'MAX',
   '',
   'SOARES',
   '36.916.190/0001-39',
   'Ayla e Henry Entulhos Ltda  ',
   '1139487750',
   'empresa@ayla.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '95',
   'MICHELE',
   'FARTO FERNANDES',
   'GARCIA',
   '56.249.258/0001-80',
   'Bárbara e Daniel Entregas Expressas Ltda ',
   '1135073223',
   'empresa@barbara.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '96',
   'NILVA',
   'PINTO',
   'DAMBRÁZ',
   '43.391.088/0001-22',
   'Bento e Caio Vidros ME  ',
   '1139881701',
   'empresa@bento.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '97',
   'PATRICIA',
   '',
   'MIRAPALHETA',
   '77.479.784/0001-07',
   'Roberto e Rayssa Telas ME  ',
   '1135137683',
   'empresa@roberto.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '98',
   'PAULA',
   '',
   'DOS SANTOS',
   '54.363.873/0001-98',
   'Bento e Paulo Comercio de Bebidas Ltda',
   '1139845629',
   'empresa@bento.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '99',
   'PAULA',
   'SIMÃO',
   'DA COSTA  ',
   '72.910.997/0001-28',
   'Carlos e Betina Advocacia Ltda  ',
   '1136350880',
   'empresa@carlos.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '100', 
   'PEDRO',
   '',
   'MEDEIROS',
   '92.465.552/0001-93',
   'Unicode Ltda  ',
   '1128595012',
   'empresa@unicode.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '101',
   'PRISCILA',
   'COSTA',
   'MENESTRINO',
   '58.429.456/0001-51',
   'Batista Camisetas ME  ',
   '1138094683',
   'empresa@batista.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.FORNECEDOR
    (
      FOR_ID,
      FOR_RESPONSAVEL_NOME,
      FOR_RESPONSAVEL_NOMEDOMEIO,
      FOR_RESPONSAVEL_SOBRENOME,
      FOR_CNPJ,
      FOR_RAZAO_SOCIAL,
      FOR_TELEFONE,
      FOR_EMAIL,
      FOR_QTD_UPDATE,
      FOR_DATA_CONTROLE
    )
    VALUES
    (
   '102',
   'RENAISSA',
      NULL,
   'DE OLIVEIRA',
   '66.218.749/0001-18',
   'Pepsico do Brasil Ltda',
   '1129263701',
   'empresa@pepsico.com.br',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  -- ENDERECO FORNECEDOR
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '1',
   '1',
   'Praça Professora Célia Pinheiro Ferreira Alves',
   '08715-340',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '2',
   '2',
   'Praça Romualdo de Souza Brito',
   '08717-110',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '3',
   '3',
   'Praça Rotary',
   '08715-100',
   'Vila Sud Menuci',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '4',
   '4',
   'Praça Sacadura Cabral',
   '08710-450',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '5',
   '5',
   'Praça São Benedito',
   '08710-310',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '6',
   '6',
   'Rua Abner Peixoto de Miranda',
   '08717-800',
   'Jardim das Acácias',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '7',
   '7',
   'Rua Acre',
   '08717-580',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '8',
   '8',
   'Rua Adélia Rapanelli Coccaro',
   '08720-080',
   'Jardim Camila',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '9',
   '9',
   'Rua Adélia Urbano Maritan',
   '08717-500',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '10',
   '10',
   'Rua Adelino Brandão',
   '08840-020',
   'Vila Suissa',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '11',
   '11',
   'Rua Adriano Francisco Salgado',
   '08715-130',
   'Vila Sud Menuci',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '12',
   '12',
   'Rua Afif Nacif Jafet',
   '08770-060',
   'Vila Industrial',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '13',
   '13',
   'Rua Afonso Arinos',
   '08840-360',
   'Vila São Paulo',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '14',
   '14',
   'Rua Afonso Taunay',
   '08720-420',
   'Vila Caputera',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '15',
   '15',
   'Rua Agostinho Dias da Silva',
   '08720-345',
   'Jardim Camila',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '16',
   '16',
   'Rua Agostinho Pupo',
   '08730-450',
   'Lagoa Seca',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '17',
   '17',
   'Rua Albano Rodrigues',
   '08730-331',
   'Alto Ipiranga',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '18',
   '18',
   'Rua Alberto Garcia',
   '08710-290',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '19',
   '19',
   'Rua Alberto Gomes Assumpção',
   '08715-350',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '20',
   '20',
   'Rua Alceu Salvarani',
   '08730-610',
   'Jardim Ivete',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '21',
   '21',
   'Rua Alcides José dos Santos',
   '08738-572',
   'Loteamento Alvorada',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '22',
   '22',
   'Rua Aleixo Costa',
   '08717-080',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '23',
   '23',
   'Rua Aleluia',
   '08840-350',
   'Vila São Paulo',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '24',
   '24',
   'Rua Alfredo Cardoso',
   '08710-280',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '25',
   '25',
   'Rua Alfredo Gomes Loureiro',
   '08738-290',
   'Vila Brasileira',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '26',
   '26',
   'Rua Alice de Souza Franco',
   '08790-630',
   'Vila Nova Socorro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '27',
   '27',
   'Rua Almeida Júnior',
   '08720-460',
   'Vila Caputera',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '28',
   '28',
   'Rua Almirante Barroso',
   '08720-180',
   'Jardim São Francisco',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '29',
   '29',
   'Rua Alpheu Guilhemat',
   '08737-330',
   'Vila São Sebastião',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '30',
   '30',
   'Rua Álvaro Matias',
   '08715-490',
   'Jardim Veneza',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '31',
   '31',
   'Rua Alves Porto',
   '08717-730',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '32',
   '32',
   'Rua Alzira Elizabete Unello',
   '08725-640',
   'Jardim Rubi',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '33',
   '33',
   'Rua Amador Corrêa',
   '08735-220',
   'Chácara das Flores',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '34',
   '34',
   'Rua Amélia Ariza Urbano',
   '08790-640',
   'Vila Nova Socorro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '35',
   '35',
   'Rua Américo Rodrigues Da San Biagio - FEB',
   '08773-160',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '36',
   '36',
   'Rua Ana dos Passos Silva',
   '08738-575',
   'Loteamento Alvorada',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '37',
   '37',
   'Rua Angel Usier Rivas',
   '08717-360',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '38',
   '38',
   'Rua Ângelo Cuzziol',
   '08770-170',
   'Vila Industrial',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '39',
   '39',
   'Rua Ângelo Rizzi',
   '08770-050',
   'Jardim Santa Carolina',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '40',
   '40',
   'Rua Anita Bianco Bovolenta',
   '08738-070',
   'Conjunto Residencial Álvaro Bovolenta',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '41',
   '41',
   'Rua Anita Costa Leite',
   '08717-300',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '42',
   '42',
   'Rua Anna S. Gomes Amorim',
   '08725-230',
   'Conjunto Habitacional Ana Paula',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '43',
   '43',
   'Rua Anselmo Lazzuri',
   '08717-090',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '44',
   '44',
   'Rua Antenor Leite da Cunha',
   '08773-395',
   'Vila Partenio',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '45',
   '45',
   'Rua Antonia Veiga Ruiz',
   '08773-495',
   'Vila Mogilar',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '46',
   '46',
   'Rua Antônia Veiga Ruiz',
   '08773-060',
   'Vila Mogilar',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '47',
   '47',
   'Rua Antônio Barbosa',
   '08715-260',
   'Vila Sud Menuci',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '48',
   '48',
   'Rua Antônio Cordeiro',
   '08715-470',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '49',
   '49',
   'Rua Antônio da Fonseca Coelho',
   '08735-090',
   'Vila Flávio',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '50',
   '50',
   'Rua Antônio da Paz',
   '08773-190',
   'Vila Mogilar',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '51',
   '51',
   'Rua Antônio de Miranda Mello',
   '08717-540',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '52',
   '52',
   'Rua Antônio de Sá',
   '08720-530',
   'Jardim Camila',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '53',
   '53',
   'Rua Antônio Fernandes',
   '08715-540',
   'Alto da Boa Vista',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '54',
   '54',
   'Rua Antônio Fernandes',
   '08767-310',
   'Biritiba Ussu',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '55',
   '55',
   'Rua Antônio Ferreira de Souza',
   '08770-080',
   'Vila Industrial',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '56',
   '56',
   'Rua Antônio Francisco Lisboa',
   '08720-430',
   'Vila Caputera',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '57',
   '57',
   'Rua Antônio Gomiero',
   '08833-140',
   'Residencial Granja Anita',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '58',
   '58',
   'Rua Antônio Graziano',
   '08717-240',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '59',
   '59',
   'Rua Antônio Guido Alberti',
   '08727-040',
   'Cidade Jardim',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '60',
   '60',
   'Rua Antonio Gulin',
   '08735-350',
   'Vila São Francisco',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '61',
   '61',
   'Rua Antônio José de Deus Neto',
   '08727-060',
   'Cidade Jardim',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '62',
   '62',
   'Rua Antonio Luiz Martins',
   '08738-240',
   'Vila São Sebastião',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '63',
   '63',
   'Rua Antônio Melo e Silva',
   '08715-520',
   'Jardim Veneza',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '64',
   '64',
   'Rua Antônio Meyer',
   '08730-150',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '65',
   '65',
   'Rua Antônio Otávio Gomes',
   '08720-320',
   'Jardim Camila',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '66',
   '66',
   'Rua Antônio Pinhal',
   '08715-110',
   'Vila Sud Menuci',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '67',
   '67',
   'Rua Antônio Torquato',
   '08720-470',
   'Vila Caputera',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '68',
   '68',
   'Rua Aprígio de Oliveira',
   '08770-120',
   'Vila Industrial',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '69',
   '69',
   'Rua Archangelo octávio Bechelli',
   '08727-120',
   'Cidade Jardim',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '70',
   '70',
   'Rua Argentina Gonçalves Monsores',
   '08738-150',
   'Conjunto Residencial Álvaro Bovolenta',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '71',
   '71',
   'Rua Aristides Dias de Menezes',
   '08738-020',
   'Vila São Sebastião',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '72',
   '72',
   'Rua Aristides Germano Montagnini',
   '08738-120',
   'Conjunto Habitacional Antônio Bovolenta',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '73',
   '73',
   'Rua Aristóphanes Cataldo Éboli',
   '08790-490',
   'Vila Oliveira',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '74',
   '74',
   'Rua Armando Nicolini',
   '08738-090',
   'Conjunto Residencial Álvaro Bovolenta',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '75',
   '75',
   'Rua Armindo do Prado',
   '08717-820',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '76',
   '76',
   'Rua Armindo Freire',
   '08715-480',
   'Jardim Veneza',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '77',
   '77',
   'Rua Arthur dos Santos',
   '08738-210',
   'Vila São Sebastião',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '78',
   '78',
   'Rua Artur Amaro Gil',
   '08833-120',
   'Residencial Granja Anita',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '79',
   '79',
   'Rua Arujá',
   '08737-310',
   'Alto Ipiranga',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '80',
   '80',
   'Rua Astrogildo Faria',
   '08715-090',
   'Vila Sud Menuci',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '81',
   '81',
   'Rua Augusto Belizário',
   '08738-450',
   'Vila Pomar',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '82',
   '82',
   'Rua Aurora',
   '08840-330',
   'Vila São Paulo',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '83',
   '83',
   'Rua B (Real Park Jd Colégio)',
   '08790-865',
   'Vila Socorro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '84',
   '84',
   'Rua Barão de Jaceguai - até 498/499',
   '08710-160',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '85',
   '85',
   'Rua Barão de Jaceguai - de 500/501 a 998/999',
   '08710-165',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '86',
   '86',
   'Rua Basílio Batalha',
   '08730-090',
   'Vila Vitória',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '87',
   '87',
   'Rua Benedicta Cardoso da Silva',
   '08730-605',
   'Jardim Ivete',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '88',
   '88',
   'Rua Benedicto Alves Campolino',
   '08717-196',
   'Parque Santana',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '89',
   '89',
   'Rua Benedicto Pereira Reis',
   '08773-410',
   'Vila Sarah Avignon',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '90',
   '90',
   'Rua Benedita Berne da Silva',
   '08717-450',
   'Mogi Moderno',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '91',
   '91',
   'Rua Benedito Aparecido Peixoto',
   '08725-250',
   'Conjunto Habitacional Ana Paula',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '92',
   '92',
   'Rua Benedito Cardoso de Camargo',
   '08725-150',
   'Conjunto Habitacional Brás Cubas',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '93',
   '93',
   'Rua Benedito da Silva',
   '08770-180',
   'Vila Industrial',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '94',
   '94',
   'Rua Benedito de Abreu',
   '08770-150',
   'Vila Industrial',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '95',
   '95',
   'Rua Benedito de Aragão Franco',
   '08730-080',
   'Vila Vitória',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '96',
   '96',
   'Rua Benedito de Paula Leite',
   '08735-130',
   'Vila Rubens',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '97',
   '97',
   'Rua Benedito Ferreira de Souza',
   '08730-160',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '98',
   '98',
   'Rua Benedito José de Araújo',
   '08767-335',
   'Biritiba Ussu',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '99',
   '99',
   'Rua Benedito Machado',
   '08730-560',
   'Centro',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '100',
   '100',
   'Rua Benedito Marcondes da Silva',
   '08738-270',
   'Vila Brasileira',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '101',
   '101',
   'Rua Benedito Rodrigues Ferreira',
   '08730-591',
   'Chácara Jafet',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  INSERT
  INTO
    PABLO.ENDERECO_FORNECEDOR
    (
      END_ID,
      END_FOR_ID,
      END_LOGRADOURO,
      END_CEP,
      END_BAIRRO,
      END_CIDADE,
      END_ESTADO,
      END_QTD_UPDATE,
      END_DATA_CONTROLE
    )
    VALUES
    (
   '102',
   '102',
   'Rua Benedito Sérvulo Santana',
   '08735-430',
   'Vila Lavínia',
   'Mogi das Cruzes',
   'SP',
   '0',
      to_date('05/05/19', 'DD/MM/RR')
    );
  -- PRODUTO
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      1,
   'Refrigerante pet Dolly Guaraná 2 litros',
      3.5,
      150,
   ' 06/01/21 ',
      3,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      2,
   'Refrigerante pet Dolly Limão 2 litros',
      3.9,
      200,
   ' 09/03/21 ',
      3,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      3,
   'Refrigerante pet Dolly Cola 2 litros',
      3.1,
      100,
   ' 31/10/20 ',
      3,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      4,
   'Refrigerante pet Coca Cola 2 litros',
      5.8,
      400,
   ' 02/04/21 ',
      2,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      5,
   'Refrigerante pet Coca Cola 3 litros',
      6.9,
      100,
   ' 22/06/20 ',
      2,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      6,
   'Refrigerante pet Sprite 2 litros',
      5.4,
      50,
   ' 03/01/21 ',
      2,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      7,
   'Refrigerante pet Fanta 2 litros',
      5.5,
      80,
   ' 30/10/20 ',
      2,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      8,
   'Cerveja lata Skol 350 Ml',
      1.99,
      600,
   ' 07/09/20 ',
      8,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      9,
   'Cerveja lata Skol 269 Ml',
      2.29,
      900,
   ' 08/12/20 ',
      8,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      10,
   'Cerveja Itaipava 350 Ml',
      1.79,
      600,
   ' 09/08/20 ',
      8,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      11,
   'Refrigerante Pepsi 3,3 litros',
      5.99,
      200,
   ' 23/03/21 ',
      102,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      12,
   'Refrigerante lata Coca Cola 350 Ml',
      2.49,
      100,
   ' 04/09/20 ',
      2,
      1
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      13,
   'Carne bovina filé mignon kilo',
      24.9,
      500,
   ' 02/10/20 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      14,
   'Carne bovina ponta de alcatra kilo',
      19.9,
      800,
   ' 06/06/20 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      15,
   'Carne bovina picanha kilo',
      29.9,
      200,
   ' 04/02/21 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      16,
   'Carne suína picanha kilo',
      27.49,
      100,
   ' 08/11/20 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      17,
   'Carne suína barriga kilo',
      16.39,
      200,
   ' 06/04/21 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      18,
   'Coxa de frango kilo',
      7.9,
      500,
   ' 02/04/21 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      19,
   'Frango resfriado kilo',
      6.9,
      600,
   ' 05/04/20 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      20,
   'Asa de frango kilo',
      4.9,
      800,
   ' 19/01/21 ',
      23,
      2
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      21,
   'Cereal Sucrilhos tradicional 350 gramas',
      8.9,
      400,
   ' 01/05/20 ',
      90,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      22,
   'Cereal Sucrilhos tradicional 700 gramas',
      19.9,
      200,
   ' 20/10/20 ',
      90,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      23,
   'Cereal Sucrilhos chocolate 350 gramas',
      12.9,
      150,
   ' 16/04/21 ',
      90,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      24,
   'Cereal Nescau Ball 400 gramas',
      10.9,
      200,
   ' 22/07/20 ',
      38,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      25,
   'Cereal Sucrilhos tradicional 75 gramas',
      2.9,
      80,
   ' 02/05/21 ',
      90,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      26,
   'Amendoim sem pele a granel',
      0.79,
      1000,
   ' 24/04/21 ',
      93,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      27,
   'Amendoim com pele a granel',
      0.39,
      1500,
   ' 10/06/20 ',
      93,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      28,
   'Amendoim doce a granel',
      0.99,
      2000,
   ' 18/10/20 ',
      93,
      3
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      29,
   'Milho verde enlatado 300 gramas',
      2.59,
      200,
   ' 30/10/20 ',
      19,
      4
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      30,
   'Salsicha enlatada 300 gramas',
      3.29,
      150,
   ' 20/04/20 ',
      19,
      4
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      31,
   'Seleta de legumes enlatada 250 gramas',
      2.99,
      200,
   ' 06/07/20 ',
      19,
      4
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      32,
   'Ervilha enlatada 300 gramas',
      2.49,
      100,
   ' 01/02/21 ',
      19,
      4
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      33,
   'Feijoada enlatada 350 gramas',
      4.49,
      100,
   ' 29/11/20 ',
      19,
      4
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      34,
   'Fiambre enlatado 350 gramas',
      5.49,
      100,
   ' 20/09/20 ',
      19,
      4
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      35,
   'Sardinha enlatada 200 gramas',
      2.39,
      200,
   ' 23/11/20 ',
      19,
      4
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      36,
   'Presunto 100 gramas',
      1.99,
      1000,
   ' 18/12/20 ',
      95,
      5
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      37,
   'Queijo mussarela 100 gramas',
      2.59,
      1000,
   ' 28/09/20 ',
      95,
      5
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      38,
   'Queijo prato 100 gramas',
      2.19,
      1000,
   ' 11/01/21 ',
      95,
      5
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      39,
   'Mortadela defumada 100 gramas',
      1.59,
      1000,
   ' 27/05/21 ',
      95,
      5
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      40,
   'Peito de peru defumado 100 gramas',
      3.39,
      500,
   ' 11/09/20 ',
      95,
      5
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      41,
   'Mortadela tradicional 100 gramas',
      1.2,
      500,
   ' 09/07/20 ',
      95,
      5
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      42,
   'Leite 1 litro',
      2.49,
      600,
   ' 31/01/21 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      43,
   'Achocolatado pronto 1 litro',
      3.59,
      400,
   ' 02/04/21 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      44,
   'Iogurte tradicional 500 gramas',
      3.29,
      300,
   ' 28/01/21 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      45,
   'Iogurte morango 500 gramas',
      3.29,
      300,
   ' 29/01/21 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      46,
   'Iogurte frutas vermelhas 500 gramas',
      3.29,
      300,
   ' 30/03/21 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      47,
   'Achocolatado pronto 200 ml',
      0.89,
      400,
   ' 22/09/20 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      48,
   'Bebida láctea de vitamina 200 ml',
      0.89,
      300,
   ' 20/06/20 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      49,
   'Bebida láctea de morango 200 ml',
      0.99,
      150,
   ' 22/06/20 ',
      67,
      6
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      50,
   'Detergente líquido lavanda 150 ml',
      1.19,
      200,
   ' 25/05/20 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      51,
   'Detergente líquido limão 150 ml',
      1.19,
      200,
   ' 07/05/21 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      52,
   'Detergente líquido lava-louça 150 ml',
      1.19,
      200,
   ' 09/08/20 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      53,
   'Desinfetante líquido lavanda 1 litro',
      4.29,
      400,
   ' 14/01/21 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      54,
   'Sabão em barras 1 kilo',
      5.59,
      500,
   ' 15/02/21 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      55,
   'Sabão em pó 1 kilo',
      6.29,
      500,
   ' 07/03/21 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      56,
   'Amaciante flores do campo 1 litro',
      5.9,
      600,
   ' 23/02/21 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      57,
   'Removedor neutro 500 ml',
      4.19,
      300,
   ' 02/12/20 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      58,
   'Cera de piso neutra 500 gramas',
      7.9,
      200,
   ' 13/05/21 ',
      14,
      7
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      59,
   'Creme dental menta 80 gramas',
      2.59,
      200,
   ' 04/04/21 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      60,
   'Creme dental com flúor 80 gramas',
      2.9,
      200,
   ' 30/12/20 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      61,
   'Creme dental infantil sem flúor 45 gramas',
      1.9,
      200,
   ' 19/06/20 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      62,
   'Creme dental tradicional 80 gramas',
      2.29,
      200,
   ' 29/07/20 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      63,
   'Sabonete líquido doce flores 300 ml',
      3.49,
      100,
   ' 09/04/21 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      64,
   'Sabonete em barra neutro 30 gramas',
      0.69,
      100,
   ' 12/05/21 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      65,
   'Sabonete em barra girassol 30 gramas',
      0.69,
      100,
   ' 23/11/20 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      66,
   'Sabonete em barra flores vermelhas 30 gramas',
      0.69,
      100,
   ' 22/09/20 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      67,
   'Sabonete íntimo feminino pétalas de rosas 350 ml',
      6.79,
      50,
   ' 17/03/21 ',
      47,
      8
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      68,
   'Sardinha kilo',
      2.39,
      500,
   ' 09/12/20 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      69,
   'Bagre kilo',
      4.49,
      500,
   ' 15/12/20 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      70,
   'Tainha kilo',
      5.59,
      500,
   ' 01/08/20 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      71,
   'Bacalhau kilo',
      34.9,
      200,
   ' 03/01/21 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      72,
   'Cação kilo',
      15.9,
      200,
   ' 01/01/21 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      73,
   'Traíra kilo',
      6.65,
      400,
   ' 07/04/21 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      74,
   'Tilápia kilo',
      5.49,
      300,
   ' 18/11/20 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      75,
   'Lambari kilo',
      9.9,
      250,
   ' 22/08/20 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      76,
   'Piranha kilo',
      4.9,
      100,
   ' 10/04/21 ',
      63,
      9
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      77,
   'Abacate kilo',
      2.9,
      200,
   ' 22/06/21 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      78,
   'Manga Tommy kilo',
      3.29,
      300,
   ' 27/10/20 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      79,
   'Mamão kilo',
      4.18,
      400,
   ' 27/11/20 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      80,
   'Pimentão verde kilo',
      4.29,
      100,
   ' 10/07/21 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      81,
   'Melancia unidade',
      7.9,
      150,
   ' 08/03/21 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      82,
   'Maçã gala kilo',
      3.85,
      200,
   ' 13/06/20 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      83,
   'Alface unidade',
      2.79,
      350,
   ' 06/10/20 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      84,
   'Limão kilo',
      0.89,
      200,
   ' 19/06/20 ',
      56,
      10
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      85,
   'Arroz 1 kilo',
      5.49,
      1000,
   ' 20/07/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      86,
   'Arroz 5 kilos',
      12.9,
      1000,
   ' 15/12/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      87,
   'Feijão 1 kilo',
      8.9,
      1000,
   ' 15/06/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      88,
   'Massa para macarrão 500 gramas',
      6.59,
      500,
   ' 21/08/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      89,
   'Massa para lasanha 500 gramas',
      5.49,
      600,
   ' 07/11/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      90,
   'Açúcar 1 kilo',
      3.49,
      800,
   ' 08/10/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      91,
   'Sal 1 kilo',
      2.45,
      900,
   ' 10/07/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      92,
   'Pó para café 500 gramas',
      8.9,
      300,
   ' 10/02/21 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      93,
   'Massa de bolo 500 gramas',
      6.19,
      350,
   ' 03/08/20 ',
      64,
      11
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      94,
   'Pão francês kilo',
      9.9,
      300,
   ' 25/04/21 ',
      58,
      12
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      95,
   'Bolo de fubá unidade',
      14.9,
      100,
   ' 27/10/20 ',
      58,
      12
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      96,
   'Pão carteira (doce) unidade',
      0.3,
      600,
   ' 03/06/21 ',
      58,
      12
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      97,
   'Pão de mel unidade',
      0.6,
      200,
   ' 15/07/21 ',
      58,
      12
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      98,
   'Sonho (doce)',
      1.25,
      300,
   ' 10/11/20 ',
      58,
      12
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      99,
   'Mini-salgados (coxinha, risole, esfiha) kilo',
      16.89,
      600,
   ' 30/10/20 ',
      58,
      12
    );
  INSERT
  INTO
    PABLO.PRODUTO
    (
      pro_id,
      pro_descricao,
      pro_preco,
      pro_quantidade,
      pro_data_vencimento,
      pro_for_id,
      pro_cat_id
    )
    VALUES
    (
      100,
   'Bolo recheado de chocolate kilo',
      25.9,
      200,
   ' 10/09/20 ',
      58,
      12
    );
  -- INSERINDO NO OPERA_PDV
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      1, 
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      2,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      3,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      4,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      5,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      6,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      7,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      8,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      9,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      10,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      11,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      12,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      13,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      14,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      15,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      16,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      17,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      18,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      19,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      20,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      21,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      22,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      23,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      24,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      25,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      26,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      27,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      28,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      29,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      30,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      31,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      32,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      33,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      34,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      35,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      36,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      37,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      38,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      39,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      40,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      41,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      42,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      43,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      44,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      45,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      46,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      47,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      48,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      49,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      50,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      51,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      52,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      53,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      54,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      55,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      56,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      57,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      58,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      59,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 08/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 08/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      60,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      61,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      62,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      63,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      64,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      65,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      66,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      67,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      68,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      69,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      70,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      71,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      72,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      73,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      74,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 09/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 09/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      75,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      76,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      77,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      78,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      79,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      80,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      81,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      82,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      83,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      84,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      85,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      86,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      87,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      88,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      89,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 10/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 10/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      90,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      91,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      92,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      93,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      94,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      95,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      96,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      97,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      98,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      99,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      100,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      101,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      102,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      103,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      104,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 11/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 11/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      105,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      106,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      107,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      108,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      109,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      110,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      111,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      1,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      2,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      3,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      4,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      5,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      6,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      7,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      8,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 12/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 12/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      9,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      10,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      11,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      12,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      13,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      14,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      15,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      16,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      17,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      18,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      19,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      20,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      21,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      22,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      23,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 13/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 13/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      24,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      25,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      26,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      27,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      28,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      29,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      30,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      31,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      32,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      33,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      34,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      35,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      36,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      37,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      38,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 14/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 14/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      39,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      40,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      41,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      42,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      43,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      44,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      45,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      46,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      47,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      48,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      49,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      50,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      51,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      52,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      53,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 15/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 15/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      54,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      55,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      56,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      57,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      58,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      59,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      60,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      61,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      62,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      63,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      64,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      65,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      66,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      67,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      68,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 16/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 16/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      69,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      70,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      71,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      72,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      73,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      74,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      75,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      76,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      77,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      78,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      79,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      80,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      81,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      82,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      83,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 17/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 17/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      84,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      85,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      86,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      87,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      88,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      89,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      90,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      91,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      92,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      93,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      94,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      95,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      96,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      97,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      98,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 18/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 18/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      99,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      100,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      101,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      102,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      103,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      104,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      105,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      106,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      107,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      108,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      109,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      110,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      111,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      1,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      2,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 19/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 19/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      3,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      4,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      5,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      6,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      7,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      8,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      9,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      10,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      11,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      12,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      13,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      14,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      15,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      16,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      17,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 20/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 20/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      18,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      19,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      20,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      21,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      22,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      23,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      24,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      25,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      26,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      27,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      28,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      29,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      30,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      31,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      32,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 21/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 21/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      33,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      34,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      35,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      36,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      37,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      38,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      39,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      40,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      41,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      42,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      43,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      44,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      45,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      46,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      47,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 22/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 22/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      48,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      49,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      50,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      51,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      52,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      53,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      54,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      55,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      56,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      57,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      58,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      59,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      60,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      61,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      62,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 23/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 23/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      63,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      64,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      65,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      66,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      67,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      68,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      69,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      70,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      71,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      72,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      73,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      74,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      75,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      76,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      77,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 24/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 24/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      78,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      79,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      80,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      81,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      82,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      83,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      84,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      85,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      86,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      87,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      88,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      89,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      90,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      91,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      92,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 25/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 25/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      93,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      94,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      95,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      96,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      97,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      98,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      99,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      100,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      101,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      102,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      103,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      104,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      105,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      106,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      107,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 26/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 26/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      108,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      109,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      110,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      111,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      1,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      2,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      3,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      4,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      5,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      6,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      7,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      8,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      9,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      10,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      11,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 27/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 27/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      12,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      13,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      14,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      15,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      16,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      17,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      18,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      19,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      20,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      21,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      22,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      23,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      24,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      25,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      26,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 28/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 28/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      27,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      28,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      29,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      30,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      31,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      32,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      33,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      34,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      35,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      36,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      37,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      38,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      39,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      40,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      41,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 29/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 29/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      42,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      43,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      44,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      45,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      46,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      47,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      48,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      49,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      50,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      51,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      52,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      53,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      54,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      55,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      56,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 30/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 30/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      57,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      58,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      59,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      60,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      61,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      62,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      63,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      64,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      65,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      66,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      67,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      68,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      69,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      70,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      71,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 31/01/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 31/01/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      72,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      73,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      74,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      75,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      76,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      77,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      78,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      79,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      80,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      81,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      82,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      83,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      84,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      85,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      86,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 01/02/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 01/02/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      87,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      88,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      89,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      90,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      91,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      92,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      93,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      94,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      95,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      96,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      97,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      98,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      99,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      100,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      101,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 02/02/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 02/02/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      102,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      103,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      104,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      105,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      106,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      107,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      108,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      109,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      110,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      111,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      1,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      2,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      3,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      4,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      5,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 03/02/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 03/02/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      6,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      7,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      8,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      9,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      10,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      11,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      12,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      13,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      14,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      15,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      16,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      17,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      18,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      19,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      20,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 04/02/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 04/02/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      21,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      22,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      23,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      24,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      25,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      26,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      27,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      28,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      29,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      30,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      31,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      32,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      33,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      34,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      35,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 05/02/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 05/02/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      36,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      37,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      38,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      39,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      40,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      41,
      5
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      42,
      6
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      43,
      7
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      44,
      8
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      45,
      9
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      46,
      10
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      47,
      11
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      48,
      12
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      49,
      13
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 09:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 18:00 ', 'DD/MM/YYYY  HH24:MI' ),
      50,
      14
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 06/02/2019 14:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 06/02/2019 22:00 ', 'DD/MM/YYYY  HH24:MI' ),
      51,
      15
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      52,
      1
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      53,
      2
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      54,
      3
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      55,
      4
    );
  INSERT
  INTO
    PABLO.OPERA_PDV
    (
      ope_data_entrada,
      ope_data_saida,
      ope_fnc_id,
      ope_pdv_id
    )
    VALUES
    (
      TO_DATE(' 07/02/2019 08:00 ', 'DD/MM/YYYY  HH24:MI' ),
      TO_DATE(' 07/02/2019 17:00 ', 'DD/MM/YYYY  HH24:MI' ),
      56,
      5
    );
  -- INSERINDO NO COMPRA
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (1, TO_DATE('03/11/2018 15:27', 'DD-MM-YYYY  HH24:MI:SS'), 237.49, 6, 79);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (2, TO_DATE('04/11/2018 09:49', 'DD-MM-YYYY  HH24:MI:SS'), 179.41, 9, 26);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (3, TO_DATE('05/11/2018 13:35', 'DD-MM-YYYY  HH24:MI:SS'), 39.71, 12, 65);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (4, TO_DATE('06/11/2018 19:03', 'DD-MM-YYYY  HH24:MI:SS'), 85.50, 10, 60);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (5, TO_DATE('07/11/2018 20:51', 'DD-MM-YYYY  HH24:MI:SS'), 127.35, 3, 45);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (6, TO_DATE('08/11/2018 12:54', 'DD-MM-YYYY  HH24:MI:SS'), 144.70, 14, 74);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (7, TO_DATE('09/11/2018 21:09', 'DD-MM-YYYY  HH24:MI:SS'), 186.4, 12, 53);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (8, TO_DATE('10/11/2018 12:31', 'DD-MM-YYYY  HH24:MI:SS'), 274.25, 15, 70);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (9, TO_DATE('11/11/2018 21:28', 'DD-MM-YYYY  HH24:MI:SS'), 138.42, 7, 29);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (10, TO_DATE('12/11/2018 11:38', 'DD-MM-YYYY  HH24:MI:SS'), 35.3, 7, 98);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (11, TO_DATE('13/11/2018 18:48', 'DD-MM-YYYY  HH24:MI:SS'), 209.84, 8, 69);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (12, TO_DATE('14/11/2018 14:15', 'DD-MM-YYYY  HH24:MI:SS'), 55.80, 15, 98);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (13, TO_DATE('15/11/2018 12:36', 'DD-MM-YYYY  HH24:MI:SS'), 10.19, 7, 86);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (14, TO_DATE('16/11/2018 18:09', 'DD-MM-YYYY  HH24:MI:SS'), 114.86, 15, 70);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (15, TO_DATE('17/11/2018 14:02', 'DD-MM-YYYY  HH24:MI:SS'), 51.99, 2, 53);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (16, TO_DATE('18/11/2018 13:02', 'DD-MM-YYYY  HH24:MI:SS'), 183.31, 10, 21);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (17, TO_DATE('19/11/2018 19:12', 'DD-MM-YYYY  HH24:MI:SS'), 204.78, 2, 82);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (18, TO_DATE('20/11/2018 18:36', 'DD-MM-YYYY  HH24:MI:SS'), 12.20, 5, 60);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (19, TO_DATE('21/11/2018 14:57', 'DD-MM-YYYY  HH24:MI:SS'), 191.37, 9, 8);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (20, TO_DATE('22/11/2018 22:39', 'DD-MM-YYYY  HH24:MI:SS'), 7.62, 6, 111);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (21, TO_DATE('23/11/2018 18:25', 'DD-MM-YYYY  HH24:MI:SS'), 42.47, 13, 40);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (22, TO_DATE('24/11/2018 15:28', 'DD-MM-YYYY  HH24:MI:SS'), 289.80, 8, 21);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (23, TO_DATE('25/11/2018 14:54', 'DD-MM-YYYY  HH24:MI:SS'), 176.62, 9, 102);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (24, TO_DATE('26/11/2018 22:40', 'DD-MM-YYYY  HH24:MI:SS'), 137.82, 4, 11);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (25, TO_DATE('27/11/2018 09:11', 'DD-MM-YYYY  HH24:MI:SS'), 172.16, 5, 22);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (26, TO_DATE('28/11/2018 17:58', 'DD-MM-YYYY  HH24:MI:SS'), 93.69, 7, 88);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (27, TO_DATE('29/11/2018 08:08', 'DD-MM-YYYY  HH24:MI:SS'), 45.64, 12, 23);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (28, TO_DATE('30/11/2018 21:24', 'DD-MM-YYYY  HH24:MI:SS'), 10.60, 4, 92);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (29, TO_DATE('01/12/2018 15:07', 'DD-MM-YYYY  HH24:MI:SS'), 65.48, 2, 49);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (30, TO_DATE('02/12/2018 10:48', 'DD-MM-YYYY  HH24:MI:SS'), 69.17, 2, 38);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (31, TO_DATE('03/12/2018 12:46', 'DD-MM-YYYY  HH24:MI:SS'), 249.15, 14, 78);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (32, TO_DATE('04/12/2018 20:38', 'DD-MM-YYYY  HH24:MI:SS'), 168.28, 14, 70);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (33, TO_DATE('05/12/2018 09:37', 'DD-MM-YYYY  HH24:MI:SS'), 288.80, 7, 51);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (34, TO_DATE('06/12/2018 09:30', 'DD-MM-YYYY  HH24:MI:SS'), 250.4, 15, 27);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (35, TO_DATE('07/12/2018 20:27', 'DD-MM-YYYY  HH24:MI:SS'), 169.96, 4, 54);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (36, TO_DATE('08/12/2018 08:24', 'DD-MM-YYYY  HH24:MI:SS'), 134.63, 9, 11);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (37, TO_DATE('09/12/2018 12:28', 'DD-MM-YYYY  HH24:MI:SS'), 140.60, 8, 94);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (38, TO_DATE('10/12/2018 20:39', 'DD-MM-YYYY  HH24:MI:SS'), 186.14, 7, 89);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (39, TO_DATE('11/12/2018 12:10', 'DD-MM-YYYY  HH24:MI:SS'), 96.40, 13, 91);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (40, TO_DATE('12/12/2018 15:35', 'DD-MM-YYYY  HH24:MI:SS'), 38.89, 14, 82);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (41, TO_DATE('13/12/2018 14:37', 'DD-MM-YYYY  HH24:MI:SS'), 284.96, 2, 22);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (42, TO_DATE('14/12/2018 18:03', 'DD-MM-YYYY  HH24:MI:SS'), 5.87, 6, 39);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (43, TO_DATE('15/12/2018 13:24', 'DD-MM-YYYY  HH24:MI:SS'), 183.70, 1, 21);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (44, TO_DATE('16/12/2018 20:54', 'DD-MM-YYYY  HH24:MI:SS'), 237.92, 4, 3);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (45, TO_DATE('17/12/2018 08:35', 'DD-MM-YYYY  HH24:MI:SS'), 198.29, 5, 56);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (46, TO_DATE('18/12/2018 09:27', 'DD-MM-YYYY  HH24:MI:SS'), 76.79, 4, 59);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (47, TO_DATE('19/12/2018 11:26', 'DD-MM-YYYY  HH24:MI:SS'), 80.4, 1, 50);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (48, TO_DATE('20/12/2018 10:31', 'DD-MM-YYYY  HH24:MI:SS'), 128.35, 11, 52);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (49, TO_DATE('21/12/2018 13:36', 'DD-MM-YYYY  HH24:MI:SS'), 120.13, 7, 59);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (50, TO_DATE('22/12/2018 22:22', 'DD-MM-YYYY  HH24:MI:SS'), 248.51, 6, 41);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (51, TO_DATE('23/12/2018 15:04', 'DD-MM-YYYY  HH24:MI:SS'), 296.84, 9, 55);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (52, TO_DATE('24/12/2018 08:19', 'DD-MM-YYYY  HH24:MI:SS'), 244.30, 12, 19);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (53, TO_DATE('25/12/2018 20:00', 'DD-MM-YYYY  HH24:MI:SS'), 295.30, 2, 56);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (54, TO_DATE('26/12/2018 15:28', 'DD-MM-YYYY  HH24:MI:SS'), 43.4, 4, 50);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (55, TO_DATE('27/12/2018 08:00', 'DD-MM-YYYY  HH24:MI:SS'), 203.35, 6, 12);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (56, TO_DATE('28/12/2018 21:37', 'DD-MM-YYYY  HH24:MI:SS'), 57.38, 9, 63);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (57, TO_DATE('29/12/2018 19:34', 'DD-MM-YYYY  HH24:MI:SS'), 248.83, 12, 38);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (58, TO_DATE('30/12/2018 11:39', 'DD-MM-YYYY  HH24:MI:SS'), 195.32, 2, 42);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (59, TO_DATE('31/12/2018 19:06', 'DD-MM-YYYY  HH24:MI:SS'), 161.39, 11, 92);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (60, TO_DATE('01/01/2019 22:37', 'DD-MM-YYYY  HH24:MI:SS'), 129.96, 13, 46);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (61, TO_DATE('02/01/2019 14:31', 'DD-MM-YYYY  HH24:MI:SS'), 154.6, 10, 39);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (62, TO_DATE('03/01/2019 17:37', 'DD-MM-YYYY  HH24:MI:SS'), 292.88, 4, 62);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (63, TO_DATE('04/01/2019 15:33', 'DD-MM-YYYY  HH24:MI:SS'), 133.6, 12, 82);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (64, TO_DATE('05/01/2019 13:19', 'DD-MM-YYYY  HH24:MI:SS'), 217.16, 2, 86);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (65, TO_DATE('06/01/2019 18:32', 'DD-MM-YYYY  HH24:MI:SS'), 290.61, 8, 48);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (66, TO_DATE('07/01/2019 09:04', 'DD-MM-YYYY  HH24:MI:SS'), 268.17, 8, 72);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (67, TO_DATE('08/01/2019 16:53', 'DD-MM-YYYY  HH24:MI:SS'), 269.4, 4, 93);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (68, TO_DATE('09/01/2019 09:31', 'DD-MM-YYYY  HH24:MI:SS'), 286.99, 14, 89);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (69, TO_DATE('10/01/2019 10:11', 'DD-MM-YYYY  HH24:MI:SS'), 184.11, 5, 23);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (70, TO_DATE('11/01/2019 20:09', 'DD-MM-YYYY  HH24:MI:SS'), 212.15, 15, 3);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (71, TO_DATE('12/01/2019 12:03', 'DD-MM-YYYY  HH24:MI:SS'), 283.72, 10, 14);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (72, TO_DATE('13/01/2019 17:20', 'DD-MM-YYYY  HH24:MI:SS'), 167.41, 6, 16);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (73, TO_DATE('14/01/2019 12:11', 'DD-MM-YYYY  HH24:MI:SS'), 124.71, 12, 106);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (74, TO_DATE('15/01/2019 19:06', 'DD-MM-YYYY  HH24:MI:SS'), 27.20, 15, 50);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (75, TO_DATE('16/01/2019 09:06', 'DD-MM-YYYY  HH24:MI:SS'), 259.3, 9, 31);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (76, TO_DATE('17/01/2019 22:41', 'DD-MM-YYYY  HH24:MI:SS'), 178.90, 6, 39);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (77, TO_DATE('18/01/2019 16:54', 'DD-MM-YYYY  HH24:MI:SS'), 269.99, 7, 88);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (78, TO_DATE('19/01/2019 15:43', 'DD-MM-YYYY  HH24:MI:SS'), 198.19, 1, 92);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (79, TO_DATE('20/01/2019 18:25', 'DD-MM-YYYY  HH24:MI:SS'), 220.89, 5, 5);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (80, TO_DATE('21/01/2019 10:01', 'DD-MM-YYYY  HH24:MI:SS'), 298.43, 15, 11);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (81, TO_DATE('22/01/2019 13:52', 'DD-MM-YYYY  HH24:MI:SS'), 78.74, 4, 16);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (82, TO_DATE('23/01/2019 15:51', 'DD-MM-YYYY  HH24:MI:SS'), 259.85, 2, 99);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (83, TO_DATE('24/01/2019 10:37', 'DD-MM-YYYY  HH24:MI:SS'), 222.94, 6, 2);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (84, TO_DATE('25/01/2019 20:35', 'DD-MM-YYYY  HH24:MI:SS'), 164.90, 4, 60);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (85, TO_DATE('26/01/2019 13:42', 'DD-MM-YYYY  HH24:MI:SS'), 298.99, 15, 69);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (86, TO_DATE('27/01/2019 08:04', 'DD-MM-YYYY  HH24:MI:SS'), 72.96, 4, 19);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (87, TO_DATE('28/01/2019 22:34', 'DD-MM-YYYY  HH24:MI:SS'), 214.8, 13, 65);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (88, TO_DATE('29/01/2019 19:54', 'DD-MM-YYYY  HH24:MI:SS'), 73.64, 14, 41);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (89, TO_DATE('30/01/2019 12:20', 'DD-MM-YYYY  HH24:MI:SS'), 271.60, 3, 73);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (90, TO_DATE('31/01/2019 08:23', 'DD-MM-YYYY  HH24:MI:SS'), 251.76, 5, 52);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (91, TO_DATE('01/02/2019 13:45', 'DD-MM-YYYY  HH24:MI:SS'), 199.79, 11, 57);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (92, TO_DATE('02/02/2019 18:31', 'DD-MM-YYYY  HH24:MI:SS'), 264.74, 1, 58);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (93, TO_DATE('03/02/2019 12:03', 'DD-MM-YYYY  HH24:MI:SS'), 170.38, 2, 28);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (94, TO_DATE('04/02/2019 10:16', 'DD-MM-YYYY  HH24:MI:SS'), 68.7, 3, 65);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (95, TO_DATE('05/02/2019 11:34', 'DD-MM-YYYY  HH24:MI:SS'), 53.31, 3, 97);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (96, TO_DATE('06/02/2019 20:20', 'DD-MM-YYYY  HH24:MI:SS'), 14.88, 7, 19);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (97, TO_DATE('07/02/2019 15:39', 'DD-MM-YYYY  HH24:MI:SS'), 32.57, 13, 91);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (98, TO_DATE('08/02/2019 20:06', 'DD-MM-YYYY  HH24:MI:SS'), 185.33, 1, 21);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (99, TO_DATE('09/02/2019 10:02', 'DD-MM-YYYY  HH24:MI:SS'), 295.27, 3, 99);
INSERT INTO PABLO.COMPRA (cmp_id, cmp_data, cmp_valor_total, cmp_pdv_id, cmp_fnc_id) VALUES (100, TO_DATE('10/02/2019 14:28', 'DD-MM-YYYY  HH24:MI:SS'), 10.81, 5, 46);


  -- INSERINDO NO ITENS_COMPRA
 Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '86', '1');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '2', '1');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '3', '1');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '4', '1');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '5', '1');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '6', '2');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '7', '2');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '8', '2');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '9', '2');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '86', '2');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '11', '3');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '12', '3');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '13', '3');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '14', '3');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '15', '3');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '16', '4');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '17', '4');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '18', '4');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '19', '4');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '20', '4');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '21', '5');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '22', '5');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '23', '5');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '24', '5');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '25', '5');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '26', '6');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '27', '6');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '28', '6');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '29', '6');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '86', '6');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '31', '7');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '32', '7');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '33', '7');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '34', '7');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '35', '7');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '36', '8');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '37', '8');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '38', '8');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '39', '8');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '40', '8');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '41', '9');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '42', '9');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '43', '9');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '44', '9');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '45', '9');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '46', '10');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '86', '10');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '48', '10');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '49', '10');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '50', '10');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '51', '11');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '52', '11');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '53', '11');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '54', '11');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '55', '11');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '56', '12');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '57', '12');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '58', '12');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '59', '12');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '60', '12');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '86', '13');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '62', '13');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '63', '13');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '64', '13');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '65', '13');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '66', '14');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '67', '14');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '68', '14');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '69', '14');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '70', '14');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '71', '15');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '72', '15');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '73', '15');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '74', '15');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '75', '15');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '76', '16');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '77', '16');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '78', '16');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '79', '16');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '80', '16');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '86', '17');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '82', '17');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '83', '17');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '84', '17');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '85', '17');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '86', '18');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '87', '18');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '88', '18');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '89', '18');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '90', '18');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '91', '19');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '86', '19');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '93', '19');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '94', '19');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '95', '19');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '96', '19');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '97', '20');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '98', '20');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '99', '20');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '100', '20');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '1', '20');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '2', '21');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '3', '21');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '4', '21');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '5', '21');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '6', '21');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '7', '22');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '8', '22');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '86', '22');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '10', '22');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '11', '22');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '12', '23');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '13', '23');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '14', '23');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '15', '23');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '16', '23');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '17', '24');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '18', '24');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '19', '24');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '20', '24');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '21', '24');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '22', '25');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '23', '25');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '24', '25');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '25', '25');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '26', '25');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '27', '26');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '28', '26');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '29', '26');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '30', '26');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '31', '26');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '32', '27');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '33', '27');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '34', '27');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '35', '27');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '36', '27');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '37', '28');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '38', '28');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '39', '28');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '40', '28');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '41', '28');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '42', '29');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '43', '29');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '44', '29');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '45', '29');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '46', '29');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '47', '30');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '48', '30');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '49', '30');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '50', '30');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '51', '30');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '52', '31');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '53', '31');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '54', '31');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '55', '31');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '56', '31');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '57', '32');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '58', '32');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '59', '32');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '60', '32');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '61', '32');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '62', '33');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '63', '33');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '64', '33');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '65', '33');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '66', '33');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '67', '34');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '68', '34');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '69', '34');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '70', '34');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '71', '34');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '72', '35');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '73', '35');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '74', '35');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '75', '35');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '76', '35');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '77', '36');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '78', '36');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '79', '36');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '80', '36');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '81', '36');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '82', '37');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '83', '37');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '84', '37');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '85', '37');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '86', '37');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '87', '38');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '88', '38');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '89', '38');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '90', '38');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '91', '38');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '92', '39');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '93', '39');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '94', '39');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '95', '39');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '96', '39');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '97', '40');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '98', '40');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '99', '40');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '100', '40');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '1', '40');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '2', '41');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '3', '41');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '4', '41');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '5', '41');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '6', '41');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '7', '42');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '8', '42');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '9', '42');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '10', '42');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '11', '42');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '12', '43');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '13', '43');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '14', '43');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '15', '43');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '16', '43');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '17', '44');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '18', '44');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '19', '44');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '20', '44');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '21', '44');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '22', '45');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '23', '45');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '24', '45');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '25', '45');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '26', '45');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '27', '46');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '28', '46');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '29', '46');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '30', '46');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '31', '46');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '32', '47');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '33', '47');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '34', '47');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '35', '47');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '36', '47');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '37', '48');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '38', '48');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '39', '48');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '40', '48');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '41', '48');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '42', '49');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '43', '49');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '44', '49');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '45', '49');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '46', '49');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '47', '50');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '48', '50');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '49', '50');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '50', '50');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '51', '50');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '52', '51');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '53', '51');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '54', '51');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '55', '51');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '56', '51');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '57', '52');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '58', '52');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '59', '52');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '60', '52');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '61', '52');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '62', '53');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '63', '53');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '64', '53');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '65', '53');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '66', '53');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '67', '54');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '68', '54');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '69', '54');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '70', '54');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '71', '54');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '72', '55');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '73', '55');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '74', '55');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '75', '55');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '76', '55');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '77', '56');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '78', '56');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '79', '56');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '80', '56');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '81', '56');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '82', '57');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '83', '57');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '84', '57');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '85', '57');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '86', '57');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '87', '58');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '88', '58');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '89', '58');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '90', '58');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '91', '58');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '92', '59');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '93', '59');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '94', '59');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '95', '59');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '96', '59');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '97', '60');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '98', '60');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '99', '60');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '100', '60');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '1', '60');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '2', '61');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '3', '61');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '4', '61');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '5', '61');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '6', '61');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '7', '62');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '8', '62');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '9', '62');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '10', '62');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '11', '62');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '12', '63');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '13', '63');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '14', '63');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '15', '63');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '16', '63');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '17', '64');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '18', '64');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '19', '64');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '20', '64');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '21', '64');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '22', '65');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '23', '65');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '24', '65');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '25', '65');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '26', '65');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '27', '66');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '28', '66');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '29', '66');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '30', '66');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '31', '66');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '32', '67');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '33', '67');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '34', '67');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '35', '67');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '36', '67');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '37', '68');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '38', '68');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '39', '68');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '40', '68');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '41', '68');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '42', '69');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '43', '69');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '44', '69');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '45', '69');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '46', '69');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '47', '70');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '48', '70');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '49', '70');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '50', '70');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '51', '70');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '52', '71');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '53', '71');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '54', '71');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '55', '71');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '56', '71');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '57', '72');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '58', '72');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '59', '72');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '60', '72');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '61', '72');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '62', '73');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '63', '73');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '64', '73');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '65', '73');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '66', '73');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '67', '74');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '68', '74');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '69', '74');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '70', '74');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '71', '74');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '72', '75');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '73', '75');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '74', '75');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '75', '75');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '76', '75');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '77', '76');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '78', '76');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '79', '76');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '80', '76');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '81', '76');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '82', '77');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '83', '77');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '84', '77');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '85', '77');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '86', '77');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '87', '78');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '88', '78');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '89', '78');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '90', '78');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '91', '78');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '92', '79');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '93', '79');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '94', '79');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '95', '79');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '96', '79');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '97', '80');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '98', '80');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '99', '80');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '100', '80');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '1', '80');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '2', '81');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '3', '81');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '4', '81');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '5', '81');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '6', '81');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '7', '82');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '8', '82');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '9', '82');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '10', '82');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '11', '82');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '12', '83');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '13', '83');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '14', '83');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '15', '83');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '16', '83');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '17', '84');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '18', '84');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '19', '84');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '20', '84');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '21', '84');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '22', '85');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '23', '85');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '24', '85');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '25', '85');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '26', '85');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '27', '86');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '28', '86');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '29', '86');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '30', '86');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '31', '86');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '32', '87');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '33', '87');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '34', '87');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '35', '87');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '36', '87');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '37', '88');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '38', '88');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '39', '88');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '40', '88');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '41', '88');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '42', '89');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '43', '89');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '44', '89');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '45', '89');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '46', '89');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '47', '90');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '48', '90');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '49', '90');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '50', '90');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '51', '90');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '52', '91');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '53', '91');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '54', '91');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '55', '91');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '56', '91');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '57', '92');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '58', '92');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '59', '92');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '60', '92');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '61', '92');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '62', '93');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '63', '93');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '64', '93');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '65', '93');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '66', '93');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '67', '94');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '68', '94');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '69', '94');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '70', '94');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '71', '94');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '72', '95');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '73', '95');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '74', '95');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '75', '95');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '76', '95');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '77', '96');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '78', '96');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '79', '96');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '80', '96');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '81', '96');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '82', '97');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '83', '97');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '84', '97');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '85', '97');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('6', '86', '97');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '87', '98');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '88', '98');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '89', '98');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '90', '98');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '91', '98');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '92', '99');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '93', '99');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '94', '99');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('1', '95', '99');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('4', '96', '99');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '97', '100');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('5', '98', '100');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('3', '99', '100');
Insert into PABLO.ITENS_COMPRA (ITC_QUANTIDADE,ITC_PRO_ID,ITC_CMP_ID) values ('2', '100', '100');

  -- INSERINDO NO PAGAMENTO
  
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (1, 1, 81.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (2, 1, 257.91);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (3, 1, 3.82);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (4, 1, 112.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (5, 1, 286.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (6, 1, 167.43);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (7, 1, 40.91);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (8, 1, 106.41);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (9, 1, 222.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (10, 1, 247.80);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (11, 1, 79.51);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (12, 1, 99.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (13, 1, 187.9);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (14, 1, 152.86);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (15, 1, 22.55);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (16, 1, 157.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (17, 1, 29.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (18, 1, 71.22);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (19, 1, 294.23);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (20, 1, 285.3);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (21, 1, 264.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (22, 1, 13.28);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (23, 1, 159.22);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (24, 1, 25.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (25, 1, 140.99);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (26, 1, 271.38);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (27, 1, 93.90);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (28, 1, 24.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (29, 1, 98.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (30, 1, 141.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (31, 1, 169.45);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (32, 1, 187.41);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (33, 1, 279.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (34, 1, 44.4);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (35, 1, 243.38);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (36, 1, 76.17);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (37, 1, 230.12);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (38, 1, 106.38);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (39, 2, 65.69);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (40, 2, 107.89);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (41, 2, 212.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (42, 2, 239.40);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (43, 2, 288.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (44, 2, 67.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (45, 2, 198.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (46, 2, 174.77);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (47, 2, 60.79);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (48, 2, 256.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (49, 2, 249.95);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (50, 2, 197.26);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (51, 2, 285.77);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (52, 2, 44.4);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (53, 2, 154.94);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (54, 2, 280.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (55, 2, 247.96);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (56, 2, 239.18);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (57, 2, 67.70);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (58, 2, 107.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (59, 2, 116.87);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (60, 2, 209.59);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (61, 2, 173.18);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (62, 2, 181.67);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (63, 2, 115.20);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (64, 2, 120.37);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (65, 2, 103.13);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (66, 2, 154.18);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (67, 2, 18.56);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (68, 2, 182.32);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (69, 2, 294.47);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (70, 2, 105.33);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (71, 2, 82.51);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (72, 2, 7.80);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (73, 2, 209.96);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (74, 2, 67.12);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (75, 2, 15.43);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (76, 2, 245.43);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (77, 3, 16.50);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (78, 3, 43.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (79, 3, 172.34);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (80, 3, 242.60);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (81, 3, 234.3);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (82, 3, 134.91);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (83, 3, 130.11);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (84, 3, 183.29);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (85, 3, 143.93);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (86, 3, 173.45);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (87, 3, 216.41);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (88, 3, 141.48);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (89, 3, 210.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (90, 3, 277.30);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (91, 3, 47.58);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (92, 3, 295.99);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (93, 3, 12.9);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (94, 3, 102.16);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (95, 3, 255.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (96, 3, 106.57);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (97, 3, 107.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (98, 3, 185.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (99, 3, 149.6);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (100, 3, 77.91);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (1, 3, 200.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (2, 3, 159.56);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (3, 3, 108.72);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (4, 3, 219.60);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (5, 3, 173.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (6, 3, 229.29);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (7, 3, 292.11);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (8, 3, 232.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (9, 3, 251.20);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (10, 3, 63.81);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (11, 3, 39.23);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (12, 3, 46.2);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (13, 3, 191.9);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (14, 3, 43.5);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (15, 4, 172.36);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (16, 4, 153.7);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (17, 4, 56.90);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (18, 4, 3.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (19, 4, 110.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (20, 4, 81.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (21, 4, 102.57);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (22, 4, 281.87);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (23, 4, 93.2);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (24, 4, 165.28);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (25, 4, 86.58);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (26, 4, 76.72);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (27, 4, 68.37);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (28, 4, 145.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (29, 4, 227.47);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (30, 4, 207.87);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (31, 4, 220.49);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (32, 4, 203.15);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (33, 4, 52.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (34, 4, 61.87);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (35, 4, 298.4);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (36, 4, 101.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (37, 4, 287.50);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (38, 4, 159.33);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (39, 4, 86.29);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (40, 4, 186.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (41, 4, 297.62);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (42, 4, 47.15);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (43, 4, 50.70);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (44, 4, 52.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (45, 4, 16.38);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (46, 4, 144.45);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (47, 4, 102.9);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (48, 4, 127.71);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (49, 4, 240.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (50, 4, 202.23);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (51, 4, 156.14);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (52, 4, 57.86);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (53, 5, 281.42);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (54, 5, 36.62);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (55, 5, 40.62);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (56, 5, 230.77);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (57, 5, 242.17);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (58, 5, 49.60);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (59, 5, 92.52);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (60, 5, 194.17);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (61, 5, 140.58);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (62, 5, 284.69);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (63, 5, 127.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (64, 5, 249.79);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (65, 5, 165.16);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (66, 5, 113.32);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (67, 5, 52.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (68, 5, 280.95);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (69, 5, 130.80);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (70, 5, 135.15);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (71, 5, 216.30);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (72, 5, 215.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (73, 5, 92.58);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (74, 5, 298.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (75, 5, 14.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (76, 5, 200.6);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (77, 5, 209.61);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (78, 5, 34.29);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (79, 5, 248.93);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (80, 5, 262.71);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (81, 5, 100.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (82, 5, 52.29);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (83, 5, 201.46);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (84, 5, 124.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (85, 5, 166.80);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (86, 5, 292.31);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (87, 5, 166.27);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (88, 5, 106.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (89, 5, 56.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (90, 5, 57.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (91, 6, 247.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (92, 6, 26.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (93, 6, 180.42);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (94, 6, 256.7);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (95, 6, 33.13);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (96, 6, 81.11);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (97, 6, 215.3);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (98, 6, 212.99);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (99, 6, 240.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (100, 6, 68.56);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (1, 6, 232.99);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (2, 6, 121.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (3, 6, 233.21);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (4, 6, 39.42);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (5, 6, 52.40);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (6, 6, 124.30);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (7, 6, 253.14);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (8, 6, 182.79);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (9, 6, 62.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (10, 6, 50.60);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (11, 6, 70.42);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (12, 6, 214.73);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (13, 6, 209.22);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (14, 6, 262.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (15, 6, 151.89);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (16, 6, 102.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (17, 6, 211.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (18, 6, 87.7);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (19, 6, 41.91);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (20, 6, 28.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (21, 6, 289.41);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (22, 6, 30.71);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (23, 6, 298.99);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (24, 6, 173.27);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (25, 6, 190.12);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (26, 6, 253.67);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (27, 6, 110.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (28, 6, 220.83);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (29, 7, 82.4);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (30, 7, 83.68);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (31, 7, 53.66);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (32, 7, 259.17);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (33, 7, 206.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (34, 7, 206.64);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (35, 7, 289.70);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (36, 7, 163.28);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (37, 7, 266.16);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (38, 7, 125.3);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (39, 7, 29.21);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (40, 7, 66.67);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (41, 7, 111.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (42, 7, 48.89);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (43, 7, 106.61);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (44, 7, 291.48);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (45, 7, 4.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (46, 7, 103.81);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (47, 7, 36.40);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (48, 7, 298.51);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (49, 7, 13.36);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (50, 7, 260.89);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (51, 7, 146.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (52, 7, 275.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (53, 7, 235.6);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (54, 7, 48.2);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (55, 7, 161.74);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (56, 7, 276.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (57, 7, 205.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (58, 7, 45.68);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (59, 7, 38.62);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (60, 7, 220.66);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (61, 7, 158.4);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (62, 7, 113.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (63, 7, 100.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (64, 7, 201.95);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (65, 7, 224.27);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (66, 7, 126.85);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (67, 8, 3.91);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (68, 8, 3.50);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (69, 8, 17.37);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (70, 8, 161.43);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (71, 8, 153.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (72, 8, 166.61);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (73, 8, 185.3);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (74, 8, 165.38);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (75, 8, 212.40);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (76, 8, 100.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (77, 8, 70.42);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (78, 8, 145.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (79, 8, 218.61);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (80, 8, 80.13);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (81, 8, 181.36);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (82, 8, 96.52);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (83, 8, 91.62);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (84, 8, 197.2);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (85, 8, 118.22);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (86, 8, 285.82);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (87, 8, 116.43);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (88, 8, 250.92);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (89, 8, 23.40);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (90, 8, 167.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (91, 8, 173.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (92, 8, 257.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (93, 8, 28.33);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (94, 8, 274.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (95, 8, 5.70);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (96, 8, 15.48);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (97, 8, 176.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (98, 8, 74.70);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (99, 8, 295.31);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (100, 8, 91.21);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (1, 8, 5.26);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (2, 8, 96.68);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (3, 8, 91.96);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (4, 8, 257.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (5, 9, 88.93);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (6, 9, 193.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (7, 9, 115.68);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (8, 9, 91.38);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (9, 9, 164.90);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (10, 9, 153.12);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (11, 9, 71.66);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (12, 9, 224.68);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (13, 9, 65.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (14, 9, 76.73);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (15, 9, 271.68);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (16, 9, 178.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (17, 9, 192.41);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (18, 9, 87.53);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (19, 9, 137.14);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (20, 9, 63.72);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (21, 9, 114.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (22, 9, 249.9);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (23, 9, 227.27);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (24, 9, 222.49);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (25, 9, 124.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (26, 9, 99.62);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (27, 9, 84.67);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (28, 9, 23.3);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (29, 9, 221.5);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (30, 9, 291.49);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (31, 9, 210.71);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (32, 9, 288.15);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (33, 9, 11.36);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (34, 9, 248.50);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (35, 9, 190.94);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (36, 9, 94.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (37, 9, 261.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (38, 9, 277.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (39, 9, 5.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (40, 9, 88.22);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (41, 9, 4.81);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (42, 9, 84.68);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (43, 10, 238.20);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (44, 10, 288.60);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (45, 10, 246.66);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (46, 10, 271.2);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (47, 10, 67.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (48, 10, 300.50);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (49, 10, 54.76);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (50, 10, 261.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (51, 10, 243.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (52, 10, 174.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (53, 10, 182.72);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (54, 10, 160.22);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (55, 10, 283.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (56, 10, 136.29);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (57, 10, 260.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (58, 10, 42.7);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (59, 10, 227.53);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (60, 10, 140.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (61, 10, 129.70);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (62, 10, 196.45);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (63, 10, 26.83);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (64, 10, 189.1);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (65, 10, 11.52);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (66, 10, 96.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (67, 10, 265.1);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (68, 10, 21.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (69, 10, 139.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (70, 10, 149.96);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (71, 10, 153.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (72, 10, 156.59);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (73, 10, 142.2);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (74, 10, 96.7);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (75, 10, 155.35);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (76, 10, 161.92);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (77, 10, 278.71);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (78, 10, 125.30);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (79, 10, 293.60);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (80, 10, 172.1);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (81, 11, 115.69);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (82, 11, 68.17);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (83, 11, 215.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (84, 11, 105.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (85, 11, 256.83);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (86, 11, 244.99);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (87, 11, 297.50);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (88, 11, 119.6);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (89, 11, 53.7);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (90, 11, 81.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (91, 11, 3.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (92, 11, 277.80);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (93, 11, 35.51);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (94, 11, 212.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (95, 11, 160.18);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (96, 11, 295.99);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (97, 11, 35.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (98, 11, 298.59);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (99, 11, 153.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (100, 11, 45.73);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (1, 11, 14.27);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (2, 11, 298.25);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (3, 11, 179.83);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (4, 11, 282.54);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (5, 11, 144.57);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (6, 11, 291.64);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (7, 11, 29.57);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (8, 11, 156.6);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (9, 11, 64.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (10, 11, 104.86);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (11, 11, 110.61);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (12, 11, 212.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (13, 11, 127.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (14, 11, 158.15);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (15, 11, 140.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (16, 11, 251.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (17, 11, 118.12);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (18, 11, 36.85);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (19, 12, 278.83);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (20, 12, 185.6);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (21, 12, 17.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (22, 12, 254.69);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (23, 12, 9.23);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (24, 12, 143.83);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (25, 12, 184.69);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (26, 12, 142.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (27, 12, 197.66);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (28, 12, 38.1);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (29, 12, 224.58);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (30, 12, 261.43);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (31, 12, 144.86);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (32, 12, 153.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (33, 12, 236.62);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (34, 12, 17.28);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (35, 12, 273.84);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (36, 12, 265.90);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (37, 12, 191.38);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (38, 12, 78.85);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (39, 12, 102.57);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (40, 12, 179.60);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (41, 12, 100.48);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (42, 12, 281.28);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (43, 12, 233.42);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (44, 12, 179.11);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (45, 12, 98.35);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (46, 12, 170.29);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (47, 12, 259.93);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (48, 12, 64.13);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (49, 12, 67.21);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (50, 12, 48.41);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (51, 12, 132.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (52, 12, 151.72);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (53, 12, 30.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (54, 12, 19.20);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (55, 12, 128.18);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (56, 12, 125.65);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (57, 13, 209.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (58, 13, 74.98);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (59, 13, 200.9);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (60, 13, 299.49);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (61, 13, 274.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (62, 13, 94.30);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (63, 13, 55.22);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (64, 13, 239.47);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (65, 13, 143.4);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (66, 13, 262.8);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (67, 13, 245.42);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (68, 13, 230.43);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (69, 13, 152.78);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (70, 13, 165.94);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (71, 13, 119.97);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (72, 13, 218.49);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (73, 13, 190.28);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (74, 13, 18.63);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (75, 13, 110.27);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (76, 13, 21.31);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (77, 13, 22.15);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (78, 13, 57.16);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (79, 13, 276.90);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (80, 13, 50.1);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (81, 13, 166.50);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (82, 13, 103.73);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (83, 13, 267.34);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (84, 13, 19.2);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (85, 13, 121.96);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (86, 13, 169.79);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (87, 13, 104.24);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (88, 13, 164.75);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (89, 13, 282.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (90, 13, 43.88);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (91, 13, 175.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (92, 13, 39.39);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (93, 13, 207.19);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (94, 13, 274.5);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (95, 1, 11.30);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (96, 2, 213.91);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (97, 4, 22.6);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (98, 5, 20.44);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (99, 5, 218.95);
INSERT INTO PABLO.PAGAMENTO (pag_cmp_id, pag_tip_id, pag_valor) VALUES (100, 7, 256.37);
  
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
  ALTER TABLE Pablo.H_COMPRA ADD CONSTRAINT PK_HCM PRIMARY KEY
  (
    hcm_id
  )
  ;
  ALTER TABLE Pablo.H_OPERA_PDV ADD CONSTRAINT PK_HOP PRIMARY KEY
  (
    hop_id
  )
  ;
  ALTER TABLE Pablo.AUDITORIA ADD CONSTRAINT PK_AUD PRIMARY KEY
  (
    aud_id
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
  ALTER TABLE Pablo.COMPRA ADD CONSTRAINT FK_FNC_PDV FOREIGN KEY
  (
    cmp_fnc_id
  )
  REFERENCES Pablo.FUNCIONARIO
  (
    fnc_id
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
  -- CRIANDO SEQUENCES
CREATE SEQUENCE PABLO.SEQ_FOR INCREMENT BY 1 START WITH 103 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_PRM INCREMENT BY 1 START WITH 101 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_CMP INCREMENT BY 1 START WITH 101 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_PDV INCREMENT BY 1 START WITH 16 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_PRO INCREMENT BY 1 START WITH 101 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_CAT INCREMENT BY 1 START WITH 13 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_FNC INCREMENT BY 1 START WITH 112 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_OPE INCREMENT BY 1 START WITH 501 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_ITC INCREMENT BY 1 START WITH 501 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_ITP INCREMENT BY 1 START WITH 501 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_END INCREMENT BY 1 START WITH 103 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_TIP INCREMENT BY 1 START WITH 14 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_PAG INCREMENT BY 1 START WITH 501 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_HCM INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_HOP INCREMENT BY 1 START WITH 1 NOCACHE;
CREATE SEQUENCE PABLO.SEQ_AUD INCREMENT BY 1 START WITH 1 NOCACHE;
  -- CRIANDO TRIGGER DE SEQUENCE
CREATE OR REPLACE TRIGGER PABLO.TG_FORNECEDOR_BI BEFORE
  INSERT
    ON Pablo.FORNECEDOR FOR EACH ROW BEGIN :new.for_id := SEQ_FOR.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PROMOCAO_BI BEFORE
  INSERT
    ON Pablo.PROMOCAO FOR EACH ROW BEGIN :new.prm_id := SEQ_PRM.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_COMPRA_BI BEFORE
  INSERT
    ON Pablo.COMPRA FOR EACH ROW BEGIN :new.cmp_id := SEQ_CMP.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PDV_BI BEFORE
  INSERT
    ON Pablo.PDV FOR EACH ROW BEGIN :new.pdv_id := SEQ_PDV.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PRODUTO_BI BEFORE
  INSERT
    ON Pablo.PRODUTO FOR EACH ROW BEGIN :new.pro_id := SEQ_PRO.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_CATEGORIA_BI BEFORE
  INSERT
    ON Pablo.CATEGORIA FOR EACH ROW BEGIN :new.cat_id := SEQ_CAT.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_FUNCIONARIO_BI BEFORE
  INSERT
    ON Pablo.FUNCIONARIO FOR EACH ROW BEGIN :new.fnc_id := SEQ_FNC.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_ENDERECO_FORNECEDOR_BI BEFORE
  INSERT
    ON Pablo.ENDERECO_FORNECEDOR FOR EACH ROW BEGIN :new.end_id :=
    SEQ_END.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_TIPO_PAGAMENTO_BI BEFORE
  INSERT
    ON Pablo.TIPO_PAGAMENTO FOR EACH ROW BEGIN :new.tip_id := SEQ_TIP.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_H_COMRA_BI BEFORE
  INSERT
    ON Pablo.H_COMPRA FOR EACH ROW BEGIN :new.hcm_id := SEQ_HCM.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_H_OPERA_PDV_BI BEFORE
  INSERT
    ON Pablo.H_OPERA_PDV FOR EACH ROW BEGIN :new.hop_id := SEQ_HOP.NEXTVAL;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_AUDITORIA_BI BEFORE
  INSERT
    ON Pablo.AUDITORIA FOR EACH ROW BEGIN :new.aud_id := SEQ_AUD.NEXTVAL;
END;
/
-- CRIANDO TRIGGERS DE AUDITORIA
CREATE OR REPLACE TRIGGER PABLO.TG_AUDIT_FORNECEDOR AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.FORNECEDOR
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'FORNECEDOR', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'FORNECEDOR', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'FORNECEDOR', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_AUDIT_ENDERECO_FORNECEDOR AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.ENDERECO_FORNECEDOR
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ENDERECO_FORNECEDOR', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ENDERECO_FORNECEDOR', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ENDERECO_FORNECEDOR', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_AUDIT_CATEGORIA AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.CATEGORIA
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'CATEGORIA', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'CATEGORIA', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'CATEGORIA', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_AUDIT_COMPRA AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.COMPRA
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'COMPRA', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'COMPRA', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'COMPRA', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_AUDIT_FUNCIONARIO AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.FUNCIONARIO
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'FUNCIONARIO', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'FUNCIONARIO', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'FUNCIONARIO', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_AUDIT_PROMOCAO AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.PROMOCAO
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PROMOCAO', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PROMOCAO', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PROMOCAO', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_AUDIT_PDV AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.PDV
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PDV', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PDV', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PDV', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PRODUTO AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.PRODUTO
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PRODUTO', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PRODUTO', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PRODUTO', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_ITENS_COMPRA AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.ITENS_COMPRA
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ITENS_COMPRA', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ITENS_COMPRA', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ITENS_COMPRA', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_ITENS_PROMOCAO AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.ITENS_PROMOCAO
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ITENS_PROMOCAO', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ITENS_PROMOCAO', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'ITENS_PROMOCAO', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_OPERA_PDV AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.OPERA_PDV
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'OPERA_PDV', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'OPERA_PDV', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'OPERA_PDV', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_TIPO_PAGAMENTO AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.TIPO_PAGAMENTO
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'TIPO_PAGAMENTO', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'TIPO_PAGAMENTO', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'TIPO_PAGAMENTO', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PAGAMENTO AFTER
  INSERT OR DELETE OR UPDATE
    ON Pablo.PAGAMENTO
	REFERENCING OLD AS old NEW AS new 
	FOR EACH ROW 
	DECLARE
		usu_so VARCHAR2(30);
		usu_bd VARCHAR2(30);
		ident_host VARCHAR2(30);
		ident_terminal VARCHAR2(30);
	BEGIN
		SELECT 
			sys_context('USERENV', 'OS_USER') AS USU_SO,
			sys_context('USERENV', 'CURRENT_USER') AS USU_BD,
			sys_context('USERENV', 'HOST') AS IDENT_HOST,
			sys_context('USERENV', 'TERMINAL') AS IDENT_TERMINAL
		INTO
			usu_so,
			usu_bd,
			ident_host,
			ident_terminal
		FROM
			dual;
		IF DELETING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PAGAMENTO', 'DELETE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF UPDATING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PAGAMENTO', 'UPDATE', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);
		ELSIF INSERTING THEN
			INSERT INTO PABLO.AUDITORIA VALUES (0, 'PAGAMENTO', 'INSERT', SYSDATE, usu_so, usu_bd, ident_host, ident_terminal);			
		END IF;
END;
/
-- CRIANDO TRIGGERS DE QTD DE UPDATE E DATA DE CONTROLE
CREATE OR REPLACE TRIGGER PABLO.TG_FORNECEDOR_BU BEFORE
  UPDATE
    ON Pablo.FORNECEDOR FOR EACH ROW BEGIN :new.for_qtd_update :=
    :old.for_qtd_update + 1;
  :new.for_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PROMOCAO_BU BEFORE
  UPDATE
    ON Pablo.PROMOCAO FOR EACH ROW BEGIN :new.prm_qtd_update :=
    :old.prm_qtd_update + 1;
  :new.prm_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_COMPRA_BU BEFORE
  UPDATE
    ON Pablo.COMPRA FOR EACH ROW BEGIN :new.cmp_qtd_update :=
    :old.cmp_qtd_update + 1;
  :new.cmp_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PDV_BU BEFORE
  UPDATE
    ON Pablo.PDV FOR EACH ROW BEGIN :new.pdv_qtd_update := :old.pdv_qtd_update
    + 1;
  :new.pdv_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PRODUTO_BU BEFORE
  UPDATE
    ON Pablo.PRODUTO FOR EACH ROW BEGIN :new.pro_qtd_update :=
    :old.pro_qtd_update + 1;
  :new.pro_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_CATEGORIA_BU BEFORE
  UPDATE
    ON Pablo.CATEGORIA FOR EACH ROW BEGIN :new.cat_qtd_update :=
    :old.cat_qtd_update + 1;
  :new.cat_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_FUNCIONARIO_BU BEFORE
  UPDATE
    ON Pablo.FUNCIONARIO FOR EACH ROW BEGIN :new.fnc_qtd_update :=
    :old.fnc_qtd_update + 1;
  :new.fnc_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_OPERA_PDV_BU BEFORE
  UPDATE
    ON Pablo.OPERA_PDV FOR EACH ROW BEGIN :new.ope_qtd_update :=
    :old.ope_qtd_update + 1;
  :new.ope_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_ITENS_COMPRA_BU BEFORE
  UPDATE
    ON Pablo.ITENS_COMPRA FOR EACH ROW BEGIN :new.itc_qtd_update :=
    :old.itc_qtd_update + 1;
  :new.itc_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_ITENS_PROMOCAO_BU BEFORE
  UPDATE
    ON Pablo.ITENS_PROMOCAO FOR EACH ROW BEGIN :new.itp_qtd_update :=
    :old.itp_qtd_update + 1;
  :new.itp_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_ENDERECO_FORNECEDOR_BU BEFORE
  UPDATE
    ON Pablo.ENDERECO_FORNECEDOR FOR EACH ROW BEGIN :new.end_qtd_update :=
    :old.end_qtd_update + 1;
  :new.end_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_TIPO_PAGAMENTO_BU BEFORE
  UPDATE
    ON Pablo.TIPO_PAGAMENTO FOR EACH ROW BEGIN :new.tip_qtd_update :=
    :old.tip_qtd_update + 1;
  :new.tip_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_PAGAMENTO_BU BEFORE
  UPDATE
    ON Pablo.PAGAMENTO FOR EACH ROW BEGIN :new.pag_qtd_update :=
    :old.pag_qtd_update + 1;
  :new.pag_data_controle := sysdate;
END;
/
CREATE OR REPLACE TRIGGER PABLO.TG_COMPRA_BUD BEFORE
  UPDATE OR
  DELETE
    ON Pablo.COMPRA FOR EACH ROW BEGIN
  INSERT
  INTO
    H_COMPRA VALUES
    (
   '0',
      :old.cmp_id,
      :old.cmp_data,
      :old.cmp_valor_total,
      :old.cmp_pdv_id,
      sysdate
    );
END;
/
CREATE OR REPLACE
TRIGGER PABLO.TG_OPERA_PDV_BUD BEFORE UPDATE OR DELETE ON PABLO.OPERA_PDV
FOR EACH ROW
BEGIN
  INSERT INTO H_OPERA_PDV VALUES(0, :old.ope_data_entrada, :old.ope_data_saida, :old.ope_fnc_id, :old.ope_pdv_id, sysdate);
END;
/
