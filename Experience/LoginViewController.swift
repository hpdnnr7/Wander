//
//  LoginViewController.swift
//  Experience
//
//  Created by Mayra Vázquez-Sánchez on 1/24/21.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func loginPressed(_ sender: UIButton) {
        
    }
    
}
