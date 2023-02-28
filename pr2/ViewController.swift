//
//  ViewController.swift
//  pr2
//
//  Created by Aniket Patil on 16/02/23.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    
    var modelView:[ModelVC] = []
    var url = "https://fakestoreapi.com/products"

    override func viewDidLoad() {
        super.viewDidLoad()

        tbl.delegate = self
        tbl.dataSource = self
        getApi()

    }
    private func getApi(){
        AF.request(url,method: .get,headers: nil).responseJSON{
            response in
            print("response",response)
            switch response.result{
            case .success(_):
                do{
                    if let data = response.data{
                        let jsonData = try JSONDecoder().decode([ModelVC].self, from: data)
                        self.modelView = jsonData
                        DispatchQueue.main.async {
                            self.tbl.reloadData()
                        }
                    }
                    
                }catch{
                    print("Error")
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        
    }
}
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblTVC", for: indexPath) as! tblTVC
        cell.titleLbl.text = modelView[indexPath.row].title ?? ""
        cell.descriptionLbl.text = modelView[indexPath.row].description ?? ""
        cell.categoriLbl.text = modelView[indexPath.row].category ?? ""
        cell.priceLbl.text = String(modelView[indexPath.row].price ?? 0.0)
        cell.img.sd_setImage(with: URL(string: modelView[indexPath.row].image ?? ""), completed: nil)
        return cell
    }
    
    
}
