//
//  DetailRouter.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation

class DetailRouter : PresenterToRouterDetailProtocol {
  
  static func createModule(ref: DetailView) {
    ref.detailPresentObject = DetailPresenter()
    ref.detailPresentObject?.detailInteractor = DetailInteractor()
  }

}
