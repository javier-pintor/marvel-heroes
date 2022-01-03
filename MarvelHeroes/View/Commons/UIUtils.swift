//
//  UIUtils.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

struct UIUtils {
    
    // MARK: common UIUtils
    func isTablet() -> Bool{
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    func isLandscape() -> Bool{
        return (UIDevice.current.orientation == .landscapeLeft || UIDevice.current.orientation == .landscapeRight)
    }
    
    // MARK: character list UIUtils
    func getCharactersListCellHeight() -> CGFloat{
        return isTablet() ? CGFloat(UIConfig.charactersListTabletCellHeight) : CGFloat(UIConfig.charactersListMobileCellHeight)
    }
    
    func getCharactersListNumColumns() -> Int{
        if isTablet(){
            return isLandscape() ? UIConfig.charactersListTabletLandscapeColumns : UIConfig.charactersListTabletPortraitColumns
        }else{
            return isLandscape() ? UIConfig.charactersListMobileLandscapeColumns : UIConfig.charactersListMobilePortraitColumns
        }
    }
}
