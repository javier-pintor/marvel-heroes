//
//  CharacterListPresenter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

class CharacterListPresenter: PresenterCharactersProtocol {
    
    var view: ViewCharactersProtocol?
    var interactor: InteractorCharactersProtocol?
    var router: RouterCharactersProtocol?
    
    var characterList: [MSCharacterLite]?
    
    func viewDidLoad() {
        interactor?.loadCharacters()
    }
    
    func didSelectRowAt(id: Int) {
        interactor?.retrieveCharacter(id: id)
    }
    
    func fetchCharactersSuccess(characters: [MSCharacterLite]) {
        characterList = characters
        view?.onFetchCharactersSuccess(characters: characters)
    }
    
    func fetchCharactersFailure(errorCode: Int) {
        view?.onFetchCharactersFailure(error: "\(errorCode)")
    }
    
    func getCharacterSuccess(_ character: MSCharacter) {
        router?.pushToCharacterDetail(view: view!, character: character)
    }
    
    func getCharacterFailure() {
        print("Character detail load error")
    }
}
