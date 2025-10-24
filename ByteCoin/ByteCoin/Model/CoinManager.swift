//
//  CoinManager.swift
//  ByteCoin
//
//  Created by parvana on 24.10.25.
//


import Foundation

protocol CoinManagerDelegate {
    func didUpdateRate(rate: Double, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    let apiKey = "1052ca2d81cae5747905ee90"
    let baseCurrency = "USD"
    let targetCurrency = "EUR"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    func getCoinPrice(for currency: String, completion: @escaping (Double?) -> Void) {
        let urlString = "https://v6.exchangerate-api.com/v6/\(apiKey)/latest/USD"
        
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if error != nil {
                    print("Error: \(error!)")
                    completion(nil)
                    return
                }
                
                if let safeData = data {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(ExchangeRateData.self, from: safeData)
                        let rate = decodedData.conversion_rates[currency]
                        completion(rate)
                    } catch {
                        print("Decoding error: \(error)")
                        completion(nil)
                    }
                }
            }
            task.resume()
        }
    }

}
struct ExchangeRateData: Decodable {
    let base_code: String
    let conversion_rates: [String: Double]
} 
