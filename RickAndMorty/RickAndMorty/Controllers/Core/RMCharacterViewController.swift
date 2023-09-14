//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by CEMTREX on 14/09/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = RMRequest(endpoint: .character,queryParameters: [
            URLQueryItem(name: "name", value: "rick"),
            URLQueryItem(name: "status", value: "alive")])
        print(request.url ?? "No URL created")
//        RMService.shared.execute(request, expecting: RMCharacter.self){
//            result in
//            switch result{
//                case .success(_):
//                    return print("Success \n \(result)")
//                case .failure(_):
//                    return print("Failed")
//            }
//        }
    }

}
