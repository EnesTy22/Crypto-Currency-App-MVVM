//
//  CurrencyViewModel.swift
//  CryptoCurrency
//
//  Created by Enes Talha Yılmaz on 14.03.2023.
//

import Foundation

struct CurrencyListViewModel{
    let currencyList : [CurrencyModel]
    func numberOfRowsInSection()-> Int
    {
        return self.currencyList.count
    }
    func currenciesAtIndex( index : Int)-> CurrencyViewModel
    {
        let crypto = self.currencyList[index]
        return CurrencyViewModel(cryptoCurrency:crypto)
    }
}
struct CurrencyViewModel
{
    let cryptoCurrency : CurrencyModel
    var name:String
    {
        return self.cryptoCurrency.currency
    }
    var value : String{
        return self.cryptoCurrency.price
    }
}
