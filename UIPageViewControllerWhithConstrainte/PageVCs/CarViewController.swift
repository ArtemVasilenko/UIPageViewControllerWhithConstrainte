//
//  CarViewController.swift
//  UIPageViewControllerWhithConstrainte
//
//  Created by Артем on 4/15/19.
//  Copyright © 2019 Артем. All rights reserved.
//

import UIKit

class CarViewController: UIViewController {
    
    private let carImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false //управление констреинтами
        
        return view
    }()
    
    private let carName: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let flagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var subview: [UIView] = [self.carImage, self.carName, self.flagLabel]
    
    init(carWith: CarsHelper) {
        super.init(nibName: nil, bundle: nil) //правило инициализатора, чтобы менять
        view.backgroundColor = .purple
        edgesForExtendedLayout = [] //сейв-зона в "брови" 10-го айфона
        carImage.image = carWith.image
        carName.text = carWith.name
        flagLabel.text = carWith.flag
        
        for view in subview {
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250),
            NSLayoutConstraint(item: carImage, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 150),
            NSLayoutConstraint(item: carImage, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: carName, attribute: .top, relatedBy: .equal, toItem: carImage, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: carName, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)])
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: flagLabel, attribute: .top, relatedBy: .equal, toItem: carName, attribute: .bottom, multiplier: 1, constant: 50),
            NSLayoutConstraint(item: flagLabel, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented") //из-за переопределения инициализатора
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
