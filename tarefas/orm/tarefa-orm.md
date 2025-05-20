## Resumo ODBC

ODBC (Open Database Connectivity) funciona como uma ponte ou tradutor entre um software e diferentes sistemas de banco de dados. Isso permite que um programa — independentemente da linguagem de programação utilizada, como Python, Java, Excel, entre outras — conecte-se a vários bancos de dados distintos utilizando uma única linguagem padrão: o SQL.

O funcionamento do ODBC baseia-se no uso de comandos SQL padronizados. Quando o programa envia uma consulta SQL, o ODBC utiliza drivers específicos para cada banco de dados para traduzir esses comandos genéricos para a linguagem particular de cada sistema. Dessa forma, o banco de dados entende e executa as operações solicitadas, e os resultados das consultas (queries) são retornados ao programa através do mesmo caminho,simplifica a comunicação entre aplicações e bancos de dados.

### Utilização No Python

No Python, o ODBC é utilizado por meio da biblioteca **pyodbc**, que permite que se conecte a bancos de dados compatíveis com ODBC usando tal interface.

```
import pyodbc

conn = pyodbc.connect(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=localhost;"
    "DATABASE=nome_do_banco;"
    "UID=usuario;"
    "PWD=senha"
)

cursor = conn.cursor()

# Consulta SQL
cursor.execute("SELECT * FROM clientes")

# Resultados
for row in cursor.fetchall():
    print(row)

# Fecha a conexão
conn.close()

```

## Resumo ORM e Aplicação

resumo orm em python

ORM(Mapeamento Objeto-Relacional). Faz a ponte entre bancos de dados relacionais (tabelas, SQL) e linguagens orientadas a objetos (classes, objetos).

- Transforma tabelas em classes

- Transforma linhas em objetos

- Manipula o banco usando a linguagem da sua aplicação, sem precisar escrever SQL diretamente

### Utilização No Django

No Django,a definição é feita na classe de modelos (models) como classes Python que representam tabelas no banco de dados. Cada atributo da classe representa uma coluna da tabela.

`````
from django.db import models

class Funcionario(models.Model):
    nome = models.CharField(max_length=150)
    sexo = models.CharField(max_length=1)
    dt_nasc = models.DateField()
    salario = models.DecimalField(max_digits=10, decimal_places=2)
    supervisor = models.ForeignKey('self', null=True, blank=True, on_delete=models.SET_NULL)
    depto = models.ForeignKey('Departamento', null=True, blank=True, on_delete=models.SET_NULL)

class Departamento(models.Model):
    nome = models.CharField(max_length=100)
    sigla = models.CharField(max_length=10, unique=True)
    descricao = models.TextField()
    gerente = models.ForeignKey(Funcionario, null=True, blank=True, on_delete=models.SET_NULL)

````
`````

# Criar o Container do BD

docker run --name postgres_db \
 -e POSTGRES_USER=usuario \
 -e POSTGRES_PASSWORD=senha123 \
 -e POSTGRES_DB=AtividadesBD \
 -v postgres_data:/var/lib/postgresql/data \
 -p 5432:5432 \
 -d postgres:latest

user_name:usuario
password:senha123
nome_do_banco:AtividadesBD
funcionando:localhost
porta:5432

## Criar Container Pgadmin

docker run --name pgadmin \
 -e PGADMIN_DEFAULT_EMAIL=admin@admin.com \
 -e PGADMIN_DEFAULT_PASSWORD=admin123 \
 -p 80:80 \
 --link postgres_db:db \
 -d dpage/pgadmin4

email:admin@admin.com
password:admin123
porta:localhot:80

## Utilização PG Admin

Entre em **Localhost:80** e insira o login

email:admin@admin.com

password:admin123

porta:localhot:80

# Esquema do Banco De Dados

[Banco_De_Dados](/tarefa_bd/tarefas/orm/esquema_bd.sql)

[Querys](/tarefa_bd/tarefas/orm/querys.sql)

## Driver Para Instalar O postgress no Django

**pip install psycopg2-binary**

## Arquivo Models

[Models](./django/orm_django/app_django/models.py)

### Comandos para executar após criar o models

```
python manage.py makemigrations
python manage.py migrate
```

## Script De Povoamento Do banco

[Povoamento](./django/orm_django/app_django/management/commands/seed.py)

### Comando para realizar o povoamento

**python manage.py seed**

## Rodar Final

Agora rode o django **Python manage.py runserver**

# Teste

E teste as querys nas telas
