//
//  CartPresenter.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

class CartPresenter : ViewToPresenterCartProtocol {

  var cartView: PresenterToViewCartProtocol?
  var cartInteractor: PresenterToInteractorCartProtocol?
  
  func getFoods(kullanici_adi: String) {
    cartInteractor?.getAllFoods(kullanici_adi: kullanici_adi)
  }
  func delete(sepet_yemek_id: String, kullanici_adi: String) {
    cartInteractor?.delete(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
  }
}
extension CartPresenter : InteractorToPresenterCartProtocol {
  
  func dataSendToPresenter(foodsList: Array<Cart>) {
    cartView?.dataSendToView(foodsList: foodsList)
  }
  
}
