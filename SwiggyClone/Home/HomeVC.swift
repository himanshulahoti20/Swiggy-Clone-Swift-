//
//  HomeVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import UIKit

class HomeVC: UIViewController {
    var mainView = HomeController()
    var pageController = TabVC()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpPageView()
        addChild(pageController)
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        mainView.topContainerView.addSubview(pageController.view)
        NSLayoutConstraint.activate([
            pageController.view.leadingAnchor.constraint(equalTo: mainView.topContainerView.leadingAnchor, constant: 0),
            pageController.view.trailingAnchor.constraint(equalTo: mainView.topContainerView.trailingAnchor, constant: 0),
            pageController.view.topAnchor.constraint(equalTo: mainView.topContainerView.topAnchor, constant: 0),
            pageController.view.bottomAnchor.constraint(equalTo: mainView.topContainerView.bottomAnchor, constant: 0)])
        pageController.didMove(toParent: self)
       // pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    func setUpPageView(){
        mainView.btnHome.addTarget(self, action: #selector(onClickTab), for: .touchUpInside)
        mainView.btnFood.addTarget(self, action: #selector(onClickTab), for: .touchUpInside)
        mainView.btnMart.addTarget(self, action: #selector(onClickTab), for: .touchUpInside)
        mainView.btnGenie.addTarget(self, action: #selector(onClickTab), for: .touchUpInside)
        onClickSelectTab(tag: 101)
    }
    
    @IBAction func onClickTab(_ sender: UIButton) {
        self.onClickSelectTab(tag: sender.tag)
    }
    
    func onClickSelectTab(tag:Int){
        if tag == 101{
            pageController.goToMainVC(animated: false, completion: nil)
        }else if tag == 102{
            pageController.goToFoodVC(animated: false, completion: nil)
        } else if tag == 103{
            pageController.goToMartVC(animated: false, completion: nil)
        } else if tag == 104{
            pageController.goToGenieVC(animated: false, completion: nil)
        }
    }
}
