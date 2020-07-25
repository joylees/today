//
//  ViewController.swift
//  Today
//
//  Created by Joy on 4/14/20.
//  Copyright © 2020 Joy. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButtonClicked(_ sender: Any) {
        
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "ShowSignUp", sender: self)
    }

}

