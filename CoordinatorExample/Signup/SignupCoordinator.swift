//
//  SignupCoordinator.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 24.01.22.
//

import UIKit

class SignupCoordinator: Coordinator {
    
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
        let signupViewController = storyboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        let signupViewModel = SignupViewModel()
        signupViewModel.coordinatorDelegate = self
        signupViewController.viewModel = signupViewModel
        self.viewController = signupViewController
        
        if navigationController != nil {
            goToSignup()
        } else {
            presentSignup()
        }
    }
    
    func goToSignup() {
        guard let viewController = self.viewController else { return }

        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentSignup() {
        guard let viewController = self.viewController else { return }
        viewController.isModalInPresentation = true
        parent?.viewController?.present(viewController, animated: true, completion: nil)
    }
    
}

extension SignupCoordinator: SignupViewModelCoordinatorDelegate {
    
    func goToBackOrClose() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            guard let viewController = self.viewController else { return }
            
            viewController.dismiss(animated: true, completion: nil)
        }
        
        parent?.removeChild(self)
    }
    
}
