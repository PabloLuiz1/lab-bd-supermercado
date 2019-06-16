-- DESCREVENDO AS TABELAS
COMMENT ON TABLE Pablo.CATEGORIA
IS
  'Tabela que armazena os dados das categorias de produtos';
  COMMENT ON TABLE Pablo.COMPRA
IS
  'Tabela que armazena os dados das compras realizadas por clientes';
  COMMENT ON TABLE Pablo.ENDERECO_FORNECEDOR
IS
  'Tabela que armazena os dados referentes aos endere�os dos fornecedores';
  COMMENT ON TABLE Pablo.FORNECEDOR
IS
  'Tabela que armazena os dados dos fornecedores';
  COMMENT ON TABLE Pablo.FUNCIONARIO
IS
  'Tabela que armazena os dados dos funcion�rios';
  COMMENT ON TABLE Pablo.ITENS_COMPRA
IS
  'Tabela associativa que armazena os dados das compras e seus respectivos itens, que s�o produtos' ;
  COMMENT ON TABLE Pablo.ITENS_PROMOCAO
IS
  'Tabela associativa que armazena os dados das promo��es e seus respectivos itens, que s�o produtos participantes' ;
  COMMENT ON TABLE Pablo.OPERA_PDV
IS
  'Tabela associativa que armazena os dados dos funcion�rios e dos pontos de vendas que foram operados por eles' ;
  COMMENT ON TABLE Pablo.PDV
IS
  'Tabela que armazena os dados dos pontos de venda';
  COMMENT ON TABLE Pablo.PRODUTO
IS
  'Tabela que armazena os dados dos produtos';
  COMMENT ON TABLE Pablo.PROMOCAO
IS
  'Tabela que armazena os dados das promo��es';
  COMMENT ON TABLE Pablo.TIPO_PAGAMENTO
IS
  'Tabela que armazena os tipos de pagamento';
  COMMENT ON TABLE Pablo.PAGAMENTO
IS
  'Tabela que armazena os dados de pagamento realizado';
  -- DESCREVENDO OS CAMPOS
  -- CATEGORIA
  COMMENT ON COLUMN Pablo.CATEGORIA.CAT_ID
IS
  'Campo que armazena o identificador �nico da categoria';
  COMMENT ON COLUMN Pablo.CATEGORIA.CAT_DESCRICAO
IS
  'Campo que armazena a descri��o da categoria';
  -- COMPRA
  COMMENT ON COLUMN Pablo.COMPRA.CMP_ID
IS
  'Campo que armazena o identificador �nico da compra';
  COMMENT ON COLUMN Pablo.COMPRA.CMP_DATA
IS
  'Campo que armazena a data na qual a compra foi realizada';
  COMMENT ON COLUMN Pablo.COMPRA.CMP_VALOR_TOTAL
IS
  'Campo que armazena o valor total da compra, somando o valor de cada item dela' ;
  COMMENT ON COLUMN Pablo.COMPRA.CMP_PDV_ID
IS
  'Campo que armazena o identificador do ponto de venda onde a compra foi registrada' ;
  -- ENDERECO_FORNECEDOR
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_ID
IS
  'Campo que armazena o identificador do endere�o do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_FOR_ID
IS
  'Campo que armazena o identificador do fornecedor pertencente de um endere�o' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_LOGRADOURO
IS
  'Campo que armazena o nome do logradouro do endere�o do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_CEP
IS
  'Campo que armazena o n�mero do CEP do endere�o do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_BAIRRO
IS
  'Campo que armazena o nome do bairro do endere�o do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_CIDADE
IS
  'Campo que armazena o nome da cidade do endere�o do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_ESTADO
IS
  'Campo que armazena a sigla (duas letras) referente ao estado do endere�o do fornecedor' ;
  -- FORNECEDOR
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_ID
IS
  'Campo que armazena o identificador �nico do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RESPONSAVEL_NOME
IS
  'Campo que armazena o primeiro nome do respons�vel fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RESPONSAVEL_NOMEDOMEIO
IS
  'Campo que armazena o nome do meio do respons�vel fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RESPONSAVEL_SOBRENOME
IS
  'Campo que armazena o sobrenome do respons�vel fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_CNPJ
IS
  'Campo que armazena o n�mero de CNPJ do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_RAZAO_SOCIAL
IS
  'Campo que armazena o nome da raz�o social do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_TELEFONE
IS
  'Campo que armazena o n�mero de telefone do fornecedor' ;
  COMMENT ON COLUMN Pablo.FORNECEDOR.FOR_EMAIL
IS
  'Campo que armazena o endere�o de e-mail do fornecedor' ;
  -- FUNCIONARIO
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_ID
IS
  'Campo que armazena o identificador �nico do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_RG
IS
  'Campo que armazena o n�mero do RG do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_CPF
IS
  'Campo que armazena o n�mero de CPF do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_NOME
