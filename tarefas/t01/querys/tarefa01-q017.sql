create view gerentes as
	select f.nome,f.codigo,f.salario,d.codigo as cod_dep from funcionario f
join departamento d on f.codigo=d.cod_gerente;

create view gerente_mais_rico as
	select g.nome,g.codigo,g.cod_dep from gerentes g
where g.salario = (select max(salario) from gerentes);


select p.codigo,p.descricao from projeto p
join gerente_mais_rico gmr on p.cod_depto = gmr.cod_dep;
