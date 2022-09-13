//
//  MainVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import Foundation
import UIKit
class MainVC : UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UISearchBarDelegate{
    
    var mainView = MainView()
    var offerImages = ["offer1","offer2","offer3","offer4","offer5","offer6","offer7","offer8"]
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == self.mainView.offerCollectionView){
        return offerImages.count
        } else {
            return resturants.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.mainView.offerCollectionView{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OfferCell", for: indexPath) as! OfferCell
        cell.offerImage.image = UIImage(named: offerImages[indexPath.row])
        cell.offerImage.layer.cornerRadius = 20
            return cell
        }
        else if (collectionView == self.mainView.resturantCollectionView){
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "ResturantCell", for: indexPath) as! ResturantCell
            cell2.imgFood.image = UIImage(named: resturants[indexPath.row].image)
            cell2.configureCell(with: resturants[indexPath.row])
            return cell2
        }
        let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "ResturantCell", for: indexPath) as! ResturantCell
        return cell3
    }
    func snapToNearestCell(scrollView: UIScrollView) {
         let middlePoint = Int(scrollView.contentOffset.x + UIScreen.main.bounds.width / 2)
        if let indexPath = self.mainView.offerCollectionView.indexPathForItem(at: CGPoint(x: middlePoint, y: 0)) {
            self.mainView.offerCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
         }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.snapToNearestCell(scrollView: scrollView)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.snapToNearestCell(scrollView: scrollView)
    }
    
    func setupUI(){
        mainView.objMain = self
        self.mainView.offerCollectionView.dataSource = self
        self.mainView.offerCollectionView.delegate = self
        self.mainView.offerCollectionView.register(UINib(nibName: "OfferCell", bundle: nil), forCellWithReuseIdentifier: "OfferCell")
        self.mainView.offerCollectionView.isPagingEnabled = false
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.mainView.resturantCollectionView.delegate = self
        self.mainView.resturantCollectionView.dataSource = self
        self.mainView.resturantCollectionView.register(UINib(nibName: "ResturantCell", bundle: nil), forCellWithReuseIdentifier: "ResturantCell")
    }
}
