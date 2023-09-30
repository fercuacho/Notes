//
//  NoteCell.swift
//  Notes
//
//  Created by José Fernando Cristóbal Huerta on 30/09/23.
//

import UIKit

class NoteCell: UITableViewCell {

    @IBOutlet weak var noteTitle: UILabel!
    
    @IBOutlet weak var noteDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
