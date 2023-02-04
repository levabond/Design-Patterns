//
//  Coordinator.swift
//  DesignPatterns
//
//  Created by Lev Bondarenko on 03.02.2023.
//

import UIKit

protocol Coordinator: AnyObject {

    var childCoordinators: [Coordinator] { get set }

    init(navigationController: UINavigationController)

    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let firstViewController = ViewController()
        firstViewController.coordinator = self
        
        navigationController?.viewControllers = [firstViewController]
    }
    
    func buySubscription() {
        let vc = BuyViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }

    func createAccount() {
        let vc = CreateAccountViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
