//
//  ListDigimonViewController.swift
//  ProjectDigimon
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit

class ListDigimonViewController: UIViewController {
    
    var arrayDigimon: Digimon?
    let request = Request()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        myRequest()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DigimonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func myRequest() {
        request.delegate = self
        request.requestDigimon { arrayDeDigimon in
            
        }
    }
}

extension ListDigimonViewController: RequestDelegate {
    func finishProtocol(arrayDeDigimon: Digimon?) {
        self.arrayDigimon = arrayDeDigimon
        self.tableView.reloadData()
    }
}

extension ListDigimonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDigimon?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DigimonTableViewCell {
            
            cell.setupDigimon(digimon: self.arrayDigimon?[indexPath.row])
            
            return cell
        }
        return UITableViewCell()
    }
}

extension ListDigimonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screen = self.storyboard?.instantiateViewController(withIdentifier: "levelDigimon") as? LevelDigimonViewController {
            screen.levelDigimon = self.arrayDigimon?[indexPath.row]
            self.navigationController?.pushViewController(screen, animated: true)
        }
    }
}
