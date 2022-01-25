//
//  LoginViewController.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 14.01.22.
//

import UIKit

class LoginViewController: UIViewController {
    
    var viewModel: LoginViewModel?
    @IBOutlet weak var goToLoginAgainButton: UIButton!
    @IBOutlet weak var goToSignupButton: UIButton!
    @IBOutlet weak var presentSignupButton: UIButton!
    
    deinit {
        print("Deinit \(self)")
    }
    
    @IBAction func goToLoginAgainButtonTouchedUpInside(_ sender: Any) {
        guard let viewModel = self.viewModel else { return }
        viewModel.goToLoginAgain()
    }
    
    @IBAction func goToSignupButtonTouchedUpInside(_ sender: Any) {
        guard let viewModel = self.viewModel else { return }
        viewModel.goToSignup()
    }
    
    @IBAction func presentSignupButtonTouchedUpInside(_ sender: Any) {
        guard let viewModel = self.viewModel else { return }
        viewModel.presentSignup()
    }
    
}
