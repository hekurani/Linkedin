//
//  logInViewController.swift
//  LinkedIn
//
//  Created by TDI Student on 10.8.23.
//

import UIKit
// This class has function of logging In and makes transition from one controller to another
class logInViewController: UIViewController {
    // Here are connected some labels and textfields of log In and error label is hidden if some error happens it shows
    let label = UILabel()
    @IBOutlet weak var errorLabel: UILabel!
    var gender:String=""
    @IBOutlet weak var ForgotPassword: UILabel!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // errorLabel its hidden and makeRoundedfunction excecute to make the button rounded
        errorLabel.isHidden = true
makeButtonRounded()
        // function buttontapped it is excecutet when button is tapped
        logInButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    }
        // This function transition the controller from this controller to forgotPassword Controller
    @objc func forgotPasswordTapped() {
            // This function will be called when the ForgotPassword label is tapped
        guard let vc=storyboard?.instantiateViewController(withIdentifier: "ForgotId") as? ForgotPasswordViewController else{ return }
        present(vc,animated:true);
            print("Forgot Password tapped")
    }
    // this function is used to validate users and is used to check in API if the user excists and if it excists makes that transition to main page and if not it shows an error with animation
    func validateUsers(completionHandler: @escaping (Bool) -> Void) {
        UserRequest.getUsers { Users, error in
            if let error = error {
                print("getUserError: \(error)")
                completionHandler(false) // Return false due to error
            } else {
                for user in Users {
                    if let password = self.Password.text, let username = self.Username.text {
                        if user.name == username && user.password == password {
                            // User authentication successful
                            self.gender=user.gender;
                            completionHandler(true)
                            return
                        }
                    }
                }
                completionHandler(false) // No matching user found
            }
        }
    }
    @objc func buttonTapped() {
        print(ViewController.users)
        
//        UserRequest.createUsers {user, error in
//            if error != nil{
//                print("geUserError\(String(describing:error))")
//            }
//            else{
//                if let user = user {
//                    print("new User name=\(user.name)")
//                }
//            }
       // }
        var check=false;
//                for user in ViewController.users {
//                    if let storedUsername = user["username"], let storedPassword = user["password"] {
//                        if storedUsername == Username.text && storedPassword == Password.text {
//                            if getUserbyCreditieanls(username: storedUsername, password: storedPassword) != nil{
//                            check = true
//                                print("true")
//                            }
//                            else {
//                                print("false")
//                                check = false;
//                            }
//                        }
//                    }
//                }
        validateUsers { isSuccess in
            if isSuccess {
                check=true
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeID") as? HomeViewController else {
                    return
                }
                
                vc.receivedUsername=self.Username.text
                vc.gender=self.gender
                self.present(vc,animated:true);
                
         
            }
            else{
                self.setUpLabel()
                self.startAnimation()
                print("something")
            }
            }
        }
    func setUpLabel(){
        label.text = "Authenthication Error"
        label.textAlignment = .center
        label.textColor = UIColor.red
        label.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        view.addSubview(label)
    }
    func startAnimation() {
        // Set the initial position of the label
        label.center.y = view.frame.height - label.frame.height / 2

        // Animate the label's position to move it up by 10 pixels
        UIView.animate(withDuration: 2.0, animations: {
            self.label.center.y -= 10
        }, completion: { _ in
            // Animation completion block
            print("Animation completed!")
        })
    }
        func getUserbyCreditieanls(username:String,password:String){
        UserRequest.getUserbyCredentials(username:username,password:password){user,error in
            if error != nil {
                print("fa")
                print("getUserError\(String(describing:error))")
            } else {
                if let user = user {
                    print("id Users = \(user.Id)")
                    print("name Employee = \(user.name)")
                    print("email Users = \(user.email)")
                    print("password Users = \(user.password)")
                }
                if  user == nil {
                    print("no user was found")
                }
    }
        }
    }
    // this function is used to get the user based on specific ID
    func getUser(id:Int){
        UserRequest.getUser(id:id){user,error in
            if error != nil {
                print("fa")
                print("getUserError\(String(describing:error))")
            } else {
                if let user = user {
                    print("id Users = \(user.Id)")
                    print("name Employee = \(user.name)")
                    print("email Users = \(user.email)")
                    print("password Users = \(user.password)")
                }
            }
            
        }

    }
    //This function is used to create new user
    func createUser(){
        UserRequest.createUsers { user, error in
            if error != nil{
                print("getUserError\(String(describing:error))")
            }
            else{
                if let user = user {
                    
                    print("new user created with success")
                }
            }
        }
    }
    func getUsers(){
        UserRequest.getUsers {Users, error in
            if error != nil {
                print("getUserError\(String(describing:error))")
            }
            else{
                for user in Users {
                    print("getUserId=\(user.Id)")
                }
            
            }
        }
    }

    private func makeButtonRounded() {
        logInButton.layer.borderColor =  UIColor.white.cgColor
         logInButton.layer.borderWidth = 1.5
        logInButton.layer.cornerRadius = logInButton.layer.frame.height/3 // height / 2
         logInButton.layer.masksToBounds = true
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
