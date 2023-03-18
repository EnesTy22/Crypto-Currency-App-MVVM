//
//  WebService.swift
//  CryptoCurrency
//
//  Created by Enes Talha Yılmaz on 13.03.2023.
//

import Foundation

class WebService
{
    func downloadCurrencies(url : URL,completion : @escaping([CurrencyModel]?)->())
    {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error
            {
                print(error.localizedDescription)
                completion(nil)
            }
            else
            {
                if let data = data {
                    let currencyList = try? JSONDecoder().decode([CurrencyModel].self, from: data)
                    print(currencyList)
                    if let currencyList = currencyList{
                        completion(currencyList)

                    }
                }
            }
        }.resume()
    }
}
