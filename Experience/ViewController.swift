//
//  ViewController.swift
//  Experience
//
//  Created by Mayra Vázquez-Sánchez on 1/23/21.
//

import UIKit
import MaterialComponents

class ViewController: UIViewController {
    
    // MARK: - UI
    @IBOutlet weak var loginButton: MDCButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let loginViewController = segue.destination as! LoginViewController
        
    }
    
    // MARK: - IBActions
    @IBAction func loginPressed(_ sender: MDCButton) {
        
    }

}

