//
//  DetailProtocols.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

protocol ViewToPresenterDetailProtocol {
  
  var detailInteractor:PresenterToInteractorDetailProtocol?{get set}
  func addFood(yemekAdi:String,yemekResimAdi:String,yemekFiyat:Int,yemekSiparisAdet:Int,kullaniciAdi:String)

}
protocol PresenterToInteractorDetailProtocol {
  func addFood(yemekAdi:String,yemekResimAdi:String,yemekFiyat:Int,yemekSiparisAdet:Int,kullaniciAdi:String)

}

protocol PresenterToRouterDetailProtocol {
  static func createModule(ref:DetailView)
  
}
