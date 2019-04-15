//
//  MyViewController.swift
//  UIPageViewControllerWhithConstrainte
//
//  Created by Артем on 4/15/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class MyViewController: UIPageViewController {
    
    var cars = [CarsHelper]()
    let bmw = UIImage(named: "bmw")
    let audi = UIImage(named: "audi")
    let porshe = UIImage(named: "porshe")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let carBMW = CarsHelper(name: "car - BMW", image: bmw!, flag: "🤖")
        let carAUDI = CarsHelper(name: "car - AUDI", image: audi!, flag: "🧚🏾‍♂️")
        let carPORSHE = CarsHelper(name: "car - PORSHE", image: porshe!, flag: "🎅🏼")
        
        cars.append(carBMW)
        cars.append(carAUDI)
        cars.append(carPORSHE)
        
        
        self.dataSource = self
        
    }
    
    
    lazy var arrayCarsVCs: [CarViewController] = {
        var carVC = [CarViewController]()
        
        for car in cars {
            carVC.append(CarViewController(carWith: car))
        }
        
        return carVC
    }()
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: nil)
        view.backgroundColor = .green
        setViewControllers([arrayCarsVCs[0]], direction: .forward, animated: true, completion: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension MyViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = arrayCarsVCs.firstIndex(of: viewController as! CarViewController) else { return nil }
        let previusIndex = vcIndex - 1
        
        guard previusIndex >= 0 else { return nil }
        guard arrayCarsVCs.count > previusIndex else { return nil }
        
        return arrayCarsVCs[previusIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let vcIndex = arrayCarsVCs.firstIndex(of: viewController as! CarViewController) else { return nil }
        let nextIndex = vcIndex + 1
        
        guard nextIndex >= 0 else { return nil }
        guard arrayCarsVCs.count > nextIndex else { return nil }
        
        return arrayCarsVCs[nextIndex]
        
    }
    
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return arrayCarsVCs.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
}
