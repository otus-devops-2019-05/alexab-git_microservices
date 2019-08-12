# Выполнено ДЗ №12
 - [] Технология контейнеризации. Введение в Docker.

### В процессе сделано:
 - Создал новую ветку docker-2 в репозитории alexab_microservices в организации DevOps 2019-05;
 - В новой ветке создал директорию dockermonolith;
 - Установил docker;
 - Запустил контейнер docker hello-world;
 - Изучил работу docker run, dosker ps, docker start, docker attach, docker exec, docker commit, docker kill, docker stop, docker system df, docker rm, docker rmi;
 - Записал вывод команды docker images в файл docker-monolith/docker-1.log;
 - Установил docker-machine;
 - Вывод docker run --rm -ti tehbilly/htop - используется namespace контейнера, в котором запущен htop с pid равным еденице;
 - Вывод docker run --rm --pid host -ti tehbilly/htop - используется namespace хоста, в котором запущен коньтейнер с htop, показаные все процессы хоста; 
 
### Задание со *
 - Сравнил вывод двух команд docker inspect <u_container_id> и docker inspect <u_image_id>;
 
### PR checklist
 - [x] Выставил label с темой домашнего задания

