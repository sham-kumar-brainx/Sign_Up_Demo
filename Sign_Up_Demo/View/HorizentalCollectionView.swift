import Foundation
import UIKit

class HorizontalCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Private Properties
    private let verticalItemsImages = [AppConstants.food, AppConstants.superMarket, AppConstants.alcoholDelivery, AppConstants.pets, AppConstants.pharmacy, AppConstants.flowersAndGifts, AppConstants.personalCare, AppConstants.mall]
    private let horizentalReuseIdentifier = "HorizentalCollectionViewCell" // also enter this string as the cell identifier in the storyboard
    
    private var data:[Any]?
    
    //    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    //        super.init(frame: frame, collectionViewLayout: layout)
    //    }
    //
    //    convenience init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout, data:[Any]) {
    //        self.init(frame: frame, collectionViewLayout: layout)
    //
    //        // Set These
    //        self.delegate = self
    //        self.dataSource = self
    //        self.data = data
    //        // Setup Subviews.
    //        setup()
    //    }
    //
    //    required init?(coder aDecoder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return verticalItemsImages.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: horizentalReuseIdentifier, for: indexPath as IndexPath) as! HorizentalCollectionViewCell
        cell.setItemWith(image: verticalItemsImages[indexPath.row])
        //        cell.setItemWith(title: verticalItemsImages[indexPath.row])
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell \(indexPath.row)!")
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.blue
    }
    
    func setup(){
        self.register(HorizentalCollectionViewCell.self, forCellWithReuseIdentifier: horizentalReuseIdentifier)
    }
    
}
