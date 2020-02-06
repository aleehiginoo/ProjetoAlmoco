﻿using ProjetoAlmoco.Domain.Entities;
using System.Collections.Generic;

namespace ProjetoAlmoco.Domain.Interfaces.Service
{
    public interface IAlimentoService
    {
        void SalvarCardapio();
        IEnumerable<Alimento> EditarCardapio();
    }
}
