//
//  SignupViewController.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 14.01.22.
//

import UIKit

class SignupViewController: UIViewController {
    
    var viewModel: SignupViewModel?
    @IBOutlet weak var goToLoginButton: UIButton!
    
    
    deinit {
        print("Deinit \(self)")
    }
    
    
    @IBAction func goLoginButtonTouchedUpInside(_ sender: Any) {
        guard let viewModel = self.viewModel else { return }
        viewModel.goToLogin()
    }
    
}
