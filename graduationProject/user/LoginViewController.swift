//
//  LoginViewController.swift
//  graduationProject
//
//  Created by Burak Kara on 23.02.2023.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
  
  @IBOutlet weak var mailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.hidesBackButton = true
  }
  
  @IBAction func signUpButton(_ sender: Any) {
    

  }
  @IBAction func loginButton(_ sender: Any) {
    
    //Giriş sayfasında tf'ler kontrolü yapılıyor
    
    let pass = passwordTextField.text ?? ""
           let email = mailTextField.text ?? ""
           
           if pass.isEmpty || email.isEmpty {

             Common.showAlert2(title: "Uyarı", message: "Email/Password Boş Bırakılamaz", vc: self)
             return
           }
           //Firebasede kullanıcı kontrolü yapılıyor
           Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
               
               if error != nil {
                 Common.showAlert2(title: "Uyarı", message: error?.localizedDescription ?? "Hatalı Giriş", vc: self)
               } else {
                 self.performSegue(withIdentifier: "toMain", sender:nil)
                   //Doğruysa giriş yapıyor
               }
               
           }
  }
}
