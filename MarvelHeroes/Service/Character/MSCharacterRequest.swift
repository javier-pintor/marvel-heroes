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
    let characters: String = "characters"
    
    init (baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getCharacters<T: Codable>(id: Int? = nil, onResult: @escaping (MSResult<T>) -> Void) {
        
        var getCharactersResponse = MSResult<T>()
        var url = "\(baseUrl)/\(characters)"
        if let characterId = id{
            url += "/\(characterId)"
        }
        
        guard let finalUrl = MSUtils.buildServiceRequestUrl(baseUrl: url) else{
            onResult(getCharactersResponse)
            return
        }
        
        MSUtils.get(url: finalUrl){ response in
            if let dataResponse = response{
                do{
                    let json = try JSON.init(data: dataResponse)
                    let decoder = JSONDecoder()
                    getCharactersResponse = try decoder.decode(type(of: getCharactersResponse), from: json.rawData())
                    onResult(getCharactersResponse)
                    return
                }catch{
                    print("ServiceCharacterRequest getCharacters parse error: \(error)")
                }
            }
            
            
            onResult(getCharactersResponse)
        }
    }
    
}

