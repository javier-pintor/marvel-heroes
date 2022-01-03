//
//  ServiceCharacter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import Foundation
import SwiftyJSON

class MSCharacterRequest {
    
    var baseUrl: String
    let charactersList: String = "characters"
    let character: String = "character"
    
    init (baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getCharactersList(onResult: @escaping (MSResult<MSCharacter>) -> Void) {
        
        var getCharactersListResponse = MSResult<MSCharacter>()
        let url = "\(baseUrl)/\(charactersList)"
        guard let finalUrl = MSUtils.buildServiceRequestUrl(baseUrl: url) else{
            onResult(getCharactersListResponse)
            return
        }
        
        MSUtils.get(url: finalUrl){ response in
            if let dataResponse = response{
                do{
                    let json = try JSON.init(data: dataResponse)
                    let decoder = JSONDecoder()
                    getCharactersListResponse = try decoder.decode(type(of: getCharactersListResponse), from: json.rawData())
                    onResult(getCharactersListResponse)
                    return
                }catch{
                    print("ServiceCharacterRequest getCharactersList parse error: \(error)")
                }
            }
            
            
            onResult(getCharactersListResponse)
        }
    }
    
    
}

