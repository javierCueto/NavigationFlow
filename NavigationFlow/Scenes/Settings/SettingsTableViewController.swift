//
//  SettingsTableViewController.swift
//  NavigationFlow
//
//  Created by Javier Cueto on 18/12/23.
//

import UIKit

protocol SettingsTableViewControllerDelegate: AnyObject {
    func didSelectLogout()
}

final class SettingsTableViewController: UITableViewController {
    
    let viewData = [SettingsItem(title: "Login", isSelected: false, navigateTo: .login), SettingsItem(title: "Profile", isSelected: true, navigateTo: .profile)]
    
    weak var delegate: SettingsTableViewControllerDelegate?
    
    init() {
        super.init(style: .insetGrouped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    func configUI() {
        view.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let data = viewData[indexPath.row]
        var configuration = UIListContentConfiguration.cell()
        configuration.text = data.title
        cell.contentConfiguration = configuration
        if !data.isSelected {
            cell.selectionStyle = .none
        }

        cell.backgroundColor = .systemGray5
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewData[indexPath.row]
        
        switch data.navigateTo {
        case .login:
            delegate?.didSelectLogout()
        case .profile:
            print("profile")
        }
    }

}
