//
//  ViewController.swift
//  pr4
//
//  Created by Aniket Patil on 17/02/23.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    
    var viewModel:[Datas] = []
    let url = "https://reqres.in/api/users?page=2"

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
                        let jsonData = try JSONDecoder().decode(Model.self, from: data)
                        self.viewModel = jsonData.data ?? []
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
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblTVC", for: indexPath) as! tblTVC
        cell.nameLbl.text = viewModel[indexPath.row].firstName
        cell.surnameLbl.text = viewModel[indexPath.row].lastName
        cell.emailLbl.text = viewModel[indexPath.row].email
        cell.img.sd_setImage(with: URL(string: viewModel[indexPath.row].avatar ?? ""), completed: nil)
        return cell
    }
    
    
}
