# Выполнено ДЗ №12
 - [x] Технология контейнеризации. Введение в Docker.

### В процессе сделано:
 - Создал новую ветку docker-2 в репозитории alexab_microservices в организации DevOps 2019-05;
 - В новой ветке создал директорию dockermonolith;
 - Установил docker;
 - Запустил контейнер docker hello-world;
 - Изучил работу docker run, dosker ps, docker start, docker attach, docker exec, docker commit, docker kill, docker stop, docker system df, docker rm, docker rmi;
 - Записал вывод команды docker images в файл docker-monolith/docker-1.log;
 - Установил docker-machine;
 - Вывод docker run --rm -ti tehbilly/htop - используется namespace контейнера, в котором запущен htop с pid равным еденице;
 - Вывод docker run --rm --pid host -ti tehbilly/htop - используется namespace хоста, в котором запущен контейнер с htop, показаные все процессы хоста; 
 
### Задание со *
 - Сравнил вывод двух команд docker inspect <u_container_id> и docker inspect <u_image_id>;
 - Создал директорию docker-monolith\infra, скопировал шаблон  terraform, ansible, packer;
 - Создал ansible playbook docker-ubuntu-minimal-1604.yml для установки необходимых пакетов и docker;
 - Подготовил с помощью packer образ ОС с предустановленным docker;
 - Создал конифигурацию terraform;
 - Создал ansible playbook reddit_on_docker.yml для запуска контейнера, содержащего приложение reddit;
 - Проверил работоспособность.

### PR checklist
 - [x] Выставил label с темой домашнего задания

# Выполнено ДЗ №13
 - [] Docker-образы. Микросервисы.

### В процессе сделано:
 - Создал новую ветку docker-3 в репозитории alexab_microservices в организации DevOps 2019-05;
 - Создал новую структуру внутри репозитория: src/post-py, src/comment, src/ui;
 - Создал в src/post-py, src/comment, src/ui Dockerfile с описанием сервисов;
 - Создал для каждого из сервисов докер-образ;
 
### Задание со *
 - Остановил контейнеры с помощью docker kill $(docker ps -q);
 - Запустите контейнеры с другими сетевыми алиасами;
 - При запуске контейнеров (docker run) задал переменные окружения соответствующие новым сетевым алиасам без пересоздания образа;
 - Проверьте работоспособность сервиса;


### PR checklist
 - [] Выставил label с темой домашнего задания

