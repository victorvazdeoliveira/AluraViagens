//
//  ViewController.swift
//  AluraViagens
//
//  Created by Victor Vaz de Oliveira on 04/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagensTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        viagensTableView.contentInsetAdjustmentBehavior = .never
        viagensTableView.contentInset = UIEdgeInsets(top: -32, left: 0, bottom: 0, right: 0);
        
        view.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
        
        
    }
    

}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        var config = UIListContentConfiguration.cell()
        config.text = "Viagem \(indexPath.row)"
        config.textProperties.font = UIFont.systemFont(ofSize: 14)
        cell.contentConfiguration = config
//        cell.textLabel?.text = "Viagem \(indexPath.row)"
        
        return cell
    }
    
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    
}

