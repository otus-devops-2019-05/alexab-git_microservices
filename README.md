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

# Выполнено ДЗ №15
 - [x] Устройство Gitlab CI. Построение процесса непрерывной поставки.

### В процессе сделано:
 - Создал новую ветку gitlab-ci-1 в репозитории alexab_microservices в организации DevOps 2019-05;
 - Развернул Gitlab CI при помощи docker-machine на google cloud. Cкрипт развертывания tools/dhost-gitlab.sh;
 - Настроил Gitlab CI  согласно инструкции;
 - Создал группу и проект, проверил работоспособность  git push gitlab gitlab-ci-1;
 - Определил CI/CD Pipeline для проекта в файле .gitlab-ci.yml;
 - Создал, зарегистрировал  и запустил runner;
 - Добавил тестирование приложения reddit в pipeline;
 - Добавил окружения dev, staging, production;
 - Добавил в описание pipeline директиву, которая не позволит выкатить на staging и production код, не помеченный с помощью тэга в git.
 - Добавил директива only, которая проверяет наличие тэга;
 - Определил динамические окружения с помощью переменных, доступных в .gitlab-ci.yml;

### Задание со *
 - Задал переменные окружения в GitLab-СI: CI_REGISTRY, CI_REGISTRY_IMAGE, CI_REGISTRY_PASSWORD, CI_REGISTRY_USER;
 - Добавил Dockerfile для сборки образа приложения;
 - Создал репозиторий xyzuser/gitlabci на dockerhub;
 - Добавил сборку докер-образа в stage build .gitlab-ci.yml;
 - Добавил запуск контейнера в deploy_job .gitlab-ci.yml;
 - Интегрировал GitaLab-ci и канал https://devops-team-otus.slack.com/messages/CKE8HGVH7;
 - Автоматизировал развертывание и регистрацию Gitlab CI Runner с помощью terraform и ansible playbook. Настройки terraform и плей-бук ansible находятся в директории gitlab/infra.


### PR checklist
 - [x] Выставил label с темой домашнего задания

# Выполнено ДЗ №16
 - [x] Введение в мониторинг.Системы мониторинга.

### В процессе сделано:
 - Создал новую ветку monitoring-1 в репозитории alexab_microservices в организации DevOps 2019-05;
 - Создадал правило фаервола для Prometheus и Puma;
 - Создадал Docker хост в GCE;
 - Запустил контейнер с Prometheus, изучил Targets и метрики;
 - Переупорядочил структуру директорий, переместил docker-monolith в директорию docker, создал директорию monitoring;
 - Создал докер-образ prometheus c конфигурацией prometheus.yml;
 - Создал докер-образы микросервисов приложения с помощью {ui,post-py,comment}/docker_build.sh;
 - Определил в docker/docker-compose.yml все сервисы, включая мониторинг;
 - Проверил запуск микросервисов, список endpoint-ов и healthchecks;
 - Проверил отображение остановки сервиса в Prometheus после выполнения комманды docker-compose stop post;
 - Добавил Node экспортер для сбора информации о работе Docker хоста;
 - Пересоздал и проверил сервисы;
 - Проверил мониторинг с помощью нагрузки на CPU;
 - Закачал все докер-образы на DockerHub.

### Задание со *
 - Добавил в Prometheus мониторинг MongoDB с использованием экспортера percona MongoDB Exporter;
 - Добавил в Prometheus мониторинг сервисов comment, post, ui с помощью blackbox экспортера;
 - Написал Makefile для сборки и закачки образов сервисов comment, post, ui, promethues.
 
### PR checklist
 - [x] Выставил label с темой домашнего задания

# Выполнено ДЗ №17
 - [x] Мониторинг приложения и инфраструктуры.

