//
//  Service.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import Foundation

class MarvelService {
    
    var baseUrl = ""
    
    init() {
        baseUrl = MSConfig.serverUri
    }
    
    func getCharactersList(onResult: @escaping (MSResult<MSCharacterLite>) -> Void){
        MSCharacterRequest(baseUrl: self.baseUrl).getCharacters{ response in
            onResult(response)
        }
    }
    
    
    func getCharacter(id: Int, onResult: @escaping (MSResult<MSCharacter>) -> Void){
        MSCharacterRequest(baseUrl: self.baseUrl).getCharacters(id: id){ response in
            onResult(response)
        }
    }
}
