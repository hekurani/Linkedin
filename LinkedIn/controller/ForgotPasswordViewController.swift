//
//  ForgotPasswordViewController.swift
//  LinkedIn
//
//  Created by TDI Student on 15.8.23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBAction func continueButon(_ sender: Any) {
        guard let vc=storyboard?.instantiateViewController(withIdentifier: "logIn_ID") as? logInViewController else{ return }
        present(vc,animated:true);
    }
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
