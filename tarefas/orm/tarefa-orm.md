# Verificar containers ativos

docker ps -a
cdca75aa6af8 dpage/pgadmin4 "/entrypoint.sh" 7 minutes ago Up 7 minutes 0.0.0.0:80->80/tcp, :::80->80/tcp, 443/tcp pgadmin
05aa76bf5cf6 postgres:latest "docker-entrypoint.s…" 9 minutes ago Up 9 minutes 0.0.0.0:5432->5432/tcp, :::5432->5432/tcp postgres_db

# iniciar um container no docker

docker start <nome_ou_id_do_container>
docker start postgres_db

# criar o container do banco de dados

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

## criar container do pgadmin

docker run --name pgadmin \
 -e PGADMIN_DEFAULT_EMAIL=admin@admin.com \
 -e PGADMIN_DEFAULT_PASSWORD=admin123 \
 -p 80:80 \
 --link postgres_db:db \
 -d dpage/pgadmin4

email:admin@admin.com
password:admin123
porta:localhot:80

[Esquema_SQL](./esquema_bd.sql)

## Resumo ODBC

ODBC (Open Database Connectivity) funciona como uma ponte ou tradutor entre um software e diferentes sistemas de banco de dados. Isso permite que um programa — independentemente da linguagem de programação utilizada, como Python, Java, Excel, entre outras — conecte-se a vários bancos de dados distintos utilizando uma única linguagem padrão: o SQL.

O funcionamento do ODBC baseia-se no uso de comandos SQL padronizados. Quando o programa envia uma consulta SQL, o ODBC utiliza drivers específicos para cada banco de dados para traduzir esses comandos genéricos para a linguagem particular de cada sistema. Dessa forma, o banco de dados entende e executa as operações solicitadas, e os resultados das consultas (queries) são retornados ao programa através do mesmo caminho,simplifica a comunicação entre aplicações e bancos de dados.

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

## Resumo ORM

resumo orm em python
