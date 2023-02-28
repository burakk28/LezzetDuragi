//
//  CartRouter.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

class CartRouter : PresenterToRouterCartProtocol {
  
  static func createModule(ref: CartView) {
    
    let presenter = CartPresenter()
    
    ref.cartPresenterObject = presenter
    
    ref.cartPresenterObject?.cartInteractor = CartInteractor()
    ref.cartPresenterObject?.cartView = ref
    
    ref.cartPresenterObject?.cartInteractor?.cartPresenter = presenter
  }
}

    
