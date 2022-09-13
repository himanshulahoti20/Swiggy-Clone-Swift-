//
//  ComoditiesCell.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 18/07/22.
//

import UIKit

class ComoditiesCell: UICollectionViewCell {

    @IBOutlet weak var comodityImage: UIImageView!
    @IBOutlet weak var comodityName: UILabel!
    @IBOutlet weak var comodityPrice: UILabel!
    @IBOutlet weak var comodityWeight: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureCell(with comodity : Comodities){
        comodityName.text = comodity.name
        comodityPrice.text = comodity.price
        comodityWeight.text =  comodity.weight
    }

}
