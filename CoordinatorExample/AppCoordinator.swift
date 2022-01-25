//
//  AppCoordinator.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 13.01.22.
//

import UIKit

class AppCoordinator: NSObject, Coordinator {
    
    var parent: Coordinator?
    var children: [Coordinator] = []
    
    var viewController: UIViewController?
    var navigationController: UINavigationController?
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    override init() {
        super.init()
    }
    
    init(navigationController: UINavigationController) {
        super.init()
        self.navigationController = navigationController
        self.navigationController!.delegate = self
    }
    
    
    func start() {
        goToLogin()
    }
    
    func goToLogin() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        self.addChild(loginCoordinator)
        loginCoordinator.start()
    }
    
}

extension AppCoordinator: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from), !navigationController.viewControllers.contains(fromViewController) else { return }
             
        _ = self.removeCoordinatorOf(fromViewController: fromViewController)
    }
    
}
