//
//  File.swift
//  For-json
//
//  Created by Tanvir Ahmed on 18/12/24.
//

import Foundation


struct Img: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
