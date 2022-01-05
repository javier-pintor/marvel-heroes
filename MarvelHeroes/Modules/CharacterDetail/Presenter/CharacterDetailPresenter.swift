//
//  CharacterDetailPresenter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

class CharacterDetailPresenter: PresenterCharacterDetailProtocol {
    
    var view: ViewCharacterDetailProtocol?
    var interactor: InteractorCharacterDetailProtocol?
    var router: RouterCharacterDetailProtocol?
    
    init(interactor: InteractorCharacterDetailProtocol, view: ViewCharacterDetailProtocol, router: RouterCharacterDetailProtocol){
        self.interactor = interactor
        self.view = view
        self.router = router
    }
}
