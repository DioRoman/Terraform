# ter-homeworks-main-03

# Задание 1

<img width="1269" height="747" alt="455173318-9b749cb0-c063-4500-976a-d7dbb36777de" src="https://github.com/user-attachments/assets/d37e88a1-fbee-4635-a33c-8e31765d9f89" />

# Задание 2

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/count-vm.tf

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/for_each-vm.tf

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/vm.variables.tf

<img width="2420" height="324" alt="455174133-8cb5987a-8382-4c9d-a594-4070d663b0ec" src="https://github.com/user-attachments/assets/af238203-c042-441a-a013-78ddfb0be05b" />

# Задание 3

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/disk_vm.tf

# Задание 4

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/ansible.tf 

_(тестировал закомментированную часть, вторая часть еще не протестирована)_

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/ansible.tftpl

<img width="903" height="244" alt="455175278-ca040c2a-3850-4fa5-9d54-47753d12c3ea" src="https://github.com/user-attachments/assets/d684475c-83f1-4cac-b4b3-590dacbdc22a" />

# Задание 5

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/outputs.tf

<img width="731" height="655" alt="455175759-3430ac56-935c-4a63-bdb7-ac0696b93380" src="https://github.com/user-attachments/assets/d387ee2e-7036-4839-8906-9746b69f4606" />

_(в задании требовалость только для count и for each_

<img width="625" height="1017" alt="Снимок экрана 2025-11-01 001834" src="https://github.com/user-attachments/assets/aa888a5e-7352-45a7-b5fb-7aad923f37eb" />

_(но я сделал и для storage)_

# Задание 6

_Не успел, но сделал заготовки._

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/ansible-start.tf

https://github.com/DioRoman/Terraform/blob/main/ter-homeworks-03/src/test.yml

# Задание 7
```
{
  network_id = "enp7i560tb28nageq0cc"
  subnet_ids = concat(slice(["e9b0le401619ngf4h68n", "e2lbar6u8b2ftd7f5hia", "b0ca48coorjjq93u36pl", "fl8ner8rjsio6rcpcf0h"], 0, 2), slice(["e9b0le401619ngf4h68n", "e2lbar6u8b2ftd7f5hia", "b0ca48coorjjq93u36pl", "fl8ner8rjsio6rcpcf0h"], 3, 4))
  subnet_zones = concat(slice(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"], 0, 2), slice(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"], 3, 4))
}
```
# Задание 8
```
[webservers]
%{~ for i in webservers ~}
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"] platform_id=${i["platform_id "]}}
%{~ endfor ~}
```

_Лишний пробел в platform_id:
В строке ${i["platform_id "]} есть лишний пробел перед закрывающей кавычкой.
Должно быть: ${i["platform_id"]}_

_Пропущена закрывающая фигурная скобка } после nat_ip_address:
В строке ansible_host=${i["network_interface"][0]["nat_ip_address"] нет закрывающей }._

# Задание 9
```
locals {
  rc_list_filtered = [
    for i in range(1, 97) : format("rc%02d", i)
    if !contains([0, 7, 8, 9], i % 10) || i == 19
  ]
}
```
