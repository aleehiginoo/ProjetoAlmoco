﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProjetoAlmoco.Web.Models
{
    public class Cliente
    {
        [Required(ErrorMessage ="Necessário inserir o nome do cliente!")]
        public string NomeCliente { get; set; }

        [Required(ErrorMessage = "Necessário inserir um nome de usuário válido!")]
        [MaxLength(10, ErrorMessage = "Máximo de 20 caracteres")]
        [MinLength(5, ErrorMessage = "Mínimo de 5 caracteres")]
        public string Usuario { get; set; }

        [Required(ErrorMessage = "Necessário inserir a senha!")]
        [MaxLength(20, ErrorMessage = "Máximo de 20 caracteres")]
        [MinLength(5, ErrorMessage = "Mínimo de 5 caracteres")]
        public string Senha { get; set; }

        [MinLength(5, ErrorMessage = "Mínimo de 5 caracteres")]
        [Compare(nameof(Senha), ErrorMessage = "Senhas não coincidem!")]
        public string ConfirmaSenha { get; set; }

    }
}