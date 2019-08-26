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
 - [x] Docker-образы. Микросервисы.

### В процессе сделано:
 - Создал новую ветку docker-3 в репозитории alexab_microservices в организации DevOps 2019-05;
 - Создал новую структуру внутри репозитория: src/post-py, src/comment, src/ui;
 - Создал в src/post-py, src/comment, src/ui Dockerfile с описанием сервисов;
 - Создал для каждого из сервисов докер-образ. Сборка образа ui началась не с первого шага, так как использовался кеш от сборки сервиса comment; 
 - Запустил контейнеры, используя bridge-сеть reddit и сетевые алиасы для взаимодействия;
 - Проверил работоспособность;
 
### Задание со *
 - Остановил контейнеры с помощью docker kill $(docker ps -q);
 - Запустил контейнеры с другими сетевыми алиасами;
 - При запуске контейнеров (docker run) задал переменные окружения, соответствующие новым сетевым алиасам без пересоздания образа. Создал скрипт для запуска tools/drun-new-aliace.sh;
 - Пересобрал докер-образы, используя Alpine Linux, для уменьшения размера;
 - Провел оптимизацию Dockerfile сервисов;

### PR checklist
 - [x] Выставил label с темой домашнего задания

# Выполнено ДЗ №14
 - [x] Docker: сети, docker-compose.

### В процессе сделано:
 - Создал новую ветку docker-4 в репозитории alexab_microservices в организации DevOps 2019-05;
 - Запустил контейнер с использованием none-драйвера;
 - Запустил несколько раз с помощью docker run один и тот же докер-образ nginx с использованием host network-драйвера. В результате запущенным оказался только один экземпляр контейнера, так как остальные экземпляры пытались получить доступ к сокету host_ip:http, занятому первым экземпляром контейра;
```code
    2019-08-24T11:38:48.602334467+03:00 network connect bc0e976f1f7cbda6273249e6f7bb2d8512d5e3e9afe8d5e3ada2bdc1670bab7f (container=6953f4c435ba7482d45af158f68cb2022a4de1d611bd08c04698c905778de609, name=host, type=host)
    2019-08-24T11:38:48.968919761+03:00 container start 6953f4c435ba7482d45af158f68cb2022a4de1d611bd08c04698c905778de609 (image=nginx, maintainer=NGINX Docker Maintainers <docker-maint@nginx.com>, name=agitated_villani)
    2019-08-24T11:38:51.580303267+03:00 container die 6953f4c435ba7482d45af158f68cb2022a4de1d611bd08c04698c905778de609 (exitCode=1, image=nginx, maintainer=NGINX Docker Maintainers <docker-maint@nginx.com>, name=agitated_villani)
    2019-08-24T11:38:51.586863781+03:00 network disconnect bc0e976f1f7cbda6273249e6f7bb2d8512d5e3e9afe8d5e3ada2bdc1670bab7f (container=6953f4c435ba7482d45af158f68cb2022a4de1d611bd08c04698c905778de609, name=host, type=host)
    
    NETWORK ID          NAME                DRIVER              SCOPE
    bc0e976f1f7c        host                host                local
```
 - Добавил в скрпит запуска микросервисов tools/drun.sh разделение на front и back сети, присвоил каждому из запускаемых контейнеров имя. Проверил работоспособность;
 - Установил на docker-host bridge-utils, изучил вывод коммнад brctl show, iptables -nL -t nat
 - Установил docker-compose на локальную машину;
 - Собрал образы приложения reddit с помощью docker-compose;
 - Запустил приложение reddit с помощью dockercompose;
 - Изменил docker-compose под кейс с множеством сетей, сетевых алиасов, параметризировал с помощью переменных окружения порт публикации сервиса ui, версии сервисов, сетевые настройки;
 - Проверил работоспособность;
 - При запуске контейнеров docker-compose формирует имя контейнера, используя перфикс. Префикс - базовое имя проекта, по умолчанию наименование директории, содержащей docker-compose.yml. Имя проекта можно переопредилить с помощью переменной окружения COMPOSE_PROJECT_NAME или задать в коммандной строке docker-compose --project-name MY_PROJECT_NAME;

 

### Задание со *
 - Создал docker-compose.override.yml для reddit проекта;
 - Переопределил комманду запуска puma для контейнеров ui и comment на puma --debug -w 2 в docker-compose.override.yml;
 - Изменять код каждого из приложений, не выполняя сборку образа можно с помощью монтирования кода как том (volume).

### PR checklist
 - [x] Выставил label с темой домашнего задания

