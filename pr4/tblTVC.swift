//
//  tblTVC.swift
//  pr4
//
//  Created by Aniket Patil on 17/02/23.
//

import UIKit

class tblTVC: UITableViewCell {
    @IBOutlet weak var img : UIImageView!
    @IBOutlet weak var nameLbl:UILabel!
    @IBOutlet weak var surnameLbl:UILabel!
    @IBOutlet weak var emailLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
