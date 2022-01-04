//
//  CharacterDetailsViewController+TableView.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import UIKit

extension CharacterDetailsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func registerTableViewElements(){
        detailsTableView.delegate = self
        detailsTableView.dataSource = self
        detailsTableView.register(UINib(nibName: "\(CharacterDetailTableViewCell.self)", bundle: nil), forCellReuseIdentifier: characterCellId)
        detailsTableView.register(UINib(nibName: "\(CharacterDetailTableHeaderView.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: characterHeaderCellId)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberIfDetailsSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if msCharacter == nil{
            return 0
        }
        
        switch section {
        case comicsSectionIndex:
            return msCharacter!.comics?.items?.count ?? 0
        case seriesSectionIndex:
            return msCharacter!.series?.items?.count ?? 0
        case storiesSectionIndex:
            return msCharacter!.stories?.items?.count ?? 0
        case eventsSectionIndex:
            return msCharacter!.events?.items?.count ?? 0
        case urlsSectionIndex:
            return msCharacter!.urls?.count ?? 0
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CharacterDetailTableViewCell =  detailsTableView.dequeueReusableCell(withIdentifier: characterCellId, for: indexPath) as? CharacterDetailTableViewCell else {
            return UITableViewCell()
        }
        
        if msCharacter == nil{
            return cell
        }
        
        switch indexPath.section {
        case comicsSectionIndex:
            if indexPath.row < msCharacter!.comics?.items?.count ?? 0{
                cell.configureCell(title: msCharacter!.comics!.items![indexPath.row].name)
            }
        case seriesSectionIndex:
            if indexPath.row < msCharacter!.series?.items?.count ?? 0{
                cell.configureCell(title: msCharacter!.series!.items![indexPath.row].name)
            }
        case storiesSectionIndex:
            if indexPath.row < msCharacter!.stories?.items?.count ?? 0{
                cell.configureCell(title: msCharacter!.stories!.items![indexPath.row].name)
            }
        case eventsSectionIndex:
            if indexPath.row < msCharacter!.events?.items?.count ?? 0{
                cell.configureCell(title: msCharacter?.events!.items![indexPath.row].name)
            }
        case urlsSectionIndex:
            if indexPath.row < msCharacter!.events?.items?.count ?? 0{
                cell.configureCell(title: msCharacter?.events!.items![indexPath.row].name)
            }
        default:
            return cell
        }
        
        
        return cell
    }
    
    // MARK: header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionHeader: CharacterDetailTableHeaderView = tableView.dequeueReusableHeaderFooterView(withIdentifier: characterHeaderCellId) as? CharacterDetailTableHeaderView else {
            return UIView()
        }
        
        var title = ""
        var count = ""
        switch section {
        case comicsSectionIndex:
            if !(msCharacter?.comics?.items?.isEmpty ?? true){
                title = uiUtils.getWordingString(value: "comics")
                count = String(msCharacter!.comics!.items!.count)
            }
        case seriesSectionIndex:
            if !(msCharacter?.series?.items?.isEmpty ?? true){
                title = uiUtils.getWordingString(value: "series")
                count = String(msCharacter!.series!.items!.count)
            }
        case storiesSectionIndex:
            if !(msCharacter?.stories?.items?.isEmpty ?? true){
                title = uiUtils.getWordingString(value: "stories")
                count = String(msCharacter!.stories!.items!.count)
            }
        case eventsSectionIndex:
            if !(msCharacter?.events?.items?.isEmpty ?? true){
                title = uiUtils.getWordingString(value: "events")
                count = String(msCharacter!.events!.items!.count)
            }
        case urlsSectionIndex:
            if !(msCharacter?.urls?.isEmpty ?? true){
                title = uiUtils.getWordingString(value: "links")
                count = String(msCharacter!.urls!.count)
            }
        default:
            break
        }
        
        
        sectionHeader.configureCell(title: title, count: count)
        
        
        return sectionHeader
    }
    
    
}
