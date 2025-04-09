
DROP TABLE IF EXISTS atividade_projeto;
DROP TABLE IF EXISTS atividade;
DROP TABLE IF EXISTS projeto;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS departamento;



CREATE TABLE departamento (
    codigo SERIAL PRIMARY KEY,
    descricao VARCHAR(100),
    cod_gerente INT
    -- A FK para funcionario será adicionada depois (para evitar referência circular)
);

CREATE TABLE funcionario (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    sexo CHAR(1),
    dt_nasc DATE,
    salario DECIMAL(10,2),
    cod_depto INT,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Agora que funcionario existe, podemos adicionar a FK de gerente no departamento
ALTER TABLE departamento
ADD CONSTRAINT fk_gerente FOREIGN KEY (cod_gerente) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE;

CREATE TABLE projeto (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    cod_depto INT,
    cod_responsavel INT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_depto) REFERENCES departamento(codigo) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE atividade (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    cod_responsavel INT,
    data_inicio DATE,
    data_fim DATE,
    FOREIGN KEY (cod_responsavel) REFERENCES funcionario(codigo) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE atividade_projeto (
    cod_projeto INT,
    cod_atividade INT,
    PRIMARY KEY (cod_projeto, cod_atividade),
    FOREIGN KEY (cod_projeto) REFERENCES projeto(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (cod_atividade) REFERENCES atividade(codigo) ON DELETE CASCADE ON UPDATE CASCADE
);