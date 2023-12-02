# Task Scheduling with Ruby
#### Este projeto consiste numa tentativa de aprender sobre agendamento de tarefas e execução de trabalhos em segundo plano através de uma fila de trabalhos, implementando um sistema de agendamento de tarefas utilizando uma fila, possibilitando a execução assíncrona de tarefas e o processamento de trabalhos em segundo plano.

# Estrutura do projeto
### Principais frameworks e bibliotecas utilizados
- **Sinatra:** é um framework web para Ruby que oferece DSL simples para definir rotas e manupular solicitações HTTP. No projeto é usado para definir rotas, gerenciar solicitações HTTP e renderizar visualizações.
- **Sidekiq:** Sidekiq é uma biblioteca para o processamento de filas em Ruby. Oferece uma maneira eficiente e assíncrona de realizar trabalhos em segundo plano. No projeto ele é usado justamente para que terefas sejam agendadas e executadas de forma assíncrona, melhorando a eficiência da aplicação.
- **Redis:** É um serviço de armazenamento de estrutura de dados em meória, que pode ser usado como banco de dados. No projeto é usado como o backend para o Sidekiq, armazenando as filas das tarefas.
- **Rack:** É uma interface entre servidores web e aplicativos Ruby. No projeto é utilizado para configurar como a aplicação Sinatra interage com o servidor web.
  
### Principais arquivos e funcionalidades
- **app.rb:** Define uma aplicação web usando Sinatra. Inclui uma rota POST para agendar tarefas e um rota GET para exibir a página inicial.
- **config.rb:** Configura o Sidekiq para usar Redis como backend para armazenar as filas de tarefas. Também define parâmetros de tamanho da piscina de conexões e tempo limite de rede.
- **config.ru:** Configura o Rack para executar a aplicação Sinatra definida em app.rb
- **tasks.rb:** Define uma classe SimpleTask que inclui Sidekiq::Worker. Representa uma uma tarefa que pode ser processadas em segundo plano pelo Sidekiq. O método perform contém a lógica que será executada quando a tarefa for processada.
