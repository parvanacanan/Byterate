//
//  ViewController.swift
//  ByteCoin
//
//  Created by parvana on 24.10.25.
//

import UIKit

class ViewController: UIViewController  , UIPickerViewDataSource, UIPickerViewDelegate{
    
    let coinManager = CoinManager()
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
  let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency) { rate in
               if let rate = rate {
                   DispatchQueue.main.async {
                       self.bitcoinLabel.text = "\(rate) "
                       self.currrencyLabel.text = "\(selectedCurrency)"
                   }
               }
           }
    }

    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currrencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }
     

}

