//
//  Produto.swift
//  LojaVirtual
//
//  Created by Bruno da Fonseca on 02/10/20.
//  Copyright © 2020 Bruno Fonseca. All rights reserved.
//

import Foundation

enum Categorias: Int {
    case eletronicos = 0
    case lazer = 1
    case eletrodomesticos = 2
}

struct Produto {
    let nome: String
    let preco: String
    let categoria: Categorias
}
