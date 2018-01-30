//
//  ViewController.swift
//  GridProject
//
//  Created by Diaa Alwakil on 2018-01-23.
//  Copyright © 2018 Diaa Alwakil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    lazy var vcs:[UIViewController] = [PointMarkerViewController(),CircleGridViewController(),GridViewController()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pageController.view.frame = self.view.bounds
        self.addChildViewController(pageController)
        self.view.addSubview(pageController.view)
        self.pageController.dataSource = self
        vcs[0].view.frame = pageController.view.bounds
        self.pageController.setViewControllers([vcs[0]], direction: .forward, animated: false, completion: nil)
        
     
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UIPageViewControllerDataSource{
    
    

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = vcs.index(of: viewController),index+1 < vcs.count
            else { return nil }
        print("viewControllerAfter \(index+1)")
        return vcs[index+1]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = vcs.index(of: viewController),index > 0
            else { return nil }
        print("viewControllerBefore \(index)")
        return vcs[index - 1]
    }
}
