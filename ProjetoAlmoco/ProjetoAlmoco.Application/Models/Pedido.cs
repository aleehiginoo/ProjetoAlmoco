﻿using System.Collections.Generic;

namespace ProjetoAlmoco.Application.Models
{
    public class Pedido
    {
        public int Num_IDCliente { get; set; }
        public string Nom_Cliente { get; set; }
        public IEnumerable<string> CategoriaAlimento { get; set; }
    }
}
