//
//  MyPageViewController.swift
//  TijerinaIsaac-hw6
//
//  Created by Isaac on 3/3/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    //Var that holds the view controller pages
    fileprivate(set) lazy var orderedViewControllers: [ViewController] = {
        return [self.newViewController(number:1),
               self.newViewController(number:2),
               self.newViewController(number:3),
               self.newViewController(number:4),
               self.newViewController(number:5),
               self.newViewController(number:6),
               self.newViewController(number:7)]
        }() as! [ViewController]
    
    //Sets the transition style
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    //First thing to run
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets title
        self.title = "Wonders of the World"
        dataSource = self
        //Sets the pages
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        //Sets the colors of the page bar
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.backgroundColor = UIColor.lightGray
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //When called returns a new viewcontroller with UIimage
    fileprivate func newViewController(number:Int) -> UIViewController {
        let viewController:ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC") as! ViewController
        viewController.indexP = number
        return viewController
    }
}

//Sets which view controller is previous to the current one
extension MyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController as! ViewController) else {
            return nil
        }
        var previousIndex = viewControllerIndex - 1
        if previousIndex < 0 {
            previousIndex = orderedViewControllers.count - 1
        }
        guard orderedViewControllers.count != previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    //Sets which view controller is agter the current one
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController as! ViewController) else {
            return nil
        }
        var nextIndex = viewControllerIndex + 1
        if nextIndex >= orderedViewControllers.count {
            nextIndex = 0
        }
        guard orderedViewControllers.count != nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndex(for pageViewController:UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController as! ViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
