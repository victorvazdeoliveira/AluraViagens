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
        
        view.backgroundColor = UIColor(red: 30/255, green: 59/255, blue: 119/255, alpha: 1)
        
        configuraTableView()
        
        
    }
    
    func configuraTableView() {
        viagensTableView.register(UINib(nibName: "ViagemTableViewCell", bundle: nil), forCellReuseIdentifier: "ViagemTableViewCell")
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        viagensTableView.contentInsetAdjustmentBehavior = .never
        viagensTableView.sectionHeaderTopPadding = 0
        viagensTableView.contentInset = UIEdgeInsets(top: -1, left: 0, bottom: 0, right: 0);
    }

    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let celulaViagem = tableView.dequeueReusableCell(withIdentifier: "ViagemTableViewCell", for: indexPath) as? ViagemTableViewCell else {
            fatalError("Erro to create ViagemTableViewCell")
        }
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo {
        case .destaques:
            celulaViagem.configuraCelula(viewModel?.viagens[indexPath.row])
            return celulaViagem
        default:
            return UITableViewCell()
        }
        
//        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
//        var config = UIListContentConfiguration.cell()
//        config.text = "Viagem \(indexPath.row)"
//        config.textProperties.font = UIFont.systemFont(ofSize: 14)
//        cell.contentConfiguration = config
//        cell.textLabel?.text = "Viagem \(indexPath.row)"
        
//        return celulaViagem
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
}

