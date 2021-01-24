//
//  LoginViewController.swift
//  Experience
//
//  Created by Mayra Vázquez-Sánchez on 1/24/21.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 5
    }
    
    // MARK: - IBActions
    @IBAction func loginPressed(_ sender: UIButton) {
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               let password = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               
               Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                       let homeViewController =
                           self.storyboard?.instantiateViewController(identifier: "HomeVC") as?
                           HomeViewController
                       
                       self.view.window?.rootViewController = homeViewController
                       self.view.window?.makeKeyAndVisible()
            
               }
    }
    
}
