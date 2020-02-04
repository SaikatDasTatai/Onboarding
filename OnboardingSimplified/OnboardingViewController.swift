//
//  OnboardingViewController.swift
//  OnboardingSimplified
//
//  Created by Saikat on 2/3/20.
//  Copyright © 2020 Saikat. All rights reserved.
//

import UIKit

class OnboardingViewController: UIPageViewController {

    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [
            getViewController(color: "Red"),
            getViewController(color: "Green"),
            getViewController(color: "Blue")
        ]
    }()
    private func getViewController(color: String) -> UIViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "\(color)VC")
        return vc
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.dataSource = self
        self.setViewControllers([orderedViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
}

extension OnboardingViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: viewController)else { return nil }
        if index - 1 < 0{
            return nil
        }else{
            return orderedViewControllers[index-1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: viewController)else { return nil }
        if index + 1 < orderedViewControllers.count{
            return orderedViewControllers[index+1]
        }else{
            return nil
        }
    }
    
    
}
