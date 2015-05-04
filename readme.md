# Piter United Portal [![Circle CI](https://circleci.com/gh/Piter-United/puportal.svg?style=svg)](https://circleci.com/gh/Piter-United/puportal)

Агрегатор и информационный рупор инициативы!

Проект по раработке сайта "с открытым кодом" для объединения IT-сообществ
Санкт-Петербург,  который аккумулирует в себе информацию о сообществах,
регулярных встречах (meetups) и  площадках для проведения этих встреч.
Позволит активистам тратить меньше времени на организацию встреч, а
действующим и потенциальным  участникам сообществ всегда быть в курсе жизни
сообществ(а).

### Demo
https://piterunited.herokuapp.com/

#### Кто и как может поучаствовать в разработке?

Если вы хотите присоединиться к разработке, то либо можете написать об этом на
piterunited@gmail.com, либо *явно* взять на себя задачу из
[Isseues](https://github.com/Piter-United/puportal/issues), реализовать ее и
послать [pull request](https://help.github.com/articles/using-pull-requests/).
Все задачи, предполагаемые для выполнения, доступны тут (этот перечень будет
обновляться по мере надобности):
[Isseues](https://github.com/Piter-United/puportal/issues).

#### Scope of Project

*   Управление сообществами (просмотр и поиск, создание сообществ, визитка
    сообщества и т.д.)
*   Управление мероприятиями (единый календарь встреч, страница мероприятия,
    запрос площадки, интеграция и т.д.)
*   Управление площадками (просмотр и поиск площадок, запрос на проведение
    встречи, страница площакди с деталями)
*   Профили участников (регистрация или авторизация через соц. сети,
    принадлежность к сообществам и т.д.)
*   Инфоподдержка встреч (автоматический шаринг по соц. сетям, рассылки и
    т.д.)

#### Roadmap
*   Release 1: Landing, Communities (CRUD), Events (CRUD), Authorization (G+,
    Vk, Fb, Github, LinkedIn)
*   Release 2: Registration Workflow, Permissions for Activists, Places
    (CRUD), User Profile

#### Технические детали проекта:

*   Ruby > 2.2
*   Rails 4.2.0
*   PostgreSQL > 9.3
*   scss, slim, materializecss
    (http://materializecss.com/getting-started.html)

тем кто начинает устанавливать окружение Ruby+Rails только для этого проекта
НЕ советую ставить его через RVM

##### Настройки Postgresql для корректного подключения к БД

*   Юзер: **Mike**
*   База: **punited_dev**

