//
//  UpcomingViewController.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 03/06/2024.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    private var titles: [Movie] = [Movie]()
    
    private lazy var upcomingTabel: UITableView = {
        $0.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.reuseId)
        $0.dataSource = self
        $0.delegate = self
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Cкоро"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        view.addSubview(upcomingTabel)
        fetchUpcoming()
        
    }
    
    private func fetchUpcoming() {
        APICaller.shared.sendRequest { [weak self] result in
            switch result {
            case.success(let titles):
                self?.titles = titles
                DispatchQueue.main.async {
                    self?.upcomingTabel.reloadData()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension UpcomingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = upcomingTabel.dequeueReusableCell(withIdentifier: TitleTableViewCell.reuseId, for: indexPath) as? TitleTableViewCell else {return UITableViewCell()}
        
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: title.nameRu ?? title.nameOriginal ?? "Title name", posterURL: title.posterURL ))
        return cell
    }
}

extension UpcomingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
