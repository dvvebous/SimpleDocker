# Simple Docker

Введение в докер. Разработка простого докер образа для собственного сервера.

## Contents


1. [Chapter I](#chapter-i) \
    1.1. [Готовый докер](#part-1-готовый-докер) \
    1.2. [Операции с контейнером](#part-2-операции-с-контейнером) \
    1.3. [Мини веб-сервер](#part-3-мини-веб-сервер) \
    1.4. [Свой докер](#part-4-свой-докер) \
    1.5. [Dockle](#part-5-dockle) \
    1.6. [Базовый Docker Compose](#part-6-базовый-docker-compose)


## Part 1. Готовый докер
* Взял официальный докер образ с **nginx** и выкачал его при помощи `docker pull`
![](src/SS/Part_1_1.png)

* Проверил наличие докера образа через `docker images`
![](src/SS/Part_1_2.png)
* Запустил докер образа через `docker run -d [image_id|repository]`
![](src/SS/Part_1_3.png)
* Проверил, что образ запустился через `docker ps`
![](src/SS/Part_1_4.png)
* Посмотрел информацию о контейнере через `docker inspect [container_id|container_name]`
![](src/SS/Part_1_5.png)
* По выводу команды определил и поместил в отчёт размер контейнера, список замапленных портов и ip контейнера
 `-` "Size": 186779301
`-`* ip: -
 `-` Ports: -
 `-` Порты не мапили, поэтому порты пустые, ip адрес не назначен

* Остановил докер образ через `docker stop [container_id|container_name]`. Проверил, что образ остановился через `docker ps`
![](src/SS/Part_1_6.png)

* Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*
![](src/SS/Part_1_6_1.png)
* Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
![](src/SS/Part_1_7.png)
* Перезапустил докер контейнер через `docker restart [container_id|container_name]. Проверил, что контейнер запустился
![](src/SS/Part_1_8.png)

## Part 2. Операции с контейнером
##### Прочитать конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*
* ![](src/SS/Part_2_1.png)

##### Создать на локальной машине файл *nginx.conf*
* ![](src/SS/Part_2_2.png)
##### Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**
* ![](src/SS/Part_2_3.png)
##### Скопировать созданный файл *nginx.conf* внутрь докер образа через команду `docker cp`
* ![](src/SS/Part_2_4.png)
##### Перезапустить **nginx** внутри докер образа через команду *exec*
* ![](src/SS/Part_2_5.png)
##### Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
* ![](src/SS/Part_2_6.png)
##### Экспортировать контейнер в файл *container.tar* через команду *export*
* ![](src/SS/Part_2_7.png)
##### Остановить контейнер
* ![](src/SS/Part_2_8.png)
##### Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры
* ![](src/SS/Part_2_9.png)
##### Удалить остановленный контейнер
* ![](src/SS/Part_2_10.png)
##### Импортировать контейнер обратно через команду *import*
* ![](src/SS/Part_2_11.png)
##### Запустить импортированный контейнер
* ![](src/SS/Part_2_12.png)
##### Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
* ![](src/SS/Part_2_13.png)

## Part 3. Мини веб-сервер

##### Написать мини сервер на **C** и **FastCgi**, который будет возвращать простейшую страничку с надписью `Hello World!`
* ![](src/SS/Part_3_1.png)
##### Запустить написанный мини сервер через *spawn-fcgi* на порту 8080
* ![](src/SS/Part_3_2.png)
##### Написать свой *nginx.conf*, который будет проксировать все запросы с 81 порта на *127.0.0.1:8080*
* ![](src/SS/Part_3_3.png)
##### Проверить, что в браузере по *localhost:81* отдается написанная вами страничка
* ![](src/SS/Part_3_4.png)

## Part 4. Свой докер

#### Итоговый докер образ, который:
* ![](src/SS/Part_4_1.png)

##### Собрать написанный докер образ через `docker build` при этом указав имя и тег
* ![](src/SS/Part_4_2.png)
##### Проверить через `docker images`, что все собралось корректно
* ![](src/SS/Part_4_3.png)
##### Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки *./nginx* внутрь контейнера по адресу, где лежат конфигурационные файлы **nginx**'а
* ![](src/SS/Part_4_4.png)
##### Проверить, что по localhost:80 доступна страничка написанного мини сервера
* ![](src/SS/Part_4_5.png)
##### Дописать в *./nginx/nginx.conf* проксирование странички */status*, по которой надо отдавать статус сервера **nginx**
* ![](src/SS/Part_4_1.png)
##### Проверить, что теперь по *localhost:80/status* отдается страничка со статусом **nginx**
* ![](src/SS/Part_4_6.png)


## Part 5. **Dockle**


##### Просканировать образ из предыдущего задания через `dockle [image_id|repository]`

* ![](src/SS/Part_5_1.png)

##### Исправить образ так, чтобы при проверке через **dockle** не было ошибок и предупреждений
* ![](src/SS/Part_5_2.png)

## Part 6. Базовый **Docker Compose**

Вот вы и закончили вашу разминку. А хотя погодите...
Почему бы не поэкспериментировать с развёртыванием проекта, состоящего сразу из нескольких докер образов?

**== Задание ==**

##### Написать файл *docker-compose.yml*, с помощью которого:
##### 1) Поднять докер контейнер из [Части 5](#part-5-инструмент-dockle) _(он должен работать в локальной сети, т.е. не нужно использовать инструкцию **EXPOSE** и мапить порты на локальную машину)_
##### 2) Поднять докер контейнер с **nginx**, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера
##### Замапить 8080 порт второго контейнера на 80 порт локальной машины

##### Остановить все запущенные контейнеры
##### Собрать и запустить проект с помощью команд `docker-compose build` и `docker-compose up`
##### Проверить, что в браузере по *localhost:80* отдается написанная вами страничка, как и ранее
