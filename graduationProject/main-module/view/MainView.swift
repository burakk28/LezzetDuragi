//
//  MainView.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import UIKit
import Alamofire
import Kingfisher

class MainView: UIViewController {
  
  @IBOutlet weak var tabView: UIView!
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var foodsCollectionView: UICollectionView!
  
  var foodsList = [Foods]()
  var filteredFoodList = [Foods]()
  var mainViewPresenterObject:ViewToPresenterMainProtocol?
  
  
  override func viewDidLoad() {

    
    super.viewDidLoad()
    // mainViewPresenterObject?.getFoods()
    
   navigationItem.hidesBackButton = true
   tabView?.layer.cornerRadius = 30
    
    
    searchBar.delegate = self
    foodsCollectionView.delegate = self
    foodsCollectionView.dataSource = self
    
    MainRouter.createModule(ref: self)
    
    
    let design = UICollectionViewFlowLayout()
    design.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
    design.minimumInteritemSpacing = 10
    design.minimumLineSpacing = 10
    let screenSize = UIScreen.main.bounds.width
    let itemSize = (screenSize-30)/2
    design.itemSize = CGSize(width: itemSize, height: itemSize*1.3)
    foodsCollectionView.collectionViewLayout = design
    
  }
  override func viewWillAppear(_ animated: Bool) {
    mainViewPresenterObject?.getFoods()
  }
  
  @IBAction func tapTapped(_ sender: UIButton) {
    
    let tag = sender.tag
    
    if tag == 0 {
     print("Main")
    }else if tag == 1 {
      performSegue(withIdentifier: "toCart", sender: nil)
      
    }else if tag == 2 {
      performSegue(withIdentifier: "toProfile", sender: nil)
    }
  }
  
}

extension MainView:PresenterToViewMainProtocol {
  
  func dataSendToView(foodsList: Array<Foods>) {
    
    self.foodsList = foodsList
    self.filteredFoodList = foodsList
    
    DispatchQueue.main.async {
      self.foodsCollectionView.reloadData()
    }
  }
  
}
extension MainView : UISearchBarDelegate {
  
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
          foodsList = filteredFoodList.filter { food in
            
            if food.yemek_adi!.lowercased().contains(searchText.lowercased()) {
              return true
                  } else if searchText.isEmpty { return true }
              return false
          }
          foodsCollectionView.reloadData()
      }
}

extension MainView : UICollectionViewDelegate , UICollectionViewDataSource  {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return foodsList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodsCell", for: indexPath) as! CollectionViewCell
    let food = foodsList[indexPath.row]
     
    let baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
    
    cell.imageView.image = UIImage(systemName: "photo")
          if let url = URL(string: "\(baseUrl)\(food.yemek_resim_adi!)"){
                    DispatchQueue.main.async {
                        cell.imageView.kf.setImage(with: url)
                    }
                }
    
    cell.labelName.text = food.yemek_adi!
    cell.labelPrice.text = "\(food.yemek_fiyat!)₺ "
    
    cell.layer.borderColor = UIColor.lightGray.cgColor
    cell.layer.borderWidth = 0.3
    cell.layer.cornerRadius = 10

    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    let food = foodsList[indexPath.row]
    performSegue(withIdentifier: "toDetail", sender: food)
    
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "toDetail" {
      if let food = sender as? Foods {
        let destinationVC = segue.destination as! DetailView
        destinationVC.foods = food
      }
    }
  }
}
