//
//  NookipediaService.swift
//  Project3
//
//  Created by Dave Gumba on 2023-09-30.
//

import Foundation
import SwiftUI
import Combine

struct NookipediaService<EndpointType: APIEndpoint>: NookipediaServiceProtocol {
    
    // MARK: Fetching data
    
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { data, response -> Data in

                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.unknown
                }
                
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
