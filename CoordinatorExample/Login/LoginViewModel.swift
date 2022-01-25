//
//  LoginViewModel.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 13.01.22.
//

import Foundation

class LoginViewModel {
    
    weak var coordinatorDelegate: LoginViewModelCoordinatorDelegate?
    
    
    deinit {
        print("Deinit \(self)")
    }
    
    
    func goToLoginAgain() {
        guard let coordinatorDelegate = self.coordinatorDelegate else { return }
        coordinatorDelegate.goToLoginAgain()
    }
    
    func goToSignup() {
        guard let coordinatorDelegate = self.coordinatorDelegate else { return }
        coordinatorDelegate.goToSignup()
    }
    
    func presentSignup() {
        guard let coordinatorDelegate = self.coordinatorDelegate else { return }
        coordinatorDelegate.presentSignup()
    }
    
}
