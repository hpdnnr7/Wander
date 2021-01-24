//
//  ViewController.swift
//  Experience
//
//  Created by Mayra Vázquez-Sánchez on 1/23/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties

    // MARK: - UI
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius = 5
        signUpButton.layer.cornerRadius = 5
    }
    
    // MARK: - IBActions
    @IBAction func loginPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
    }
    
}

