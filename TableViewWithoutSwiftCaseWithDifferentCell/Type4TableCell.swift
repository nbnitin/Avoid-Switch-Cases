//
//  Type4TableCell.swift
//  TableViewWithoutSwiftCaseWithDifferentCell
//
//  Created by Nitin Bhatia on 21/07/23.
//

import UIKit

class Type4TableCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
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
