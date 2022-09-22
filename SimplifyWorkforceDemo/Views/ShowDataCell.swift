//
//  ShowDataCell.swift
//  SimplifyWorkforceDemo
//
//  Created by Abhay Pratap Singh on 23/09/22.
//

import UIKit

class ShowDataCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var imageProfile:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lbllastActive:UILabel!
    @IBOutlet weak var btnProfile:UIButton!
    
    //MARK: Variables
    typealias ClickBlock = (_ isClick:Bool)->Void
    var clickEvent:ClickBlock!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    //MARK: UIButton action
    
    @IBAction func profileAction(_ sender: UIButton) {
        if clickEvent != nil {
            clickEvent(true)
        }
    }
}
