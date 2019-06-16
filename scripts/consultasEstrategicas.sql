-- Produto mais vendido nos �ltimos 12 meses
SELECT * FROM (SELECT COUNT(pro_id) AS "Quantidade vendido", pro_descricao AS "Produto" FROM Pablo.PRODUTO JOIN
Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN PABLO.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
WHERE COMPRA.cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY pro_descricao
ORDER BY "Quantidade vendido" DESC)
WHERE ROWNUM = 1;

-- M�todo de pagamento mais utilizado nas vendas nos �ltimos 12 meses
SELECT * FROM (SELECT COUNT(tip_id) AS "Quantidade de pagamentos", tip_descricao AS "Tipo de pagamento" FROM Pablo.TIPO_PAGAMENTO JOIN
Pablo.PAGAMENTO ON TIPO_PAGAMENTO.tip_id = PAGAMENTO.pag_tip_id JOIN
Pablo.COMPRA ON PAGAMENTO.pag_cmp_id = COMPRA.cmp_id
WHERE COMPRA.cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY tip_descricao
ORDER BY "Quantidade de pagamentos" DESC)
WHERE ROWNUM = 1;

-- Dia da semana com mais vendas nos �ltimos 12 meses
SELECT * FROM (SELECT COUNT(cmp_id) AS "Quantidade de vendas", TO_CHAR(cmp_data, 'Day') "Dia da semana" FROM Pablo.COMPRA
WHERE cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY TO_CHAR(cmp_data, 'Day')
ORDER BY "Quantidade de vendas" DESC)
WHERE ROWNUM = 1;

-- Categoria que mais vendeu produtos nos �ltimos 12 meses 
SELECT * FROM (SELECT cat_descricao AS "Categoria", COUNT(cat_id) AS "Quantidade de vendas" FROM Pablo.CATEGORIA
JOIN Pablo.PRODUTO ON PRODUTO.pro_cat_id = CATEGORIA.cat_id
JOIN Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN Pablo.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
WHERE cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY cat_descricao
ORDER BY "Quantidade de vendas" DESC)
WHERE ROWNUM = 1;

-- Funcion�rio que registrou mais vendas nos �ltimos 12 meses
SELECT * FROM (SELECT COUNT(cmp_fnc_id) AS "Quantidade de vendas", fnc_nome || ' ' || fnc_nomedomeio || ' ' || fnc_sobrenome AS "Funcion�rio"
FROM Pablo.COMPRA JOIN Pablo.FUNCIONARIO ON FUNCIONARIO.fnc_id = COMPRA.cmp_fnc_id
WHERE cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY fnc_nome || ' ' || fnc_nomedomeio || ' ' || fnc_sobrenome
ORDER BY "Quantidade de vendas" DESC)
WHERE ROWNUM = 1;

-- Varia��o na venda de produto mais vendido por m�s nos �ltimos 4 meses
SELECT COUNT(pro_id) AS "Quantidade vendido", pro_descricao AS "Produto", TO_CHAR(cmp_data, 'Mon') FROM Pablo.PRODUTO
JOIN Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN PABLO.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
WHERE COMPRA.cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY TO_CHAR(cmp_data, 'Mon'), pro_descricao
ORDER BY "Quantidade vendido" DESC;

-- Varia��o das vendas realizadas por m�s nos �ltimos 4 meses
SELECT COUNT(cmp_id) AS "Quantidade de vendas", TO_CHAR(cmp_data, 'Mon') AS Mes FROM Pablo.COMPRA
GROUP BY TO_CHAR(cmp_data, 'Mon')
ORDER BY Mes;
-- Varia��o de categorias com produtos vendidos nos �ltimos 4 meses
SELECT cat_descricao AS "Categoria", COUNT(cat_id) AS "Quantidade", TO_CHAR(cmp_data, 'Mon') AS "M�s" FROM Pablo.CATEGORIA
JOIN Pablo.PRODUTO ON PRODUTO.pro_cat_id = CATEGORIA.cat_id
JOIN Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN Pablo.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
GROUP BY TO_CHAR(cmp_data, 'Mon'), cat_descricao
ORDER BY "Quantidade" DESC;

SELECT cat_descricao, COUNT(pro_id), TO_CHAR(cmp_data, 'Mon') FROM Pablo.CATEGORIA
JOIN Pablo.PRODUTO ON PRODUTO.pro_cat_id = CATEGORIA.cat_id
JOIN Pablo.COMPRA ON 
-- Varia��o dos 5 produtos mais vendidos nos �ltimnos 6 meses
-- Varia��o dos m�todos de pagamento utilizados ao decorrer dos �ltimos 4 meses
SELECT TO_CHAR(cmp_data, 'Mon') AS "M�s", COUNT(tip_id) AS "Quantidade", tip_descricao AS "Tipo de pagamento" FROM Pablo.COMPRA
JOIN Pablo.PAGAMENTO ON PAGAMENTO.pag_cmp_id = COMPRA.cmp_id
JOIN Pablo.TIPO_PAGAMENTO ON TIPO_PAGAMENTO.tip_id = PAGAMENTO.pag_tip_id
GROUP BY TIP_, TO_CHAR(cmp_data, 'Mon')
ORDER BY "Quantidade" DESC;