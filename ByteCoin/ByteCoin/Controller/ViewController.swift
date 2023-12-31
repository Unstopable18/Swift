//
//  ViewController.swift
//  ByteCoin
//
//  Created by CEMTREX on 28/09/23.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var coinManager=CoinManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        pickerView.dataSource=self
        pickerView.delegate=self
        coinManager.delegate=self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency=coinManager.currencyArray[row]
        coinManager.fetchCoin(coin: selectedCurrency)
    }
    
    func didUpdateCoin(_ CoinManager: CoinManager, Coin: CoinModel) {
        DispatchQueue.main.async {
            self.valueLabel.text = Coin.rate
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

}

