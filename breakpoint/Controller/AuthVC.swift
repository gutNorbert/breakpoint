//
//  AuthVC.swift
//  breakpoint
//
//  Created by Gutpinter Norbert on 2017. 12. 24..
//  Copyright © 2017. Gut Norbert. All rights reserved.
//

import UIKit
import Firebase
import FacebookLogin
import FacebookCore

class AuthVC: UIViewController {
    
    //Outlets
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
                
    }
    

    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
    
    
    //fb error handling
    @objc  @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile, .email ], viewController: self) { loginResult in
            switch loginResult {
            case .failed:
                print("error")
            case .cancelled:
            print("User cancelled login")
            case .success:
                self.getUserInfo(completion: { (userInfo, error) in
                    if error != nil {
                        print("error")}
                    if let userInfo = userInfo, let id = userInfo["id"], let email = userInfo["email"]{
                        print(id)
                        print(email)
                        
                        AuthService.instance.loginUser(withEmail: email as! String, andPassword: id as! String, loginComplete: { (success, loginError) in
                            if success{
                                self.dismiss(animated: true, completion: nil)
                            } else {
                                print(String(describing: loginError?.localizedDescription))
                            }
                            
                            AuthService.instance.registerUser(withEmail: email as! String, andPassword: id as! String , userCreationComplete: { (success, registrationError) in
                                if success {
                                    AuthService.instance.loginUser(withEmail: email as! String, andPassword: id as! String, loginComplete: { (success, nil) in
                                        self.dismiss(animated: true, completion: nil)
                                        print("Sucessfully registered user")
                                    })
                                } else {
                                    print(String(describing: registrationError?.localizedDescription))
                                }
                            })
                        })
                        print("Logged in")
                        }
                    })
                }
            }
    }
    
    
    func getUserInfo(completion: @escaping (_ : [String: Any]?, _ : Error?) -> Void){
        let request = GraphRequest(graphPath: "me", parameters: ["fields":"id,email"])
        
        request.start { (response, result) in
            switch result {
            case .failed(let error):
                completion(nil,error)
                print("error")
            case .success(let graphResponse):
                completion(graphResponse.dictionaryValue, nil)
                
            }
        }
    }
    

    
}
