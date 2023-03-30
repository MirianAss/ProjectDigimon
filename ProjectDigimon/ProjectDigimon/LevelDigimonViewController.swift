//
//  LevelDigimonViewController.swift
//  ProjectDigimon
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit

class LevelDigimonViewController: UIViewController {
    
    var levelDigimon: DigimonElement?
    
    @IBOutlet weak var lblNameDigimon: UILabel!
    @IBOutlet weak var lblLevelDigimon: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupName()
        setupLevelDigimon()
    }
    
    func setupName() {
        lblNameDigimon.text = levelDigimon?.name ?? ""
    }
    
    func setupLevelDigimon() {
        lblLevelDigimon.text = levelDigimon?.level?.rawValue
    }
    
    @IBAction func btBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
