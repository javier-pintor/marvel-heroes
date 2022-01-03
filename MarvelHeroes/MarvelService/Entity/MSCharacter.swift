//
//  ServiceCharacter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

import Foundation


// MARK: - MSCharacter
struct MSCharacter: Codable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: MSThumbnail?
    let resourceURI: String?
    let comics, series: MSComics?
    let stories: MSStories?
    let events: MSComics?
    let urls: [MSURLElement]?
}

// MARK: - Comics
struct MSComics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [MSComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct MSComicsItem: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Stories
struct MSStories: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [MSStoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct MSStoriesItem: Codable {
    let resourceURI: String?
    let name: String?
    let type: String?
}


// MARK: - Thumbnail
struct MSThumbnail: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct MSURLElement: Codable {
    let type: String?
    let url: String?
}
