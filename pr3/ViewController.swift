//
//  ViewController.swift
//  pr3
//
//  Created by Aniket Patil on 16/02/23.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var tbl:UITableView!

    var modelView:[Product] = []
    let url = "https://dummyjson.com/products/"
    override func viewDidLoad() {
        super.viewDidLoad()

        tbl.delegate = self
        tbl.dataSource = self
        getApi()
    }
    private func getApi(){
        AF.request(url,method: .get,headers: nil).responseJSON{
            response in
            print("Response",response)
            switch response.result{
            case .success(_):
                do{
                    if let data = response.data{
                        let jsonData = try JSONDecoder().decode(appModel.self, from: data)
                        self.modelView = jsonData.products ?? []
                        DispatchQueue.main.async {
                            self.tbl.reloadData()
                        }
                    }
                }catch{
                    
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        
    }


}
extension ViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblTVC") as! tblTVC
        cell.titleLbl.text = modelView[indexPath.row].title
        cell.priceLbl.text = String(modelView[indexPath.row].price ?? 0)
        cell.brandLbl.text = modelView[indexPath.row].brand
        cell.categoriLbl.text = modelView[indexPath.row].category
        cell.discountLbl.text = String(modelView[indexPath.row].discountPercentage ?? 0.0)
        cell.ratingLbl.text = String(modelView[indexPath.row].rating ?? 0.0)
        cell.img.sd_setImage(with: URL(string: modelView[indexPath.row].thumbnail ?? ""), completed: nil)
        cell.img.contentMode = .scaleToFill
        return cell
    }
    
    
}
