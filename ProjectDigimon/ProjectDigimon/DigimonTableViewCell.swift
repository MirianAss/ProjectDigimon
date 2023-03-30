//
//  DigimonTableViewCell.swift
//  ProjectDigimon
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit
import SDWebImage

class DigimonTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDigimonCell: UILabel!
    @IBOutlet weak var imageDigimonCell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupDigimon(digimon: DigimonElement?) {
        lblDigimonCell.text = digimon?.name ?? ""
        let urlImage = URL(string: digimon?.img ?? "")
        imageDigimonCell.sd_setImage(with: urlImage)
    }
}
