//
//  DetailInteractor.swift
//  graduationProject
//
//  Created by Burak Kara on 15.02.2023.
//

import Foundation
import Alamofire
import Firebase

class DetailInteractor : PresenterToInteractorDetailProtocol {
  
  let kullanici = Auth.auth().currentUser!.email!
  let delete = CartInteractor()
  

func addFood(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
    
    let params : Parameters = ["yemek_adi":yemekAdi,"yemek_resim_adi":yemekResimAdi,"yemek_fiyat":yemekFiyat,"yemek_siparis_adet":yemekSiparisAdet,"kullanici_adi":kullaniciAdi]
    
    AF.request(
      "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).responseJSON { (response) in
        
        if let data = response.data{
          do{
   
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
              print(data)
            }
          }catch{
            print(error.localizedDescription)
          }
        }
      }
  }}

  /*
   func addFood(yemekAdi: String, yemekResimAdi: String, yemekFiyat: Int, yemekSiparisAdet: Int, kullaniciAdi: String) {
   
   let params: Parameters = ["yemek_adi":yemekAdi,"kullanici_adi":kullaniciAdi]
   
   AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters:params
   ).responseJSON { response in
   
   var found = true
   
   if let data = response.data {
   do {
   let cevap = try JSONDecoder().decode(CartReply.self, from: data)
   var list = [Cart]()
   if let getFoodList = cevap.sepet_yemekler {
   list = getFoodList
   }
   found = false
   for i in 0..<list.count {
   if list[i].yemek_adi == yemekAdi {
   found = true
   if let adetInt = Int(list[i].yemek_siparis_adet!) {
   let adet = adetInt + yemekSiparisAdet
   let params2: Parameters = ["yemek_adi": yemekAdi,"yemek_resim_adi": yemekResimAdi,"yemek_fiyat": yemekFiyat,"yemek_siparis_adet": adet,"kullanici_adi": kullaniciAdi]
   
   
   self.delete.delete(sepet_yemek_id: list[i].sepet_yemek_id!, kullanici_adi:kullaniciAdi )
   
   
   AF.request(
   "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params2).responseJSON
   { response in
   if let data = response.data {
   do {
   print("Toplam adet \(adet)")
   print("eski adet \(adetInt)")
   if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
      }
   } catch {
   print(error.localizedDescription)
   
              }
            }
          }
        }
      }
   }
   
   if !found {
   let params: Parameters = ["yemek_adi": yemekAdi,"yemek_resim_adi": yemekResimAdi,"yemek_fiyat": yemekFiyat,"yemek_siparis_adet": yemekSiparisAdet,"kullanici_adi": kullaniciAdi]
   AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).responseJSON { response in
   if let data = response.data {
   do {
   if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
   print(json)
   }
   } catch {
   print(error.localizedDescription)
            }
        }
      }
   }
   
   } catch {
   print(error.localizedDescription)
          }
        }
      }
    }
  }
   */
