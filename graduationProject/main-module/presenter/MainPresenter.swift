//
//  MainPresenter.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

class MainPresenter :ViewToPresenterMainProtocol {

  var mainView: PresenterToViewMainProtocol?
  var mainInteractor: PresenterToInteractorMainProtocol?
  
  func getFoods() {
    mainInteractor?.getAllFoods()
  }

}
extension MainPresenter : InteractorToPresenterMainProtocol {
  
  func dataSendToPresenter(foodsList: Array<Foods>) {
    mainView?.dataSendToView(foodsList: foodsList)
  }

}
