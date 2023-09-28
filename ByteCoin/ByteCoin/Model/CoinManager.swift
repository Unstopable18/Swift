//
//  CoinManager.swift
//  ByteCoin
//
//  Created by CEMTREX on 28/09/23.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoin(_ CoinManager: CoinManager, Coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/"
//  https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=D6E089F0-1782-497F-B4C3-CCB43C1020C7
    let appID="/USD?apikey=D6E089F0-1782-497F-B4C3-CCB43C1020C7"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate: CoinManagerDelegate?
    
    func fetchCoin(coin: String){
        let urlString="\(baseURL)\(coin)\(appID)"
//        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString:String){
        if let url=URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData=data{
                    if let Coin = self.parseJSON(CoinData: safeData) {
                        self.delegate?.didUpdateCoin(self, Coin: Coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(CoinData: Data)-> CoinModel? {
        let decoder=JSONDecoder()
        do{
            let decodedData = try decoder.decode(CoinResponse.self, from: CoinData)
            let rate = String(format: "%.2f", decodedData.rate)
            
            let Coin = CoinModel(rate: rate)
//            print(Coin)
            return Coin
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
    
    
}
