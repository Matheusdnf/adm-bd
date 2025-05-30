create view todos_gerentes as
SELECT d.cod_gerente
    FROM departamento d
    WHERE d.cod_gerente IS NOT NULL;

SELECT f.nome, f.salario,f.codigo
FROM funcionario f
JOIN departamento d ON f.cod_depto = d.codigo
WHERE f.codigo NOT IN (
    SELECT * from todos_gerentes
)
ORDER BY d.codigo;