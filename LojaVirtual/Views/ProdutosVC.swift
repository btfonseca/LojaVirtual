//
//  ProdutosVC.swift
//  LojaVirtual
//
//  Created by Bruno da Fonseca on 02/10/20.
//  Copyright © 2020 Bruno Fonseca. All rights reserved.
//

import UIKit

class ProdutosVC: UIViewController {

    @IBOutlet weak var produtosTableView: UITableView!
    
    var categorias:[String] = ["Eletrônicos", "Lazer", "Eletrodomésticos"]
    var produtos: [Produto] = [
        Produto(nome: "Bicicleta", preco: "R$: 1900,00", categoria: .lazer),
        Produto(nome: "Bola de Futebol", preco: "R$: 99,00", categoria: .lazer),
        Produto(nome: "Macbook", preco: "R$: 10.000,00", categoria: .eletronicos),
        Produto(nome: "Geladeira", preco: "R$: 5.000,00", categoria: .eletrodomesticos),
        Produto(nome: "TV", preco: "R$: 5.500,00", categoria: .eletrodomesticos),
        Produto(nome: "Fogão", preco: "R$: 2.000,00", categoria: .eletrodomesticos)
    
    ]
    
    private func configTableView() {
        self.produtosTableView.dataSource = self
        self.produtosTableView.delegate = self
        self.produtosTableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()

        // Do any additional setup after loading the view.
    }
    
    private func numeroDeitensPorCategoria(section: Int) -> Int {
        
        var arrayProdutosFiltrado:[Produto] = []
        
        for value in self.produtos {
            if value.categoria.rawValue == section {
                arrayProdutosFiltrado.append(value)
            }
        }
        
        return arrayProdutosFiltrado.count
        
    }
    
    private func loadCurrentProduct(indexPath: IndexPath) {
        
    }
    
    func loadArrayFiltrado(section: Int) -> [Produto] {
        
        let arrayFiltrado = self.produtos.filter({$0.categoria.rawValue == section})
        
        return arrayFiltrado
        
    }
    
}

//MARK: - Table view data source
extension ProdutosVC: UITableViewDataSource {
    
    //implementar esse porque tem mais de uma seção
    func numberOfSections(in tableView: UITableView) -> Int {
        return categorias.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return self.numeroDeitensPorCategoria(section: section)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = produtosTableView.dequeueReusableCell(withIdentifier: "ProdutoCell", for: indexPath)
        
        let arrayProdutosFiltrados:[Produto] = self.loadArrayFiltrado(section: indexPath.section)
        
        cell.textLabel?.text = arrayProdutosFiltrados[indexPath.row].nome
        cell.detailTextLabel?.text = arrayProdutosFiltrados[indexPath.row].preco
        print(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categorias[section]
    }
    
    
}

extension ProdutosVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