### В процессе сделано:
 - Создал новую ветку monitoring-2 в репозитории alexab_microservices в организации DevOps 2019-05;
 - Разделил docker-compose.yml на docker-compose-monitoring.yml с сервисами мониторинга и docker-compose.yml с сервисами приложения;
 - Добавил cAdvisor в dockercompose-monitoring.yml и проверил работоспособность;
 - Добавил Grafana в dockercompose-monitoring.yml и проверил работоспособность;
 - Импортировал дашборд Docker and system monitoring;
 - Создал дашборды: UI_Service_Monitoring и Business_Logic_Monitoring;
 - Интегрировал Alertmanager и Prometheus;
 - Интегрировал Alertmanager и тестовый слак канал;
 - Проверил отработку правил Alertmanager.

### Задание со *
 - Внёс в Makefile билд и публикацию добавленных в этом ДЗ сервисов;
 - Запустил сбор метрик из Docker Engine в Prometheus, выбрал готовый дашборд Docker Engine Metrics. Cadvisor собирает больше метрик, чем Docker Engine Metrics;
 - Запустил сбор метрик с помощью Telegraf, выбрал готовый дашборд System Metrics - Single. Telegraf имеет большое количествор плагинов, может собирать данные не только с системы, но и с приложений;
 - Настраивать интеграцию Alertmanager с email не стал, так как либо нужно вносить изменения в grafana.ini вручную, что противоречит IAC, либо хранить email и пароль в публичном репозитарии. Можно записать логин и пароль в файл переменных окружения .env, но это тоже не очень хорошее решение. В качестве решения можно предложить дополнительный smtp-relay, созданные специально для отсылки почты из grafna. Внести в конфигурационный файл docker-compose контейнера grafa переменную окружения GF_SMTP_HOST с именем хоста smtp-relay.

### Задание с **
 - Добавил в образ grafana дашбордов и настройку источника данных;
 - Добавил сбор метрик в Prometheus из Stackdriver с помощью докер образа stackdriver-exporter. Экспортировал compute.googleapis.com/instance/cpu,compute.googleapis.com/instance/disk;
 - Добавил в код приложения бизнес-метрику - количество голосов. В дашборд Business_Logic_Monitoring добавил график: среднее количество голосов на пост за сутки.

### Задание с ***
 - Установил Trickster - кеширующий прокси от Comcast. Перенастроил график дашборда на использование Trickster;
 -  
 
### PR checklist
 - [x] Выставил label с темой домашнего задания


# Выполнено ДЗ №18
 - [x] Логирование и распределенная трассировка.

### В процессе сделано:
 - Создал новую ветку logging-1 в репозитории alexab_microservices в организации DevOps 2019-05;
 - Обновил код в директории **/src** из gist, пересобрал докер-образы контейнеров приложения reddit с тэгом logging;
 - Создал конфигурация docker-compose-logging.yml для сервисов логгирования;
 - Создал конфигурацию fluent.conf и Dockerfile довкер-образа fluentd;
 - Проверил сбор логов с помощью веб-интерфейса kibana;
 - Добавил фильтр для парсинга json логов, приходящих от post-сервиса, в конфиг fluentd. Проверил результат;
 - По аналогии с post сервисом определил для ui-сервиса драйвер для логирования fluentd;
 - Добавил в fluentd.conf парсинг лога ui-сериса на основе регулярных выражений. Проверил рузультат в kibana;
 - Добавил в fluentd.conf парсинг лога ui-сериса на основе grok-шаблонов. Проверил рузультат в kibana;
 - Добавил в compose-файл для сервисов логирования сервис распределенного трейсинга Zipkin;
 - Посмотрел, как запрос шел через систему микросервисов и каково общее время обработки запроса у нашего приложения при запросе;

### Задание со *
 - Составил конфигурацию fluentd так, чтобы разбирались оба формата логов ui-сервиса одновременно;
 - Скачал и установил код приложения reddit с ошибкой для тренировки поиска проблем произовдительности при помощи Zipkin. Трейс показал, что задержка в ui_app: get составляем более 3-х секунд. Открыв детализацию, увидел что проблема в микросервисе post, функция db_find_single_post выполнялась ~3 секунды. В коде этой функции найдена ошибка: вызов time.sleep(3).

 
### PR checklist
 - [x] Выставил label с темой домашнего задания


