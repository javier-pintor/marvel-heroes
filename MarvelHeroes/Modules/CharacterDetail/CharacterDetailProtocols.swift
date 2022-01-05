//
//  CharacterDetailProtocols.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

import UIKit

protocol PresenterCharacterDetailProtocol {
    var view: ViewCharacterDetailProtocol? { get set }
    var interactor: InteractorCharacterDetailProtocol? { get set }
    var router: RouterCharacterDetailProtocol? { get set }
}

protocol InteractorCharacterDetailProtocol {
    var character: MSCharacter? { get set }
}

protocol ViewCharacterDetailProtocol {}
//
//// MARK: Router Input (Presenter -> Router)
protocol RouterCharacterDetailProtocol {
    static func initModule(character: MSCharacter) -> UIViewController?
}
