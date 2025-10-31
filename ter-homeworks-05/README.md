# ter-homeworks-05

# Задание 1

## tflint

### src

![Снимок экрана 2025-06-23 180629](https://github.com/user-attachments/assets/d5905584-ff71-48e4-a95f-e01e80fadf9e)

_Ошибки: Не используемые переменные (NEW). Отсутствие ограничения на версию провайдера (NEW)._

### passwords

![Снимок экрана 2025-06-23 180647](https://github.com/user-attachments/assets/e08bf0c9-b292-4cb8-8384-4af4c55f28b9)

_Ошибки: Отсутствие ограничения на версию провайдера._

### vms

![Снимок экрана 2025-06-23 180502](https://github.com/user-attachments/assets/c06fcc30-94e0-47ed-999f-965d15a179f5)

_Ошибки: Требование указывать хеш коммита, а не имя ветки (main) (NEW). Не используемые переменные. Отсутствие ограничения на версию провайдера._

## checkov

docker pull bridgecrew/checkov

docker run --rm --tty --volume $(pwd):/tf --workdir /tf bridgecrew/checkov --download-external-modules true --directory /tf

### vms

![Снимок экрана 2025-06-23 175925](https://github.com/user-attachments/assets/af9796ac-8a18-4591-a46b-cb5ec75ced93)

![Снимок экрана 2025-06-23 175938](https://github.com/user-attachments/assets/e1340053-a272-4993-aa44-1f995b06db21)

_Ошибки:_
- обнаружена ВМ без назначенной группы безопасности на сетевом интерфейсе. (ingress, egress) (NEW)
- ВМ имеет публичный IP-адрес, что не соответствует рекомендациям безопасности. (типа надо NAT) (NEW)
- требование указывать хеш коммита или тег, а не имя ветки (main).

### passwords, src  

_Ошибки: Не выявлены._

![Снимок экрана 2025-06-23 175740](https://github.com/user-attachments/assets/e026675b-cd35-46fd-8d9b-1c5e5d8c0cd0)

![Снимок экрана 2025-06-23 175837](https://github.com/user-attachments/assets/a3e844af-3631-46a6-83fb-d3ec2886dbf6)

# Задание 2

Возьмите ваш GitHub-репозиторий с выполненным ДЗ 4 в ветке 'terraform-04' и сделайте из него ветку 'terraform-05'.
Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.

https://github.com/DioRoman/ter-homeworks-05

S3 Bucket 

![Снимок экрана 2025-06-23 041933](https://github.com/user-attachments/assets/0fbe30aa-403d-4ca1-96d0-78a326c8feca)

![Снимок экрана 2025-06-23 050704](https://github.com/user-attachments/assets/57f127d6-bce9-48df-8c12-5712c024ba16)

YDB

![Снимок экрана 2025-06-23 183958](https://github.com/user-attachments/assets/31e15a6a-5a6e-400b-bf23-f9370ddec514)

![Снимок экрана 2025-06-23 142930](https://github.com/user-attachments/assets/089409fc-e3cf-4cc0-be5a-fa5f061d4405)

Пришлите ответ об ошибке доступа к state.

![Снимок экрана 2025-06-23 143244](https://github.com/user-attachments/assets/6621bb44-5cf8-47b6-a7cc-7abddadf1a6c)

Принудительно разблокируйте state. Пришлите команду и вывод.

![Снимок экрана 2025-06-23 143920](https://github.com/user-attachments/assets/cf5344ba-1999-4e1c-8188-d953c1f2b69a)

# Задание 3

_В общем ситуация следующая: я проверил свой код и исправил, до того как прочитал требования задания 3. Я же его уже и залил._

_Очень долго все переделывать, но вкратце могу описать:_
- убрал неиспользуемые переменные.
- добавил проверку версий.
- исправил main на конкретный коммит.

_Вот коммиты_

https://github.com/DioRoman/ter-homeworks-05/commit/890bf88698ea15eb20f5596eb7183400a5e462aa
https://github.com/DioRoman/ter-homeworks-05/commit/c6964529568f1c6df3b6a2420f49e5dcfb280ba3

_Ветку 3.0 я создал, но она уже была исправленная._

_Этот коммит в ветку 5.1_

https://github.com/DioRoman/ter-homeworks-05/commit/77d79d8bed2a87cacc7f6934c06f8bdd1e834b84

# Задание 4

https://github.com/DioRoman/ter-homeworks-05/blob/5.0/src/validation_vars.tf

![Снимок экрана 2025-06-23 154810](https://github.com/user-attachments/assets/01b31fdb-dfbd-4431-8a3a-5d55c1d5c4c5)

![Снимок экрана 2025-06-23 154900](https://github.com/user-attachments/assets/21b22b66-a62b-4223-a8df-7d3b2003a61c)

![Снимок экрана 2025-06-23 154950](https://github.com/user-attachments/assets/23e72e47-e54f-48bb-8f3b-db6497b2b6be)

# Задание 5*

Всё тут:

https://github.com/DioRoman/ter-homeworks-05/blob/5.0/src/validation_vars.tf

![Снимок экрана 2025-06-23 155906](https://github.com/user-attachments/assets/c49ec8d9-ddb2-484d-b476-c89721b5ba89)






