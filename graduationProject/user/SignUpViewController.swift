//
//  SignUpViewController.swift
//  graduationProject
//
//  Created by Burak Kara on 23.02.2023.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var repeatPasswordTextField:
  UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
  }
    @IBAction func signUpButton(_ sender: Any) {
      
      let email = emailTextField.text ?? ""
      let pass = passwordTextField.text ?? ""
      let repeatPass = repeatPasswordTextField.text ?? ""
      
      
      if pass.isEmpty || email.isEmpty || pass != repeatPass {
        Common.showAlert2(title: "Uyarı !", message: "Email ve Şifreyi Kontrol Ediniz", vc: self)
        return
      }
      createUser(email: email, password: pass)
      
    }
    
    func createUser(email: String, password: String){
      
      Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
       
        if error != nil {
          Common.showAlert2(title: "Uyarı!", message: error?.localizedDescription ?? "Kullanıcı oluşturulamadı", vc: self)
        } else {
          self.dismiss(animated: true, completion: nil)
      }
        
    }
    
  }
    
}



