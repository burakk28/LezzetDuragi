//
//  DetailPresenter.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

class DetailPresenter : ViewToPresenterDetailProtocol{
  var detailInteractor: PresenterToInteractorDetailProtocol?
  
  func addFood(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
    detailInteractor?.addFood(yemekAdi: yemekAdi, yemekResimAdi: yemekResimAdi, yemekFiyat: yemekFiyat, yemekSiparisAdet: yemekSiparisAdet, kullaniciAdi: kullaniciAdi)
  }

}
