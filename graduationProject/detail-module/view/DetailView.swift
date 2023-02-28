//
//  DetailView.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import UIKit
import Alamofire
import Kingfisher
import Firebase

class DetailView: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var labelName: UILabel!
  @IBOutlet weak var labelPrice: UILabel!
  @IBOutlet weak var stepperLabel: UILabel!
  @IBOutlet weak var totalPriceLabel: UILabel!
  @IBOutlet weak var foodDetailLabel: UILabel!
  @IBOutlet weak var foodTime: UILabel!
  
  var foods:Foods?
  var stepperValue = 0
  var detailPresentObject : ViewToPresenterDetailProtocol?
  

  let currentUser = Auth.auth().currentUser!.email!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
   
    DetailRouter.createModule(ref: self)
    
    if let food = foods {
      
      labelName.text = food.yemek_adi
      labelPrice.text = "\(food.yemek_fiyat!)₺"
      
      let baseUrl = "http://kasimadalan.pe.hu/yemekler/resimler/"
      imageView.image = UIImage(systemName: "photo")
            if let url = URL(string: "\(baseUrl)\(food.yemek_resim_adi!)"){
                      DispatchQueue.main.async {
                        self.imageView.kf.setImage(with: url)
                      }
                  }
            }
    }
    
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    
    
    stepperLabel.text = "\(Int(sender.value))"
    
    if let food = foods {
      let totalPrice = Int(food.yemek_fiyat!)! * Int(stepperLabel.text!)!
      totalPriceLabel.text = "\(totalPrice) ₺"
      stepperValue = Int(sender.value)
    }
  }

  @IBAction func buttonAdd(_ sender: Any) {
    
    if let food = foods {
      
      if stepperValue != 0 {
        
        detailPresentObject?.addFood(yemekAdi: food.yemek_adi!, yemekResimAdi: food.yemek_resim_adi!, yemekFiyat: Int(food.yemek_fiyat!)!, yemekSiparisAdet: stepperValue, kullaniciAdi: "\(currentUser)")
        Common.showAlert(title: "Başarılı", message: "Ürün Sepete Eklendi", vc: self)
        
      } else {

       let alert = UIAlertController(title: "Uyarı", message: "Lütfen Ürün Adeti Seçin", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default))
        self.present(alert,animated: true)
      }

    }
    
  }
  override func viewWillAppear(_ animated: Bool) {
    
    let foodDetail = labelName.text

    switch foodDetail {
    case "Ayran":
      foodDetailLabel.text = "Milli içeceğimiz Ayran! Sıcaklarda yemeklerimize misafir olur ve serinlemek için lıkır lıkır içilir.Hemen sipariş ver ve bu lezzeti kaçırma."
      foodTime.text = "25 dk"
    case "Baklava":
      foodDetailLabel.text = "Baklava, Türk mutfağına ait olan en özel lezzetlerden biri olarak ön plana çıkıyor. Hemen sipariş ver ve bu lezzeti kaçırma."
      foodTime.text = "20 dk"
    case "Fanta":
      foodDetailLabel.text = "Bu sıcaklarda yemeklerimize misafir olması dışında serinlemek için bile lıkır lıkır içilir. Hemen sipariş ver ve bu lezzeti kaçırma."
      foodTime.text = "15 dk"
    case "Izgara Somon":
      foodDetailLabel.text = "Lezzetli kırmızımsı bir ete rengine sahip Omega 3 bakımından oldukça zengindir.Hemen sipariş ver ve bu lezzeti kaçırma."
      foodTime.text = "45 dk"
    case "Izgara Tavuk":
      foodDetailLabel.text = "Besin değerleri ile oldukça hafif olan tavuk ızgara , tavuk sevmeyenleri bile hoşnut bırakacak! Hemen sipariş ver ve bu lezzeti kaçırma."
      foodTime.text = "45 dk"
    case "Kadayıf":
      foodDetailLabel.text = "Türk mutfağının vazgeçilmezleri arasında olan tel kadayıf, sofralarda başköşede yerini alır. Hemen sipariş ver ve bu lezzeti kaçırma."
      foodTime.text = "60 dk"
    case "Kahve":
      foodDetailLabel.text = "Bir fincan kahvenin kırk yıl hatırı var derler.Haydi sen de hemen siparişi ver ve bu lezzeti kaçırma."
      foodTime.text = "10 dk"
    case "Köfte":
      foodDetailLabel.text = "Büyük küçük herkesin severek tükettiği bir yemek olan köfteyi Haydi sen de hemen siparişini ver ve bu lezzeti kaçırma."
      foodTime.text = "25 dk"
    case "Lazanya" :
      foodDetailLabel.text = "Makarna hamuruyla yapılan bolonez sosu ile birlikte pişirilen  nefis bir lezzet.Hemen siparişini ver ve bu lezzeti kaçırma."
      foodTime.text = "35 dk"
    case "Makarna":
      foodDetailLabel.text = "7’den 70’e herkesin severek afiyetle yediği makarnanımızdan haydi sen de hemen siparişi ver ve bu lezzeti kaçırma."
      foodTime.text = "25 dk"
    case "Pizza":
      foodDetailLabel.text = "İtalyan mutfağından dünyaya yayılan ve en sevilen yemeklerden biri olan pizzayı haydi sen de hemen siparişini ver ve bu lezzeti kaçırma. "
      foodTime.text = "30 dk"
    case "Su":
      foodDetailLabel.text = "Her damlasında yaşam olan Suyumuzdan haydi sen de hemen siparişini ver ve bu lezzeti kaçırma."
      foodTime.text = "5 dk"
    case "Sütlaç":
      foodDetailLabel.text = "Sütlaç, lezzetiyle, hafifliğiyle Türk mutfağının vazgeçilmez tatlıları arasında.Haydi sen de hemen siparişini ver ve bu lezzeti kaçırma."
      foodTime.text = "40 dk"
    default:
      foodDetailLabel.text = ""
    }
  }
}
