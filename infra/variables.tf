variable "region" {
  description = "AWS Region"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev, prd)"
  type        = string
}

variable "delay_seconds" {
  description = "Quantidade de segundos para atraso na entrega da mensagem"
  type        = number

  validation {
    condition     = var.delay_seconds >= 0 && var.delay_seconds <= 900
    error_message = "O valor de delay_seconds deve estar entre 0 e 900 segundos."
  }
}

variable "max_message_size" {
  description = "Tamanho máximo da mensagem em bytes"
  type        = number

  validation {
    condition     = var.max_message_size >= 1 && var.max_message_size <= 262144
    error_message = "O valor de max_message_size deve estar entre 1 e 262144 bytes."
  }
}

variable "message_retention_seconds" {
  description = "Tempo de retenção da mensagem na fila em segundos"
  type        = number

  validation {
    condition     = var.message_retention_seconds >= 60 && var.message_retention_seconds <= 1209600
    error_message = "O valor de message_retention_seconds deve estar entre 60 e 1209600 segundos."
  }  
}

variable "receive_wait_time_seconds" {
  description = "Tempo de espera para receber a mensagem em segundos"
  type        = number

  validation {
    condition     = var.receive_wait_time_seconds >= 0 && var.receive_wait_time_seconds <= 20
    error_message = "O valor de receive_wait_time_seconds deve estar entre 0 e 20 segundos."
  }
  
}


variable "max_receive_count" {
  description = "Número máximo de vezes que a mensagem pode ser recebida antes que seja excluída ou movida para a DLQ"
  type        = number

  validation {
    condition     = var.max_receive_count >= 1 && var.max_receive_count <= 1000
    error_message = "O valor de max_receive_count deve estar entre 1 e 1000."
  }
  
}


variable "visibility_timeout_seconds" {
  description = "Tempo de visibilidade da mensagem na fila em segundos"
  type        = number

  validation {
    condition     = var.visibility_timeout_seconds >= 0 && var.visibility_timeout_seconds <= 43200
    error_message = "O valor de visibility_timeout_seconds deve estar entre 0 e 43200 segundos."
  }
}


variable "delay_seconds_dlq" {
  description = "Quantidade de segundos para atraso na entrega da mensagem na DLQ"
  type        = number

  validation {
    condition     = var.delay_seconds_dlq >= 0 && var.delay_seconds_dlq <= 900
    error_message = "O valor de delay_seconds_dlq deve estar entre 0 e 900 segundos."
  }
  
}


variable "message_retention_seconds_dlq" {
  description = "Tempo de retenção da mensagem na DLQ em segundos"
  type        = number

  validation {
    condition     = var.message_retention_seconds_dlq >= 60 && var.message_retention_seconds_dlq <= 1209600
    error_message = "O valor de message_retention_seconds_dlq deve estar entre 60 e 1209600 segundos."
  }
  
}


variable "receive_wait_time_seconds_dlq" {
  description = "Tempo de espera para receber a mensagem na DLQ em segundos"
  type        = number

  validation {
    condition     = var.receive_wait_time_seconds_dlq >= 0 && var.receive_wait_time_seconds_dlq <= 20
    error_message = "O valor de receive_wait_time_seconds_dlq deve estar entre 0 e 20 segundos."
  }
  
}


variable "visibility_timeout_seconds_dlq" {
  description = "Tempo de visibilidade da mensagem na DLQ em segundos"
  type        = number

  validation {
    condition     = var.visibility_timeout_seconds_dlq >= 0 && var.visibility_timeout_seconds_dlq <= 43200
    error_message = "O valor de visibility_timeout_seconds_dlq deve estar entre 0 e 43200 segundos."
  }
  
}