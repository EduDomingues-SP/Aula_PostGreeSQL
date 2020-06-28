SELECT numero,nome, ativo
FROM banco;

	CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
	);
		7
SELECT numero,nome, ativo
FROM vw_bancos;

	CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
	);
	
	SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2;

INSERT INTO vw_bancos_2 ( banco_numero, banco_nome, banco_ativo)
values (51,'Banco Bom Dia', TRUE);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2
WHERE banco_numero = 51;

UPDATE vw_bancos_2 SET banco_ativo = FALSE 
WHERE banco_numero = 51;

DELETE FROM vw_bancos_2 WHERE banco_numero = 51;

	CREATE OR REPLACE VIEW vw_agencia AS (
	SELECT nome, ativo
	FROM agencia
	);

SELECT nome	FROM agencia;

CREATE OR REPLACE VIEW vw_bancos_ativos AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
	);
	--) WITH LOCAL CHECK OPTION;
	
SELECT numero, nome, ativo	FROM vw_bancos_ativos
WHERE banco_numero = 51;

INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES ( 51, 'Banco Bom Dia', FALSE);

CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE  'a%'
	) WITH CASCADED CHECK OPTION;
	--) WITH LOCAL CHECK OPTION;
	
	INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES ( 333, 'Alfa Omega',TRUE);

SELECT numero, nome, ativo	FROM vw_bancos_com_a
WHERE numero = 332
ORDER BY numero ASC;
	
	INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES ( 331, 'Alfa Gama',FALSE);
	INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES ( 332, 'Alfa Beta',FALSE);
		INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES ( 335, 'Alfa Beta Alfa',FALSE);
	