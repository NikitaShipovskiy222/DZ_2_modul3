//
//  TitleTableViewCell.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 03/06/2024.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    static let reuseId: String = "TitleTableViewCell"
    
    
    private lazy var playButton: UIButton = {
        .config(view: $0) { play in
            let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
            play.setImage(image, for: .normal)
            play.tintColor = UIColor(named: "mainColor")
            
        }
    }(UIButton())
    
    private lazy var titleLabel: UILabel = {
        .config(view: $0) { label in
            
        }
    }(UILabel())
    
    private lazy var titlePostImageView: UIImageView = {
        .config(view: $0) { image in
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true 
        }
    }(UIImageView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        [titlePostImageView, titleLabel, playButton].forEach{
            contentView.addSubview($0)
        }
        
        makeConstraint()
    }
    
    
    
    private func makeConstraint() {
        
        NSLayoutConstraint.activate([
            titlePostImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlePostImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15 ),
            titlePostImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            titlePostImageView.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: titlePostImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        
        ])
    }
    
    public func configure(with model: TitleViewModel) {
        
        guard let url = URL(string: "https://kinopoiskapiunofficial.tech/images/posters/kp\(model.posterURL)") else {return}
        titlePostImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
