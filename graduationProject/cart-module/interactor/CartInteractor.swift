//
//  CartInteractor.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation
import Alamofire
import Firebase

class CartInteractor  : PresenterToInteractorCartProtocol {
  

  var cartPresenter: InteractorToPresenterCartProtocol?
  let currentUser = Auth.auth().currentUser!.email!
  var list = [Cart]()
  
  func getAllFoods(kullanici_adi: String) {
  
          let params: Parameters = ["kullanici_adi":kullanici_adi,]
          
          AF.request(
              "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).responseJSON { (response) in
                  if let data = response.data{
                      do {
                          let json = try JSONDecoder().decode(CartReply.self, from: data)
                          
                          if let getFoodList = json.sepet_yemekler{
                            self.list = getFoodList
                           print(response)

                          }
                          self.cartPresenter?.dataSendToPresenter(foodsList: self.list)
                          
                      }catch{
                          self.cartPresenter?.dataSendToPresenter(foodsList: [])
                          print((error.localizedDescription))
                    }
                }
            }
      }
  
  func delete(sepet_yemek_id: String, kullanici_adi: String) {
    
    let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":kullanici_adi]
            
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON { (response) in
                if let data = response.data{
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                          
                          self.getAllFoods(kullanici_adi:"\(self.currentUser)")
                        }
                        } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
  
  }
  
  
  

