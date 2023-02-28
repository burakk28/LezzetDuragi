//
//  MainInteractor.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation
import Alamofire

class MainInteractor :PresenterToInteractorMainProtocol {
  
  var mainPresenter: InteractorToPresenterMainProtocol?
  
  func getAllFoods() {
    
           AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON { response in
               
               if let data = response.data {
                   do {
                       let response = try JSONDecoder().decode(FoodsReply.self, from: data)
                       var list = [Foods]()
                       if let getList = response.yemekler {
                           list = getList
                       }
                     self.mainPresenter?.dataSendToPresenter(foodsList: list)
                   }
                   catch{
                       print("Yemekler sunucudan cekilemedi")
                   }
               }
           }
    }
}
