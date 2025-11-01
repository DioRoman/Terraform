# ter-homeworks-main-01

## Установка Terraform 

```
apt update
apt install gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt update
apt install terraform
```

<img width="814" height="248" alt="448576023-f59db309-689c-42ef-b441-926abba9ac87" src="https://github.com/user-attachments/assets/5f5e72bc-64aa-45f4-84b3-7a0aa9ba1062" />

## Задание 1

Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.

`cd /mnt/c/Users/Dio/Netology/ter-homeworks/01/src`

`terraform init`

Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

`personal.auto.tfvars`

Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

`terraform apply`

Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

`terraform validate`

_У resource не было задано уникальное имя. А другое имя было неправильное._

Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.

<img width="1582" height="284" alt="448576340-267679ef-0aea-40a6-8f04-3ca8413c79cb" src="https://github.com/user-attachments/assets/cd6b9023-ad5e-4363-a25f-a84f5a6f9483" />

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-01/main.tf

Замените имя docker-контейнера в блоке кода на hello_world. Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". Выполните команду terraform apply -auto-approve.

`terraform apply -auto-approve`

Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. Догадайтесь или нагуглите зачем может пригодиться данный ключ? В качестве ответа дополнительно приложите вывод команды docker ps.

_Опасность в отсутвии проверки перед запуском. Пригодиться может в CI/CD автодоставке._

Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.

`terraform destroy`

`cat terraform.tfstate`

<img width="1275" height="655" alt="448579209-57429ac0-27c5-4cdb-819f-f59e407acab5" src="https://github.com/user-attachments/assets/bc43d983-0de9-4e81-b8e5-8328443a232e" />

Объясните, почему при этом не был удалён docker-образ nginx:latest. Ответ ОБЯЗАТЕЛЬНО НАЙДИТЕ В ПРЕДОСТАВЛЕННОМ КОДЕ, а затем ОБЯЗАТЕЛЬНО ПОДКРЕПИТЕ строчкой из документации terraform провайдера docker. (ищите в классификаторе resource docker_image )

_Optional
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation._

Задание 2

Создайте в облаке ВМ.

<img width="1753" height="221" alt="448579842-e4956a2d-1c4b-4261-8efa-e3cda101769b" src="https://github.com/user-attachments/assets/4ca028a7-aed5-4f36-86cd-3f97fd42b191" />

Подключитесь к ВМ по ssh и установите стек docker.

```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

```
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
`sudo apt-get update`

`sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y`

`sudo docker run hello-world`

`gpasswd -a dio docker`

Найдите в документации docker provider способ настроить подключение terraform на вашей рабочей станции к remote docker context вашей ВМ через ssh.
Используя terraform и remote docker context, скачайте и запустите на вашей ВМ контейнер mysql:8 на порту 127.0.0.1:3306, передайте ENV-переменные.
Сгенерируйте разные пароли через random_password и передайте их в контейнер, используя интерполяцию из примера с nginx.(name  = "example_${random_password.random_string.result}" , двойные кавычки и фигурные скобки обязательны!)
Зайдите на вашу ВМ , подключитесь к контейнеру и проверьте наличие секретных env-переменных с помощью команды env. Запишите ваш финальный код в репозиторий.

`docker exec -it mysql /bin/bash`

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-01/main.tf

<img width="1365" height="807" alt="448581080-6c869c86-d373-49c7-9286-f3f207775bf0" src="https://github.com/user-attachments/assets/5cf350d5-a234-48c9-bbf0-a79d2cae54df" />

<img width="1341" height="491" alt="448581033-4144a993-e346-4c28-a98d-e7f5442d2d27" src="https://github.com/user-attachments/assets/05639349-9572-4782-80a7-72d6edf0b1f5" />

Задание 3*

Установите opentofu(fork terraform с лицензией Mozilla Public License, version 2.0) любой версии

`curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh`

`chmod +x install-opentofu.sh`

`./install-opentofu.sh --install-method deb`

`rm -f install-opentofu.sh`

Попробуйте выполнить тот же код с помощью tofu apply, а не terraform apply.

`cd /mnt/c/Users/Dio/Netology/ter-homeworks/01/src`

`tofu init -upgrade`

`tofu apply`

<img width="1420" height="366" alt="448585366-0c8709cb-86bf-46e0-bfe9-970f667dd453" src="https://github.com/user-attachments/assets/f79f90b2-b540-4347-a591-19ca5e132fbf" />

<img width="1364" height="107" alt="448585393-af2b7b55-313f-47fb-9375-282a8cef2e33" src="https://github.com/user-attachments/assets/45f2c3b9-80b8-4d17-aed4-b328d9324440" />
