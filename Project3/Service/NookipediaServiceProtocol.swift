//
//  NookipediaServiceProtocol.swift
//  Project3
//
//  Created by Dave Gumba on 2023-10-01.
//

import Foundation

protocol NookipediaServiceProtocol {
    var NOOKIPEDIA_API_KEY: String { get }
    func fetchVillagers(url: URL?, completion: @escaping(Result<[ACVillager], APIError>) -> Void)
}
