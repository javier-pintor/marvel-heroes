//
//  CharacterDetailRouter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

import UIKit


class CharacterDetailRouter: RouterCharacterDetailProtocol {
    
    static func initModule(character: MSCharacter) -> UIViewController? {
        
        if let viewController = UIStoryboard(name: "CharacterDetailsViewController", bundle: Bundle.main).instantiateViewController(withIdentifier: "\(CharacterDetailsViewController.self)") as? CharacterDetailsViewController{
            let presenter = CharacterDetailPresenter()
            
            viewController.msCharacter = character
            viewController.presenter = CharacterDetailPresenter()
            viewController.presenter?.router = CharacterDetailRouter()
            viewController.presenter?.view = viewController
            viewController.presenter?.interactor = CharacterDetailInteractor()
            viewController.presenter?.interactor?.character = character
            viewController.presenter?.interactor?.presenter = presenter
            
            return viewController
        }
        return nil
    }
    

    
    
}
