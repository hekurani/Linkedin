//
//  FrontViewController.swift
//  LinkedIn
//
//  Created by TDI Student on 24.8.23.
//

import UIKit
//In this class is implemented the FrontviewController and the main controller with 2 buttons signUp and LogIn.
class FrontViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        logoImageFunc()
    }
    
    func logoImageFunc (){
        
        if let image = UIImage(named: "logo") {
            logoImage.image = image
        }
        
             let widthConstraint = loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7) // 80% of the screen width
               widthConstraint.isActive = true

               // Add height constraint relative to the screen height
                let heightConstraint = loginButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07) // 50% of the screen height
               heightConstraint.isActive = true
        
        let widthConstraintSB = signupButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7) // 80% of the screen width
          widthConstraintSB.isActive = true

          // Add height constraint relative to the screen height
           let heightConstraintSB = signupButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07) // 50% of the screen height
          heightConstraintSB.isActive = true
        
        
        loginButton.layer.cornerRadius = loginButton.layer.frame.height/3
        loginButton.layer.masksToBounds = true
        
        signupButton.layer.cornerRadius = loginButton.layer.frame.height/3
        signupButton.layer.masksToBounds = true
  
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
