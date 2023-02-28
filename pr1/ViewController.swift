//
//  ViewController.swift
//  pr1
//
//  Created by Aniket Patil on 16/02/23.
//

import UIKit
import Alamofire
import SafariServices
class ViewController: UIViewController {
    @IBOutlet weak var tbl:UITableView!
    
    var viewModel:[Entry] = []
    
    let url = "https://api.publicapis.org/entries"

    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.dataSource = self
        tbl.register(UINib(nibName: "TblTVC", bundle: nil), forCellReuseIdentifier: "TblTVC")
       
        self.getApi()
    }
    private func getApi(){
        AF.request(url,method: .get, headers: nil).responseJSON{
            response in
            switch response.result{
            case .success(_):
                do{
                    if let data = response.data{
                        let jsonData = try JSONDecoder().decode(Model.self, from: data)
                        self.viewModel = jsonData.entries ?? []
                        DispatchQueue.main.async {
                            self.tbl.reloadData()
                        }
                    }
                } catch{
                    print("errrror")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    @objc func linkClicked(_ sender:UITapGestureRecognizer) {
        let link = viewModel[sender.view?.tag ?? 0].link ?? ""
        print("linkkk",link)
        let svc = SFSafariViewController(url: URL(string: link)!)
        self.present(svc, animated: true, completion: nil)
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TblTVC") as! TblTVC
        cell.selectionStyle = .none
        cell.titleLbl.text = viewModel[indexPath.row].api
        cell.descriptionLbl.text = viewModel[indexPath.row].description
        cell.categoryLbl.text = viewModel[indexPath.row].category
        cell.linkLbl.text = viewModel[indexPath.row].link
        cell.linkLbl.textColor = .blue
        cell.linkLbl.tag = indexPath.row
        cell.linkLbl.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(linkClicked(_:))))
        return cell
    }
    
    
}

