//
//  ViagemDestaqueViewModel.swift
//  AluraViagens
//
//  Created by Victor Vaz de Oliveira on 09/12/24.
//

import Foundation

class ViagemDestaqueViewModel: ViagemViewModel {
    
    var tituloSessao: String {
        return "Destaques"
    }
    
    var tipo: ViagemViewModelType {
        return .destaques
    }
    
    var viagens: [Viagem]
    
    var numeroDeLinhas: Int {
        return viagens.count
    }
    
    
    init(_ viagens: [Viagem]) {
        self.viagens = viagens
    }
    
    
}
