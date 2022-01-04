//
//  BaseController.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        removeObserves()
    }
    
    func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func removeObserves(){
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    // MARK: rotation
    @objc func orientationDidChange() {
        print("device orientation is changed")
    }
}
