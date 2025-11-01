variable "single_ip" {
  type        = string
  description = "ip-адрес"
  default     = "192.168.0.1"

  validation {
    condition     = can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", var.single_ip))
    error_message = "Должен быть указан корректный IPv4 адрес."
  }
}

variable "ip_list" {
  type        = list(string)
  description = "список ip-адресов"
  default     = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]

  validation {
    condition = alltrue([
      for ip in var.ip_list : can(regex("^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$", ip))
    ])
    error_message = "Все адреса в списке должны быть корректными IPv4 адресами."
  }
}

variable "lowercase_string" {
  type        = string
  description = "любая строка без символов верхнего регистра"
  default     = "все символы в нижнем регистре"

  validation {
    condition     = var.lowercase_string == lower(var.lowercase_string)
    error_message = "Строка не должна содержать символов верхнего регистра."
  }
}

variable "in_the_end_there_can_be_only_one" {
  description = "Who is better Connor or Duncan?"
  type = object({
    Dunkan = optional(bool)
    Connor = optional(bool)
  })

  default = {
    Dunkan = true
    Connor = false
  }

  validation {
    condition = (
      (var.in_the_end_there_can_be_only_one.Dunkan == true && 
       var.in_the_end_there_can_be_only_one.Connor == false) ||
      (var.in_the_end_there_can_be_only_one.Dunkan == false && 
       var.in_the_end_there_can_be_only_one.Connor == true)
    )
    error_message = "There can be only one MacLeod."
  }
}