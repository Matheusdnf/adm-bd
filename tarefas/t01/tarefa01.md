[Script Create](tarefa01-create.sql)

[Script Inserts](tarefa01-inserts.sql)

[Scripts Querys](/tarefas/t01/querys/)

# Natural Join

O natural join identifica automaticamente colunas em ambas as tabelas que compartilham o mesmo nome e tipo de dados e realiza uma comparação de igualdade nessas colunas. Isso pode simplificar o código SQL, mas requer cuidado para garantir que as colunas correspondentes realmente tenham um relacionamento lógico.

## Sintaxe Natural Join

    SELECT atributo
    FROM tabela 1
    INNER JOIN tabela 2
    ON tabela1.CustomerID=tabela2.CustomerID;

## Cross Join

O cross join é utilizado para gerar todas as combinações de registros em duas tabelas. Pegando cada linha de uma tabela com cada linha de outra tabela e retornando o produto cartesiano das duas tabelas que são unidas com todas as combinações possíveis entre as linhas.

Sendo uma desvantagem desse join, a quantidade massiva de dados gerados pelo mesmos, tornando as querys mais pesadas em relação a tempo e espaço (memória).

# Sintaxe do Cross Join

    select [nomes das colunas]
    from [TabelaA]
    cross join [Tabela B]

Imagine que temos três tabelas representando opções para montar um buquê:

- **Flores:** rosa, tulipa, girassol
- **Cores:** vermelha, azul, preta
- **Horários de entrega:** manhã, tarde, noite

Com o `CROSS JOIN`, é possível gerar todas as combinações possíveis entre flor, cor e horário — como, por exemplo:  
`Rosa vermelha pela manhã`, `Tulipa azul à noite`, `Girassol preta à tarde`, e assim por diante.

# Sintaxe Das Flores

    SELECT flor.nome, cor.nome, horario.periodo
    FROM flor
    CROSS JOIN cor
    CROSS JOIN horario;

<!-- # Windows Functions no PostgreSQL -->
