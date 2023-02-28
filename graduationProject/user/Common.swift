//
//  Common.swift
//  graduationProject
//
//  Created by Burak Kara on 23.02.2023.
//

import Foundation
import UIKit


class Common: NSObject {

    class func showAlert(title: String, message: String, vc: UIViewController) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
            vc.dismiss(animated: true, completion: nil)
        }))
        vc.present(alert, animated: true, completion: nil)
    }
  class func showAlert2(title: String, message: String, vc: UIViewController) {
      
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action) in
      }))
      vc.present(alert, animated: true, completion: nil)
  }
}

