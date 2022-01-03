//
//  CharactersListViewController+CollectionView.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

extension CharactersListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func registerCollectionViewElements(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "\(CharactersListCollectionViewCell.self)", bundle: nil), forCellWithReuseIdentifier: characterCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell: CharactersListCollectionViewCell =  collectionView.dequeueReusableCell(withReuseIdentifier: characterCellId, for: indexPath) as? CharactersListCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if charactersList != nil, indexPath.item < charactersList?.count ?? 0{
            cell.configureCell(character: charactersList![indexPath.item])
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let height = uiUtils.getCharactersListCellHeight()
        let columnsNumber = uiUtils.getCharactersListNumColumns()
        let collectionWidth = collectionView.frame.width - CGFloat(columnSpacing * 2)
        let width = (collectionWidth - CGFloat(columnSpacing * (columnsNumber - 1))) / CGFloat(columnsNumber)

        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        loadDetail(indexPath: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
    
    
}
