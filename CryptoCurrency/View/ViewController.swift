//
//  ViewController.swift
//  CryptoCurrency
//
//  Created by Enes Talha Yılmaz on 13.03.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tvCurrencyList: UITableView!
    private var currencyListViewModel : CurrencyListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tvCurrencyList.delegate = self
        tvCurrencyList.dataSource = self
        GetData()
        }
        // Do any additional setup after loading the view.
    func GetData()
    {
    let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
    WebService().downloadCurrencies(url: url) { currencies in
        if let currencies = currencies {
            self.currencyListViewModel = CurrencyListViewModel(currencyList: currencies)
            DispatchQueue.main.async
            {
                self.tvCurrencyList.reloadData()
            }
        }
    }}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(currencyListViewModel == nil ? 0 : self.currencyListViewModel.numberOfRowsInSection())
        return currencyListViewModel == nil ? 0 : self.currencyListViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let currencyViewModel = self.currencyListViewModel.currenciesAtIndex(index: indexPath.row )
        cell.lblValue.text = currencyViewModel.value
        print(currencyViewModel.name)
        cell.lblName.text = currencyViewModel.name
        return cell
    }


}

