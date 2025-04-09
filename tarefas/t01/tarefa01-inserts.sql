-- 1. Inserindo departamentos (sem gerente ainda)
INSERT INTO departamento (descricao) VALUES
('Tecnologia da Informação'),
('Recursos Humanos'),
('Financeiro'),
('Marketing'),
('Logística');

-- 2. Inserindo funcionários (cada um em um departamento diferente)
INSERT INTO funcionario (nome, sexo, dt_nasc, salario, cod_depto) VALUES
('Alice Souza', 'F', '1990-05-10', 6000.00, 1),
('Bruno Lima', 'M', '1988-03-22', 5800.00, 2),
('Carlos Silva', 'M', '1985-07-13', 7000.00, 3),
('Daniela Rocha', 'F', '1992-10-01', 6200.00, 4),
('Eduardo Martins', 'M', '1989-11-25', 6400.00, 5);

-- 3. Atualizando departamentos com seus respectivos gerentes (funcionários inseridos acima)
UPDATE departamento SET cod_gerente = 1 WHERE codigo = 1;
UPDATE departamento SET cod_gerente = 2 WHERE codigo = 2;
UPDATE departamento SET cod_gerente = 3 WHERE codigo = 3;
UPDATE departamento SET cod_gerente = 4 WHERE codigo = 4;
UPDATE departamento SET cod_gerente = 5 WHERE codigo = 5;

-- 4. Inserindo projetos
INSERT INTO projeto (nome, descricao, cod_depto, cod_responsavel, data_inicio, data_fim) VALUES
('Sistema de Atendimento', 'Plataforma para chamados internos', 1, 1, '2025-01-01', '2025-06-01'),
('Portal RH', 'Sistema de gerenciamento de colaboradores', 2, 2, '2025-02-01', '2025-07-01'),
('Controle Orçamentário', 'Gerenciamento financeiro', 3, 3, '2025-03-01', '2025-08-01'),
('Campanha Publicitária', 'Divulgação institucional', 4, 4, '2025-04-01', '2025-09-01'),
('Sistema de Estoque', 'Controle de logística e produtos', 5, 5, '2025-05-01', '2025-10-01');

-- 5. Inserindo atividades
INSERT INTO atividade (nome, descricao, cod_responsavel, data_inicio, data_fim) VALUES
('Levantamento de Requisitos', 'Entrevistas e coleta de dados', 1, '2025-01-05', '2025-01-20'),
('Triagem de Currículos', 'Filtragem de candidatos', 2, '2025-02-05', '2025-02-15'),
('Análise Financeira', 'Avaliação de custos e receitas', 3, '2025-03-05', '2025-03-20'),
('Criação de Arte', 'Design de material publicitário', 4, '2025-04-05', '2025-04-25'),
('Organização de Estoque', 'Classificação e inventário', 5, '2025-05-05', '2025-05-20');

-- 6. Relacionando atividades aos projetos
INSERT INTO atividade_projeto (cod_projeto, cod_atividade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

