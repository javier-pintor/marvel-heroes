//
//  CharacterListInteractor.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

class CharacterListInteractor: InteractorCharactersProtocol {
    
    var presenter: PresenterCharactersProtocol?
    let marvelService = MarvelService()
    var charactersList: [MSCharacterLite]?
    
    func loadCharacters() {
        marvelService.getCharactersList(){ response in
            if response.code == 200{
                self.charactersList = response.data?.results
                self.presenter?.fetchCharactersSuccess(characters: self.charactersList ?? [MSCharacterLite]())
            }else{
                self.presenter?.fetchCharactersFailure(errorCode: response.code ?? 0)
            }
            
            
        }
    }
    
    func retrieveCharacter(id: Int) {
        marvelService.getCharacter(id: id){ response in
            
            if let result = response.data?.results?.first{
                self.presenter?.getCharacterSuccess(result)
            }else{
                self.presenter?.getCharacterFailure()
            }
            
        }
    }
}
