//
//  SettingsViewController.swift
//  graduationProject
//
//  Created by Burak Kara on 24.02.2023.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
  
  @IBOutlet weak var emailTextField: UILabel!
  @IBOutlet weak var dateRegistrationTextField: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    if let currentUser = Auth.auth().currentUser {
      
      let creationDate = currentUser.metadata.creationDate?.formatted(date:.abbreviated, time: .shortened)
        emailTextField.text = "\(currentUser.email!)"
        dateRegistrationTextField.text = "\(creationDate!)"
    
    }

  }
  
  @IBAction func logOutButton(_ sender: Any) {
    do {
      try Auth.auth().signOut()
      performSegue(withIdentifier: "toLogin", sender: nil)
      print("çıkış başarılı")
    } catch {
      print("hata")
    }
    
  }
  
}
