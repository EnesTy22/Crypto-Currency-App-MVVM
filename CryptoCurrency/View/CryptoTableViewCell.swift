//
//  CryptoTableViewCell.swift
//  CryptoCurrency
//
//  Created by Enes Talha Yılmaz on 13.03.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
