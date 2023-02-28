//
//  CartView.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import UIKit
import Kingfisher
import Firebase

class CartView: UIViewController {

  @IBOutlet weak var foodsTableView: UITableView!
  @IBOutlet weak var totalPriceLabel: UILabel!
  
  var cartPresenterObject : ViewToPresenterCartProtocol?
  var foodsList = [Cart]()
  var a = ""
  let currentUser = Auth.auth().currentUser!.email!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    foodsTableView.delegate = self
    foodsTableView.dataSource = self
    CartRouter.createModule(ref: self)
    totalPrice()
  }
  
  @IBAction func deleteButton(_ sender: Any) {
   
    let alert = UIAlertController(title: "Sepeti Boşalt", message: "Tüm Sepet Boşaltılsın mı ? ", preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Evet", style: .default, handler: { (action) in
      for food in self.foodsList {
        self.cartPresenterObject?.delete(sepet_yemek_id:food.sepet_yemek_id!, kullanici_adi:food.kullanici_adi!)
        alert.dismiss(animated: true, completion: nil)
      }
    }))
    alert.addAction(UIAlertAction(title: "İptal", style: .cancel))
     self.present(alert,animated: true)
  
    
  }
  @IBAction func confirmCartButton(_ sender: Any) {
    if totalPriceLabel.text != "0 ₺" {
      Common.showAlert(title: "Siparişiniz Oluşturuldu", message: "En kısa sürede teslim edeceğiz", vc: self) }
    else {
      Common.showAlert(title: "Sepet Boş", message: "Lütfen sepete ürün ekleyin", vc: self)
    }
  }
  override func viewWillAppear(_ animated: Bool) {

    cartPresenterObject?.getFoods(kullanici_adi:"\(currentUser)")
    totalPrice() }
  
  func totalPrice() {
    
            var totalCost = 0
            for food in foodsList{
              let totalPrice = Int(food.yemek_fiyat!)! * Int(food.yemek_siparis_adet!)!
              var a = food.sepet_yemek_id
                totalCost += totalPrice
            }
           self.totalPriceLabel.text = "\(String(totalCost)) ₺"
  }
}

extension CartView : PresenterToViewCartProtocol {
  
  func dataSendToView(foodsList: Array<Cart>) {
    
    self.foodsList = foodsList
    DispatchQueue.main.async {
      self.foodsTableView.reloadData()
      self.totalPrice()
    }
  }
}

extension CartView : UITableViewDelegate , UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return foodsList.count 
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let food = foodsList[indexPath.row]
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! TableViewCell

    let baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
    
    cell.foodImageView.image = UIImage(systemName: "photo")
    if let url = URL(string: "\(baseUrl)\(food.yemek_resim_adi!)"){
                    DispatchQueue.main.async {
                      cell.foodImageView.kf.setImage(with: url)
                      
                    }
                }
    cell.nameLabel.text = food.yemek_adi!
    cell.pieceLabel.text = food.yemek_siparis_adet!
    cell.priceLabel.text = ("\(food.yemek_fiyat!) ₺ ")
    
    return cell

    self.foodsTableView.reloadData()
  }
  
  //Commonda Cancel işlemi olmadığı için özel alert yapıldı.
  
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
      let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
          let food = self.foodsList[indexPath.row]
        
          
        let alert = UIAlertController(title: "Silme İşlemi", message: "\(food.yemek_adi!) sepetten silinsin mi ?", preferredStyle: .alert)
        
          let cancel = UIAlertAction(title: "İptal", style: .cancel)
          alert.addAction(cancel)
          
          let yesAction = UIAlertAction(title: "Evet", style: .default){ action in
            self.cartPresenterObject?.delete(sepet_yemek_id: food.sepet_yemek_id!, kullanici_adi: food.kullanici_adi!)
          }
          alert.addAction(yesAction)
          
          self.present(alert, animated: true)
       
      }
      
      return UISwipeActionsConfiguration(actions: [deleteAction])
  }
  
  
}

  
  
