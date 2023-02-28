//
//  TableViewCell.swift
//  graduationProject
//
//  Created by Burak Kara on 21.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
  
  @IBOutlet weak var pieceLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var foodImageView: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
