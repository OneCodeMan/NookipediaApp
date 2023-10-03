//
//  NookipediaServiceProtocol.swift
//  Project3
//
//  Created by Dave Gumba on 2023-10-01.
//

import Foundation
import Combine

protocol NookipediaServiceProtocol {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
