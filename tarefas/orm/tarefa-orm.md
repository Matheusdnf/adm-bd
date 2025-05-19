# Verificar containers ativos
docker ps -a
cdca75aa6af8   dpage/pgadmin4    "/entrypoint.sh"         7 minutes ago   Up 7 minutes   0.0.0.0:80->80/tcp, :::80->80/tcp, 443/tcp   pgadmin
05aa76bf5cf6   postgres:latest   "docker-entrypoint.s…"   9 minutes ago   Up 9 minutes   0.0.0.0:5432->5432/tcp, :::5432->5432/tcp    postgres_db

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







## Resumo ODBC


## Resumo ORM