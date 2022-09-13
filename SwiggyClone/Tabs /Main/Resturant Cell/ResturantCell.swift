//
//  ResturantCell.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 13/07/22.
//

import UIKit

class ResturantCell: UICollectionViewCell {

    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var imgStar: UIImageView!
    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var lblResturantName: UILabel!
    @IBOutlet weak var lblRatings: UILabel!
    @IBOutlet weak var lblDeliveryTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        starView.makeRounded()
        imgFood.layer.cornerRadius = 15
    }
    
    func configureCell(with resturant : Resturant){
        lblResturantName.text = resturant.name
        lblRatings.text = resturant.rating
        lblDeliveryTime.text = resturant.delveryTime
    }
        

}
extension UIView {
    func makeRounded() {
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
