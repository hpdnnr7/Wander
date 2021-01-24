//
//  RegisterViewController.swift
//  Experience
//
//  Created by Mayra Vázquez-Sánchez on 1/24/21.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func registerPressed(_ sender: Any) {
        
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            let db = Firestore.firestore()
            
            db.collection("users").addDocument(data: ["email": email, "uid": result!.user.uid])
            
            self.transitionToHome()
            
            }
    }
    
    func transitionToHome() {
        let homeViewController =
            storyboard?.instantiateViewController(identifier: "HomeVC") as?
        HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    
}
