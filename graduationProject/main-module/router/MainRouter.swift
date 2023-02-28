//
//  MainRouter.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

class MainRouter : PresenterToRouterMainProtocol {
  
  
  static func createModule(ref: MainView) {
    
    let presenter  = MainPresenter()
    
    ref.mainViewPresenterObject = presenter
    
    ref.mainViewPresenterObject?.mainInteractor = MainInteractor()
    ref.mainViewPresenterObject?.mainView = ref
    
    ref.mainViewPresenterObject?.mainInteractor?.mainPresenter = presenter
    
    
  }
  
}
