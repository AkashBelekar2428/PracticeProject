//
//  TblTVCTableViewCell.swift
//  pr1
//
//  Created by Aniket Patil on 16/02/23.
//

import UIKit

class TblTVC: UITableViewCell {
    
    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descriptionLbl:UILabel!
    @IBOutlet weak var linkLbl:UILabel!
    @IBOutlet weak var categoryLbl:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        linkLbl.isUserInteractionEnabled = true
    }

    
}
