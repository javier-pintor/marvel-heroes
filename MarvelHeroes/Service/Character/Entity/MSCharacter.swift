//
//  ServiceCharacter.swift
//  MarvelHeroes
//
//  Created by Javier Pintor on 3/1/22.
//

// MARK: - MSCharacter
struct MSCharacterLite: Codable {
    let id: Int?
    let name, description: String?
    let thumbnail: MSThumbnail?
}

// MARK: - MSCharacter
struct MSCharacter: Codable {
    let id: Int?
    let name, description: String?
    let modified: String?
    let thumbnail: MSThumbnail?
    let resourceURI: String?
    let comics, series: MSDetail?
    let stories: MSDetail?
    let events: MSDetail?
    let urls: [MSURLElement]?
}

// MARK: - Detail
struct MSDetail: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [MSDetailItem]?
    let returned: Int?
}

// MARK: - DeatilItem
struct MSDetailItem: Codable {
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
