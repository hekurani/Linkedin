//
//  ViewController.swift
//  LinkedIn
//
//  Created by TDI Student on 8.8.23.
//

import UIKit
import Alamofire
import SwiftyJSON
// here it is used the SignUpController which sends the request in an API (Fake request) for creating new user and it is implemented validating of inputs
class ViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    
    static var users: [[String: String]] = []
    @IBOutlet weak var errorLabel: UILabel!
   
            
    @IBOutlet weak var Password3: UITextField!
    @IBOutlet weak var Password: UIView!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Username: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.isHidden = true
        // Do any additional setup after loading the view.
             makeButtonRounded()
        signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
   

              func getUsers(completionHandler: @escaping (Bool) -> Void) {
        UserRequest.getUsers { Users, error in
            if let error = error {
                print("getUserError: \(error)")
                completionHandler(false) // Return false due to error
            } else {
                for user in Users {
                    if let emailText = self.Email.text, let passwordText = self.Password3.text {
                        if user.email == emailText && user.password == passwordText {
                            // User authentication successful
                            completionHandler(true)
                            return
                        }
                    }
                }
                completionHandler(false) // No matching user found
            }
        }
    }
    //    func fetchDataFromAPI() {
//            let apiURLString = //https://dummyjson.com/users // Replace with the actual API URL
//
//        AF.request(apiURLString,parameters:nil,encoding:JSONEncoding.default,headers:nil).responseJSON { response in
//                switch response.result {
//                case .success(let data):
//                    if let dataArray = data as? [[String: Any]] {
//                        for userDict in dataArray {
//                            if let username = userDict["username"] as? String,
//                               let password = userDict["password"] as? String,
//                               let email = userDict["email"] as? String {
//                                let user = ["username": username, "password": password, "email": email]
//                                print(username)
//                                ViewController.users.append(user)
//                            }
//                        }
//
//                        print("Fetched users: \(ViewController.users)")
//                    }
//                case .failure(let error):
//                    print("API request error: \(error)")
//                }
//            }
//        }
    private func makeButtonRounded() {
        signUpButton.layer.borderColor =  UIColor.white.cgColor
         signUpButton.layer.borderWidth = 1.5
        signUpButton.layer.cornerRadius = signUpButton.layer.frame.height/3 // height / 2
         signUpButton.layer.masksToBounds = true
    }
    @objc func buttonTapped() {
        var userDict: [String: String]=[:]
        if let passwordText = Password3.text, let emailText = Email.text, let usernameText = Username.text {
               print("Entered password: \(passwordText)")
               print("Entered email: \(emailText)")
               print("Entered username: \(usernameText)")
               
               // Create a dictionary to store user information
               var userDict: [String: String] = ["username": usernameText, "password": passwordText, "email": emailText]
               
               // Add the user dictionary to the array
                           
            print("Users array: \(ViewController.users)")
           } else {
               print("Fields are empty")
           }
        var check = false;
        if let usernameText = Username.text, let passwordText = Password3.text {
            if usernameText.count < 8 || passwordText.count < 8 {
                check = true
            }}
        getUsers { isSuccess in
            if isSuccess {
                check=true;
            } else {
                check=false
            }
        }
        if check {
            errorLabel.isHidden = false
                    errorLabel.text = "authenthication error"
            
        }
        else{
            ViewController.users.append(userDict)

        guard let vc=storyboard?.instantiateViewController(withIdentifier: "HomeID") as? HomeViewController else{ return }
        present(vc,animated:true);
        }
    }

}

