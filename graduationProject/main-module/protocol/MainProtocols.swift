//
//  MainProtocols.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

protocol ViewToPresenterMainProtocol {
  
  var mainView:PresenterToViewMainProtocol?{get set}
  var mainInteractor:PresenterToInteractorMainProtocol?{get set}
  func getFoods()

}
protocol PresenterToInteractorMainProtocol {
  
  var mainPresenter:InteractorToPresenterMainProtocol?{get set}
  func getAllFoods()
}
protocol InteractorToPresenterMainProtocol {
    
    func dataSendToPresenter(foodsList: Array<Foods>)
}
protocol PresenterToViewMainProtocol {
  
  func dataSendToView(foodsList: Array<Foods>)
}
protocol PresenterToRouterMainProtocol {
    
    static func createModule(ref: MainView)
}
