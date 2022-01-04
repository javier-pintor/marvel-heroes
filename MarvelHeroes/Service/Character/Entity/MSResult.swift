//
//  ServiceCharacterResult.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

// MARK: - MSCharactersResult
struct MSResult<T: Codable>: Codable {
    let code: Int?
    let status, message: String?
    let data: MSDataClass<T>?
    
    init(){
        self.code = nil
        self.status = nil
        self.message = nil
        self.data = nil
    }
}

// MARK: - DataClass
struct MSDataClass <T: Codable>: Codable {
    let offset, limit, total, count: Int?
    let results: [T]?
}
