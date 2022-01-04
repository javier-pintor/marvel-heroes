//
//  CharacterListProtocol.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 4/1/22.
//

import Foundation

import UIKit

protocol PresenterCharactersProtocol {
    var view: ViewCharactersProtocol? { get set }
    var interactor: InteractorCharactersProtocol? { get set }
    var router: RouterCharactersProtocol? { get set }
    var characterList: [MSCharacterLite]? { get set }
    func viewDidLoad()
    func didSelectRowAt(id: Int)
    
    func fetchCharactersSuccess(characters: [MSCharacterLite])
    func fetchCharactersFailure(errorCode: Int)
    func getCharacterSuccess(_ character: MSCharacter)
    func getCharacterFailure()
}

protocol ViewCharactersProtocol {
    func onFetchCharactersSuccess(characters: [MSCharacterLite])
    func onFetchCharactersFailure(error: String)
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

protocol InteractorCharactersProtocol {
    var presenter: PresenterCharactersProtocol? { get set }
    func loadCharacters()
    func retrieveCharacter(id: Int)
}

protocol RouterCharactersProtocol {
    static func initModule(viewController: CharactersListViewController)
    func pushToCharacterDetail(view: ViewCharactersProtocol, character: MSCharacter)
}
