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
  'Tabela associativa que armazena os dados das compras e seus respectivos itens, que são produtos' ;
  COMMENT ON TABLE Pablo.ITENS_PROMOCAO
IS
  'Tabela associativa que armazena os dados das promoções e seus respectivos itens, que são produtos participantes' ;
  COMMENT ON TABLE Pablo.OPERA_PDV
IS
  'Tabela associativa que armazena os dados dos funcionários e dos pontos de vendas que foram operados por eles' ;
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
  'Campo que armazena o valor total da compra, somando o valor de cada item dela' ;
  COMMENT ON COLUMN Pablo.COMPRA.CMP_PDV_ID
IS
  'Campo que armazena o identificador do ponto de venda onde a compra foi registrada' ;
  -- ENDERECO_FORNECEDOR
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_ID
IS
  'Campo que armazena o identificador do endereço do fornecedor' ;
  COMMENT ON COLUMN Pablo.ENDERECO_FORNECEDOR.END_FOR_ID
IS
  'Campo que armazena o identificador do fornecedor pertencente de um endereço' ;
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
  'Campo que armazena a sigla (duas letras) referente ao estado do endereço do fornecedor' ;
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
  'Campo que armazena a sigla (duas letras) do estado do endereço do funcionário' ;
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
  'Campo que armazena o identificador único da compra respectiva aos itens da compra' ;
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
  'Campo que armazena o identificador único funcionário operador do ponto de venda' ;
  COMMENT ON COLUMN Pablo.OPERA_PDV.OPE_PDV_ID
IS
  'Campo que armazena o identificador único do ponto de venda operado pelo funcionário' ;
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
  'Campo que armazena o identificador único da compra referente ao pagamento realizado' ;
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_TIP_ID
IS
  'Campo que armazena o identificador único do tipo de pagamento utilizado no pagamento' ;
  COMMENT ON COLUMN Pablo.PAGAMENTO.PAG_VALOR
IS
  'Campo que armazena o valor do pagamento realizado' ;