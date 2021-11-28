## LAMP-Nginx-PHP7.4-MariaDB

  Esta composição é feita para um servidor LAMP (Nginx + PHP 7.4 + MariaDB)
  
  Ideal para uso de aplicações simples como wordpress entre outros

  ### Estrutura de Diretorios:
	- application --> Pasta local do seu servidor, onde ficará o site, você pode mudar isto ou escolher uma existente
	- db ---> Pasta local do seu servidor, onde ficarão os arquivos do banco de dados, desta forma facilita o backup
	- docker --> Contém os arquivos de congurações dos serviços (nginx e php e locale)
	- Dockerfiles --> Contém os arquivos de Dockerfile para build dos containers
  
  ### Modo de Uso:
   	- Clone esta branch em seu servidor
	- Ajuste os arquivos `./Dockerfiles/NGINX.Dockerfile e ./Dockerfiles/PHP.Dockerfile` para melhor te atender ou acrescentar a implantação automática da sua aplicação
	- Ajuste o docker-compose.yaml para seu banco de dados (database e senha)
	- Execute o compose `docker compose up -d`
