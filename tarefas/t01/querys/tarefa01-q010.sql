select p.nome,d.descricao,f.nome from projeto p
left join funcionario f on f.codigo=p.cod_responsavel 
left join departamento d on p.cod_depto=d.codigo;
