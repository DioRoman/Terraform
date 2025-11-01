# ter-homeworks-05

# Задание 1

## tflint

### src

<img width="1376" height="773" alt="457968806-d5905584-ff71-48e4-a95f-e01e80fadf9e" src="https://github.com/user-attachments/assets/62264ee9-8f77-4fca-ae1f-815705185eec" />

_Ошибки: Не используемые переменные (NEW). Отсутствие ограничения на версию провайдера (NEW)._

### passwords

<img width="1392" height="243" alt="457968771-e08bf0c9-b292-4cb8-8384-4af4c55f28b9" src="https://github.com/user-attachments/assets/052fcd3d-1ff5-445c-a4df-b1712ac9d5e1" />

_Ошибки: Отсутствие ограничения на версию провайдера._

### vms

<img width="1688" height="927" alt="457968730-c06fcc30-94e0-47ed-999f-965d15a179f5" src="https://github.com/user-attachments/assets/ae675242-8551-40a5-833c-ed2829dd0a65" />

_Ошибки: Требование указывать хеш коммита, а не имя ветки (main) (NEW). Не используемые переменные. Отсутствие ограничения на версию провайдера._

## checkov

docker pull bridgecrew/checkov

docker run --rm --tty --volume $(pwd):/tf --workdir /tf bridgecrew/checkov --download-external-modules true --directory /tf

### vms

<img width="2173" height="1114" alt="457966857-af9796ac-8a18-4591-a46b-cb5ec75ced93" src="https://github.com/user-attachments/assets/4a81bd3d-2477-4a45-9f9d-a0438e4051f1" />

<img width="1990" height="1316" alt="457966886-e1340053-a272-4993-aa44-1f995b06db21" src="https://github.com/user-attachments/assets/c6fb04c4-c3c1-4123-aae7-42a8ccc6ff4d" />

_Ошибки:_
- обнаружена ВМ без назначенной группы безопасности на сетевом интерфейсе. (ingress, egress) (NEW)
- ВМ имеет публичный IP-адрес, что не соответствует рекомендациям безопасности. (типа надо NAT) (NEW)
- требование указывать хеш коммита или тег, а не имя ветки (main).

### passwords, src  

_Ошибки: Не выявлены._

<img width="2194" height="226" alt="457971693-e026675b-cd35-46fd-8d9b-1c5e5d8c0cd0" src="https://github.com/user-attachments/assets/949e9a51-2889-429c-8266-7b1ee64239a6" />

<img width="1952" height="227" alt="457971759-a3e844af-3631-46a6-83fb-d3ec2886dbf6" src="https://github.com/user-attachments/assets/d503e143-ce4e-4cb2-9d20-f63efd9e9976" />

# Задание 2

Возьмите ваш GitHub-репозиторий с выполненным ДЗ 4 в ветке 'terraform-04' и сделайте из него ветку 'terraform-05'.
Повторите демонстрацию лекции: настройте YDB, S3 bucket, yandex service account, права доступа и мигрируйте state проекта в S3 с блокировками. Предоставьте скриншоты процесса в качестве ответа.

https://github.com/DioRoman/Terraform/tree/main/ter-homeworks-05

S3 Bucket 

<img width="677" height="708" alt="457983458-0fbe30aa-403d-4ca1-96d0-78a326c8feca" src="https://github.com/user-attachments/assets/b6f5b849-cf4c-49ea-a7bc-c876a8ef616f" />

<img width="1289" height="372" alt="457983567-57f127d6-bce9-48df-8c12-5712c024ba16" src="https://github.com/user-attachments/assets/ffbd736d-040d-43ef-9877-ebd12e9bd40e" />

YDB

<img width="1473" height="260" alt="457984013-31e15a6a-5a6e-400b-bf23-f9370ddec514" src="https://github.com/user-attachments/assets/c7fe4eb7-2c56-4bca-abf5-93df90677b06" />

<img width="791" height="264" alt="457983842-089409fc-e3cf-4cc0-be5a-fa5f061d4405" src="https://github.com/user-attachments/assets/afb64e84-6c3a-43ce-9c5b-e93674357b93" />

Пришлите ответ об ошибке доступа к state.

<img width="1273" height="441" alt="457984610-6621bb44-5cf8-47b6-a7cc-7abddadf1a6c" src="https://github.com/user-attachments/assets/ff3c4808-c86a-4777-9a09-37756afa5f6b" />

Принудительно разблокируйте state. Пришлите команду и вывод.

<img width="1139" height="253" alt="457984903-cf5344ba-1999-4e1c-8188-d953c1f2b69a" src="https://github.com/user-attachments/assets/7ad1aa52-b4e2-48a7-82bd-e885f3ed8404" />

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

<img width="890" height="426" alt="458004863-01b31fdb-dfbd-4431-8a3a-5d55c1d5c4c5" src="https://github.com/user-attachments/assets/01e1a7bc-0e32-48c8-847a-003129dda3c2" />

<img width="945" height="472" alt="458004903-21b22b66-a62b-4223-a8df-7d3b2003a61c" src="https://github.com/user-attachments/assets/3740ff16-2010-4a11-a908-fd5789dee70e" />

<img width="982" height="770" alt="458004946-23e72e47-e54f-48bb-8f3b-db6497b2b6be" src="https://github.com/user-attachments/assets/8675b1e4-6810-4c1e-871f-30b31210169b" />

# Задание 5*

Всё тут:

https://github.com/DioRoman/ter-homeworks-05/blob/5.0/src/validation_vars.tf

<img width="877" height="675" alt="458014753-c49ec8d9-ddb2-484d-b476-c89721b5ba89" src="https://github.com/user-attachments/assets/68a070ee-48c6-4be9-837d-7efc08ab393e" />
