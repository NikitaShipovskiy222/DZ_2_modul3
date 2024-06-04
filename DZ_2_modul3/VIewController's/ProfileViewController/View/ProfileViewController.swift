//
//  ProfileViewController.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 30/05/2024.
//

import UIKit

//MARK: - ProfileViewController
class ProfileViewController: UIViewController {
    
    private var item = ItemProfile.makeData()
    
    private lazy var backgroundView: UIView = {
        .config(view: $0) { [weak self] view in
            view.backgroundColor = .darkGray
            view.layer.cornerRadius = 25
            view.clipsToBounds = true
        }
    }(UIView())
    
    private lazy var profileIcon: UIImageView = {
        .config(view: $0) { [weak self] image in
            image.backgroundColor = UIColor(named: "mainColor")
            image.clipsToBounds = true
            image.heightAnchor.constraint(equalToConstant: 100).isActive = true
            image.widthAnchor.constraint(equalToConstant: 100).isActive = true
            image.layer.cornerRadius = 50
            image.contentMode = .scaleAspectFit
        }
    }(UIImageView())
    
    private lazy var loginButton: UIButton = {
        .config(view: $0) { [weak self] btn in
            btn.setTitle("Войти", for: .normal)
            btn.setTitleColor(.black, for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
            btn.backgroundColor = UIColor(named: "mainColor")
            btn.layer.cornerRadius = 20
            btn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }(UIButton())
    
    private lazy var profileTabelView: UITableView = {
        $0.dataSource = self
        
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.backgroundColor = .black
        $0.separatorColor = UIColor(named: "mainColor")

        $0.isScrollEnabled = false
        return $0
    }(UITableView(frame: CGRect(x: 25, y: backgroundView.frame.height + 370, width: view.frame.width - 50, height: 180), style: .insetGrouped))
    
    
    //MARK: ViewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [backgroundView, profileIcon, loginButton, profileTabelView].forEach{
            view.addSubview($0)
        }

        view.backgroundColor = .black
        makeConstraint()
    }

    private func makeConstraint() {
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -529),
            
            profileIcon.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 145),
            profileIcon.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -145),
            profileIcon.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 110),
            
            loginButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 68),
            loginButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -68),
            loginButton.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 22),

            
        
        ])
    }
    
}

    //MARK: UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        cell.backgroundColor = UIColor(named: "mainColor")
        
        let items = item[indexPath.row]
        config.text = items.name
        config.textProperties.color = .black
        config.textProperties.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        cell.contentConfiguration = config
        return cell
        
    }
}


