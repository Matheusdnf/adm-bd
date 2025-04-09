create view funcionarios_por_departamento as 
	select count(f.nome) as total_funcionarios ,d.codigo as cod_depto   from funcionario f
    	left join departamento d on d.codigo=f.cod_depto 
    	group by d.codigo;
select 
    d.descricao,
    f.nome AS gerente,
     COALESCE(fd.total_funcionarios, 0)
from departamento d
left join funcionario f on f.codigo = d.cod_gerente
left join funcionarios_por_departamento fd on fd.cod_depto = d.codigo;



