//
//  CartProtocols.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

protocol ViewToPresenterCartProtocol {
  
  var cartView:PresenterToViewCartProtocol?{get set }
  var cartInteractor:PresenterToInteractorCartProtocol?{get set}
  
  func getFoods(kullanici_adi:String)
  func delete(sepet_yemek_id:String,kullanici_adi:String)

}
protocol PresenterToInteractorCartProtocol {
  
  var cartPresenter:InteractorToPresenterCartProtocol?{get set}
  
  func getAllFoods(kullanici_adi:String)
  func delete(sepet_yemek_id:String,kullanici_adi:String)
  
}

protocol InteractorToPresenterCartProtocol {
  
  func dataSendToPresenter(foodsList: Array<Cart>)

}
protocol PresenterToViewCartProtocol {
  func dataSendToView(foodsList: Array<Cart>)

}

protocol PresenterToRouterCartProtocol {
  static func createModule(ref:CartView)
  
}
