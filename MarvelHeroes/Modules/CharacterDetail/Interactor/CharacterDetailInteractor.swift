//
//  CharacterDetailInteractor.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

class CharacterDetailInteractor: InteractorCharacterDetailProtocol {
    
    var character: MSCharacter?
    
    init(character: MSCharacter?){
        self.character = character
    }
}
