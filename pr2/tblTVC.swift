//
//  tblTVC.swift
//  pr2
//
//  Created by Aniket Patil on 16/02/23.
//

import UIKit

class tblTVC: UITableViewCell {
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descriptionLbl:UILabel!
    @IBOutlet weak var priceLbl:UILabel!
    @IBOutlet weak var categoriLbl:UILabel!
    @IBOutlet weak var img:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
