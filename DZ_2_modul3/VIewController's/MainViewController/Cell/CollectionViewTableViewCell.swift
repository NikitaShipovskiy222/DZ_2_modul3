//
//  CollectionViewTableViewCell.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 02/06/2024.
//

import UIKit


//MARK: - CollectionViewTableViewCell
class CollectionViewTableViewCell: UITableViewCell {
    
    static let resulId = "CollectionViewTableViewCell"
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()

    //MARK:  initilization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LayoutSubviews
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
}
//MARK:  UICollectionViewDelegate
extension CollectionViewTableViewCell: UICollectionViewDelegate {
    
}

//MARK: UICollectionViewDataSource
extension CollectionViewTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .brown
        return cell
    }
    
    
}
