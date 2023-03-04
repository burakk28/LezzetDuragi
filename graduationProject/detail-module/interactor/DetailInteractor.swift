//
//  DetailInteractor.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation
import Alamofire
import Firebase

class DetailInteractor : PresenterToInteractorDetailProtocol {
  
  let kullanici = Auth.auth().currentUser!.email!
  let delete = CartInteractor()
  

func addFood(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
    
    let params : Parameters = ["yemek_adi":yemekAdi,"yemek_resim_adi":yemekResimAdi,"yemek_fiyat":yemekFiyat,"yemek_siparis_adet":yemekSiparisAdet,"kullanici_adi":kullaniciAdi]
    
    AF.request(
      "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).responseJSON { (response) in
        
        if let data = response.data{
          do{
   
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
              print(data)
            }
          }catch{
            print(error.localizedDescription)
          }
        }
      }
  }}

  
