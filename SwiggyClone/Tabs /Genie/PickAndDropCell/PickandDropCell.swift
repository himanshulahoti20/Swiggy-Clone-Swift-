//
//  PickandDropCell.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 20/07/22.
//

import UIKit

class PickandDropCell: UICollectionViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImage.makeRoundImage()
    }
}
extension UIImageView{
    func makeRoundImage() {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
