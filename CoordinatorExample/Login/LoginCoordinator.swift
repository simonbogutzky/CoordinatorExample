//
//  LoginCoordinator.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 24.01.22.
//

import UIKit

class LoginCoordinator: Coordinator {
    
    var parent: Coordinator?
    var children: [Coordinator] = []
    
    var viewController: UIViewController?
    var navigationController: UINavigationController?
    
    let storyboard = UIStoryboard.init(name: "Main", bundle: .main)
    
    
    init() {}
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        print("Deinit \(self)")
    }
    
    
    func start() {
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        let loginViewModel = LoginViewModel()
        loginViewModel.coordinatorDelegate = self
        loginViewController.viewModel = loginViewModel
        self.viewController = loginViewController
        
        goToLogin()
    }
    
    func goToLogin() {
        guard let viewController = self.viewController else { return }

        navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension LoginCoordinator: LoginViewModelCoordinatorDelegate {
    
    func goToLoginAgain() {
        guard let navigationController = navigationController else { return }
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        self.addChild(loginCoordinator)
        loginCoordinator.start()
    }
    
    func goToSignup() {
        guard let navigationController = navigationController else { return }

        let signupCoordinator = SignupCoordinator(navigationController: navigationController)
        self.addChild(signupCoordinator)
        signupCoordinator.start()
    }
    
    func presentSignup() {
        let signupCoordinator = SignupCoordinator()
        self.addChild(signupCoordinator)
        signupCoordinator.start()
    }
    
}
