//
//  RMService.swift
//  RickAndMorty
//
//  Created by CEMTREX on 14/09/23.
//

import Foundation

final class RMService{
    static let shared = RMService()
    private init(){
        
    }
    
    public func execute<T:Codable>(
        _ request: RMRequest,
        expecting type: T.Type,
        completing: @escaping (Result<T, Error>) -> Void
    ){
        
    }
}
