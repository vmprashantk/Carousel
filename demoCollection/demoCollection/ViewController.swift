//
//  ViewController.swift
//  demoCollection
//
//  Created by Prashant on 31/12/19.
//  Copyright © 2019 Prashant. All rights reserved.
//

import UIKit
import ScalingCarousel

class Cell: ScalingCarouselCell {}

class ViewController: UIViewController {
    
     @IBOutlet weak var carousel: ScalingCarouselView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        carousel.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "cell")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
           super.viewWillTransition(to: size, with: coordinator)
           carousel.deviceRotated()
       }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if let scalingCell = cell as? ScalingCarouselCell {
            //scalingCell.mainView.backgroundColor = .red
        }

        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //carousel.didScroll()
        
        guard let currentCenterIndex = carousel.currentCenterCellIndex?.row else { return }
        
       // output.text = String(describing: currentCenterIndex)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
}

