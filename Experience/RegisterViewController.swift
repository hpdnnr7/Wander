//
//  RegisterViewController.swift
//  Experience
//
//  Created by Mayra Vázquez-Sánchez on 1/24/21.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerButton.layer.cornerRadius = 5
    }
    
    // MARK: - IBActions
    @IBAction func registerPressed(_ sender: UIButton) {
        
    }
    
}
