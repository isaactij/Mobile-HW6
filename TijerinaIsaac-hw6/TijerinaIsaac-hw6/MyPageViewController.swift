//
//  MyPageViewController.swift
//  TijerinaIsaac-hw6
//
//  Created by Isaac on 3/3/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import UIKit

class MyPageViewController: UIPageViewController {
    
    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
       return [self.newViewController(),
               self.newViewController(),
               self.newViewController(),
               self.newViewController(),
               self.newViewController(),
               self.newViewController(),
               self.newViewController()]
        }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Page Controller"
        dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func newViewController() -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension MyPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
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
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
