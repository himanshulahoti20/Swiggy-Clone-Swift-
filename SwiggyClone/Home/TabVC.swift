//
//  TabVC.swift
//  SwiggyClone
//
//  Created by Himanshu Lahoti on 12/07/22.
//

import UIKit

class TabVC: UIPageViewController {
    
    var mainVC = MainVC()
    var genieVC = GenieVC()
    var foodVC = FoodVC()
    var martVC = MartVC()
    
    fileprivate lazy var pages: [UIViewController] = {
        return [
            self.getViewController(index: "0"),
            self.getViewController(index: "1"),
            self.getViewController(index: "2"),
            self.getViewController(index: "3")
        ]
    }()
    
    
    
    fileprivate func getViewController(index : String) -> UIViewController{
        if (index == "0"){
            return mainVC
        }else if(index == "1"){
            return foodVC
        }else if(index == "2"){
            return martVC
        }else if(index == "3"){
            return genieVC
        }else{
            return mainVC
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.dataSource = self
        if let firstVC = pages.last{
            setViewControllers([firstVC], direction: .forward , animated: false, completion: nil)
        }
        for view in self.view.subviews {
            if let subView = view as? UIScrollView {
                subView.isScrollEnabled = false
            }
        }
    }
}
extension TabVC: UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0          else { return pages.last }
        
        guard pages.count > previousIndex else { return nil        }
        
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?{
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < pages.count else { return pages.first }
        guard pages.count > nextIndex else { return nil         }
        return pages[nextIndex]
    }
    
    
    func goToMainVC(animated: Bool = false, completion: ((Bool) -> Void)? = nil) {
        setViewControllers([mainVC], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToFoodVC(animated: Bool = false, completion: ((Bool) -> Void)? = nil) {
        setViewControllers([foodVC], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToMartVC(animated: Bool = false, completion: ((Bool) -> Void)? = nil) {
        setViewControllers([martVC], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToGenieVC(animated: Bool = false, completion: ((Bool) -> Void)? = nil) {
        setViewControllers([genieVC], direction: .forward, animated: animated, completion: completion)
    }
}
