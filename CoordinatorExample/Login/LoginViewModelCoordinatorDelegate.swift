//
//  LoginViewModelCoordinatorDelegate.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 14.01.22.
//

import Foundation

protocol LoginViewModelCoordinatorDelegate: AnyObject {
    
    func goToLoginAgain()
    func goToSignup()
    func presentSignup()
    
}
