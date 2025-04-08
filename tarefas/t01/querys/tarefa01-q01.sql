create view salario_maior_dep2 as
	select f.nome,f.salario from funcionario f 
where (f.salario) > (select avg (f.salario) from funcionario f where (f.cod_depto=2)
);

select * from salario_maior_dep2;