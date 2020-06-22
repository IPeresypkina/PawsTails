//
//  ListPetsViewController.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/8/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import UIKit

class ListPetsViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(UINib(nibName: "PetCell", bundle: nil), forCellWithReuseIdentifier: "PetCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

}

extension ListPetsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}
