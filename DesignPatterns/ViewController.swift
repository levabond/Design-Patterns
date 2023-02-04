//
//  ViewController.swift
//  DesignPatterns
//
//  Created by Lev Bondarenko on 03.02.2023.
//

import UIKit

class ViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class BuyViewController: UIViewController {
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

class CreateAccountViewController: UIViewController {}
