-- Produto mais vendido nos últimos 12 meses
SELECT * FROM (SELECT COUNT(pro_id) AS "Quantidade vendido", pro_descricao AS "Produto" FROM Pablo.PRODUTO JOIN
Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN PABLO.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
WHERE COMPRA.cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY pro_descricao
ORDER BY "Quantidade vendido" DESC)
WHERE ROWNUM = 1;

-- Método de pagamento mais utilizado nas vendas nos últimos 12 meses
SELECT * FROM (SELECT COUNT(tip_id) AS "Quantidade de pagamentos", tip_descricao AS "Tipo de pagamento" FROM Pablo.TIPO_PAGAMENTO JOIN
Pablo.PAGAMENTO ON TIPO_PAGAMENTO.tip_id = PAGAMENTO.pag_tip_id JOIN
Pablo.COMPRA ON PAGAMENTO.pag_cmp_id = COMPRA.cmp_id
WHERE COMPRA.cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY tip_descricao
ORDER BY "Quantidade de pagamentos" DESC)
WHERE ROWNUM = 1;

-- Dia da semana com mais vendas nos últimos 12 meses
SELECT * FROM (SELECT COUNT(cmp_id) AS "Quantidade de vendas", TO_CHAR(cmp_data, 'Day') "Dia da semana" FROM Pablo.COMPRA
WHERE cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY TO_CHAR(cmp_data, 'Day')
ORDER BY "Quantidade de vendas" DESC)
WHERE ROWNUM = 1;

-- Categoria que mais vendeu produtos nos últimos 12 meses 
SELECT * FROM (SELECT cat_descricao AS "Categoria", COUNT(cat_id) AS "Quantidade de vendas" FROM Pablo.CATEGORIA
JOIN Pablo.PRODUTO ON PRODUTO.pro_cat_id = CATEGORIA.cat_id
JOIN Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN Pablo.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
WHERE cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY cat_descricao
ORDER BY "Quantidade de vendas" DESC)
WHERE ROWNUM = 1;

-- Funcionário que registrou mais vendas nos últimos 12 meses
SELECT * FROM (SELECT COUNT(cmp_fnc_id) AS "Quantidade de vendas", fnc_nome || ' ' || fnc_nomedomeio || ' ' || fnc_sobrenome AS "Funcionário"
FROM Pablo.COMPRA JOIN Pablo.FUNCIONARIO ON FUNCIONARIO.fnc_id = COMPRA.cmp_fnc_id
WHERE cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY fnc_nome || ' ' || fnc_nomedomeio || ' ' || fnc_sobrenome
ORDER BY "Quantidade de vendas" DESC)
WHERE ROWNUM = 1;

-- Variação na venda de produto mais vendido por mês nos últimos 4 meses
SELECT COUNT(pro_id) AS "Quantidade vendido", pro_descricao AS "Produto", TO_CHAR(cmp_data, 'Mon') FROM Pablo.PRODUTO
JOIN Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN PABLO.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
WHERE COMPRA.cmp_data BETWEEN (SYSDATE - 365) AND SYSDATE
GROUP BY TO_CHAR(cmp_data, 'Mon'), pro_descricao
ORDER BY "Quantidade vendido" DESC;

-- Variação das vendas realizadas por mês nos últimos 4 meses
SELECT COUNT(cmp_id) AS "Quantidade de vendas", TO_CHAR(cmp_data, 'Mon') AS Mes FROM Pablo.COMPRA
GROUP BY TO_CHAR(cmp_data, 'Mon')
ORDER BY Mes;
-- Variação de categorias com produtos vendidos nos últimos 4 meses
SELECT cat_descricao AS "Categoria", COUNT(cat_id) AS "Quantidade", TO_CHAR(cmp_data, 'Mon') AS "Mês" FROM Pablo.CATEGORIA
JOIN Pablo.PRODUTO ON PRODUTO.pro_cat_id = CATEGORIA.cat_id
JOIN Pablo.ITENS_COMPRA ON ITENS_COMPRA.itc_pro_id = PRODUTO.pro_id
JOIN Pablo.COMPRA ON COMPRA.cmp_id = ITENS_COMPRA.itc_cmp_id
GROUP BY TO_CHAR(cmp_data, 'Mon'), cat_descricao
ORDER BY "Quantidade" DESC;

SELECT cat_descricao, COUNT(pro_id), TO_CHAR(cmp_data, 'Mon') FROM Pablo.CATEGORIA
JOIN Pablo.PRODUTO ON PRODUTO.pro_cat_id = CATEGORIA.cat_id
JOIN Pablo.COMPRA ON 
-- Variação dos 5 produtos mais vendidos nos últimnos 6 meses
-- Variação dos métodos de pagamento utilizados ao decorrer dos últimos 4 meses
SELECT TO_CHAR(cmp_data, 'Mon') AS "Mês", COUNT(tip_id) AS "Quantidade", tip_descricao AS "Tipo de pagamento" FROM Pablo.COMPRA
JOIN Pablo.PAGAMENTO ON PAGAMENTO.pag_cmp_id = COMPRA.cmp_id
JOIN Pablo.TIPO_PAGAMENTO ON TIPO_PAGAMENTO.tip_id = PAGAMENTO.pag_tip_id
GROUP BY TIP_, TO_CHAR(cmp_data, 'Mon')
ORDER BY "Quantidade" DESC;