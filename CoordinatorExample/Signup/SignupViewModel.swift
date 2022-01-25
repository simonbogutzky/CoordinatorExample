//
//  SignupViewModel.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 14.01.22.
//

import Foundation

class SignupViewModel {
    
    weak var coordinatorDelegate: SignupViewModelCoordinatorDelegate?
    
    
    deinit {
        print("Deinit \(self)")
    }
    
    
    func goToLogin() {
        guard let coordinatorDelegate = self.coordinatorDelegate else { return }
        coordinatorDelegate.goToBackOrClose()
    }
    
}
