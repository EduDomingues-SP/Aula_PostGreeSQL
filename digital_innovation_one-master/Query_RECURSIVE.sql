CREATE TABLE IF NOT EXISTS funcionarios (
id SERIAL,
nome VARCHAR(50),
gerente INTEGER,
PRIMARY KEY (id),
FOREIGN KEY (gerente) REFERENCES funcionarios (id)
);

INSERT INTO funcionarios (nome,gerente) VALUES ('Ancelmo', null);
INSERT INTO funcionarios (nome,gerente) VALUES ('Beatriz', 1);
INSERT INTO funcionarios (nome,gerente) VALUES ('MAgno', 1);
INSERT INTO funcionarios (nome,gerente) VALUES ('Cremilda', 2);
INSERT INTO funcionarios (nome,gerente) VALUES ('Wagner', 4);

SELECT id, nome, gerente FROM  funcionarios WHERE gerente IS null
UNION ALL

SELECT id, nome, gerente FROM  funcionarios WHERE id=999;  -- apenas para exemplificar UNION ALL

CREATE OR REPLACE RECURSIVE VIEW vw_func (id, gerente, funcionario)  AS (
SELECT id, gerente, nome
FROM funcionarios
WHERE gerente IS Null
		
UNION ALL
		
SELECT 	funcionarios.id, funcionarios.gerente, funcionarios.nome
FROM funcionarios
JOIN vw_func ON vw_func.id = funcionarios.gerente
);

SELECT id, gerente,funcionario 
FROM vw_func;

-- Desafio montar este acima com nome do Gerente também
		