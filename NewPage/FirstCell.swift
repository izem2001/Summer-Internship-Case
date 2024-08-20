//
//  FirstCell.swift
//  Case-1
//
//  Created by İzem Özer on 25.07.2024.
//

import UIKit

class FirstCell: UITableViewCell {
@IBOutlet weak var titleLabel: UILabel!
@IBOutlet weak var customTextLabel: UILabel!
    
    
    static let identifier = "FirstCell"
    static func nib() -> UINib{
        return UINib(nibName: "FirstCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
    }
    
}
    

