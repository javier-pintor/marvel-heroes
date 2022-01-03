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
    
    func getCharactersList(onResult: @escaping (MSResult<MSCharacter>) -> Void){
        MSCharacterRequest(baseUrl: self.baseUrl).getCharactersList(){ response in
            onResult(response)
        }
    }
}