IS
  'Campo que armazena o primeiro nome do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_NOMEDOMEIO
IS
  'Campo que armazena o nome do meio do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_SOBRENOME
IS
  'Campo que armazena o sobrenome do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_CEP
IS
  'Campo que armazena o n�mero do CEP do endere�o do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_BAIRRO
IS
  'Campo que armazena o nome do bairro do endere�o do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_ESTADO
IS
  'Campo que armazena a sigla (duas letras) do estado do endere�o do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_LOGRADOURO
IS
  'Campo que armazena o nome do logradouro do endere�o do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_CIDADE
IS
  'Campo que armazena o o nome da cidade do endere�o do funcion�rio' ;
  COMMENT ON COLUMN Pablo.FUNCIONARIO.FNC_TELEFONE
IS
  'Campo que armazena o n�mero de telefone do funcion�rio' ;
  -- ITENS_COMPRA
  COMMENT ON COLUMN Pablo.ITENS_COMPRA.ITC_QUANTIDADE
IS
  'Campo que armazena a quantidade do respectivo item da compra' ;
  COMMENT ON COLUMN Pablo.ITENS_COMPRA.ITC_PRO_ID
IS
  'Campo que armazena o identificador �nico do produto item da compra' ;
  COMMENT ON COLUMN Pablo.ITENS_COMPRA.ITC_CMP_ID
IS
  'Campo que armazena o identificador �nico da compra respectiva aos itens da compra' ;
  --ITENS_PROMOCAO
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_QTD_DISPONIVEL
IS
  'Campo que armazena a quantidade dispon�vel de um certo item da promo��o' ;
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_DESCONTO
IS
  'Campo que armazena a porcentagem de desconto de um certo item na promo��o' ;
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_PRO_ID
IS
  'Campo que armazena o identificador �nico do produto em promo��o' ;
  COMMENT ON COLUMN Pablo.ITENS_PROMOCAO.ITP_PRM_ID
IS
  'Campo que armazena o identificador �nico da promo��o referente ao item' ;
  --OPERA_PDV
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_DATA_ENTRADA
IS
  'Campo que armazena a data e hora de entrada do operador do ponto de venda' ;
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_DATA_SAIDA
IS
  'Campo que armazena a data e hora de sa�da do operador do ponto de venda' ;
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_FNC_ID
IS
  'Campo que armazena o identificador �nico funcion�rio operador do ponto de venda' ;
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_PDV_ID
IS
  'Campo que armazena o identificador �nico do ponto de venda operado pelo funcion�rio' ;
  --PDV
  COMMENT ON COLUMN Pablo.PDV.PDV_ID
IS
  'Campo que armazena o identificador �nico do ponto de venda' ;
  COMMENT ON COLUMN Pablo.PDV.PDV_NUMERO
IS
  'Campo que armazena o n�mero (1-99) do ponto de venda' ;
  --PRODUTO
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_ID
IS
  'Campo que armazena o identificador �nico do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_DESCRICAO
IS
  'Campo que armazena a descri��o do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_PRECO
IS
  'Campo que armazena o pre�o do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_QUANTIDADE
IS
  'Campo que armazena a quantidade em estoque do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_FOR_ID
IS
  'Campo que armazena o identificador �nico do fornecedor do produto' ;
  COMMENT ON COLUMN Pablo.PRODUTO.PRO_CAT_ID
IS
  'Campo que armazena o identificador �nico da categoria do produto' ;
  --PROMOCAO
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_ID
IS
  'Campo que armazena o identificador �nico da promo��o' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_INICIO
IS
  'Campo que armazena a data do �nicio da promo��o' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_FIM
IS
  'Campo que armazena a data do fim da promo��o' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_NOME
IS
  'Campo que armazena o nome da promo��o' ;
  --PROMOCAO
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_ID
IS
  'Campo que armazena o identificador �nico da promo��o' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_INICIO
IS
  'Campo que armazena a data do �nicio da promo��o' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_DATA_FIM
IS
  'Campo que armazena a data do fim da promo��o' ;
  COMMENT ON COLUMN Pablo.PROMOCAO.PRM_NOME
IS
  'Campo que armazena o nome da promo��o' ;
  --TIPO_PAGAMENTO
  COMMENT ON COLUMN Pablo.TIPO_PAGAMENTO.TIP_ID
IS
  'Campo que armazena o identificador �nico do tipo de pagamento' ;
  COMMENT ON COLUMN Pablo.TIPO_PAGAMENTO.TIP_DESCRICAO
IS
  'Campo que armazena a descri��o do tipo de pagamento' ;
  --PAGAMENTO
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_CMP_ID
IS
  'Campo que armazena o identificador �nico da compra referente ao pagamento realizado' ;
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_TIP_ID
IS
  'Campo que armazena o identificador �nico do tipo de pagamento utilizado no pagamento' ;
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_VALOR
IS
  'Campo que armazena o valor do pagamento realizado' ;