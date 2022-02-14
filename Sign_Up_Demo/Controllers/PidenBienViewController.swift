import UIKit

class PidenBienViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var verticalCollectionView: UICollectionView!
    @IBOutlet weak var horizentalCollectionView: UICollectionView!
    
    // MARK: - Private Properties
    private let verticalItemsImages = [AppConstants.food, AppConstants.superMarket, AppConstants.alcoholDelivery, AppConstants.pets, AppConstants.pharmacy, AppConstants.flowersAndGifts, AppConstants.personalCare, AppConstants.mall]
    private let verticalReuseIdentifier = "VerticalCollectionViewCell"
    private let horizentalReuseIdentifier = "HorizentalCollectionViewCell"
    private let inset = 16.0
    private let itemSpacing: CGFloat = 15
    private let itemsInOneLine: CGFloat = 2
    private let horizentalItemListData = HorizentalScrollItemListViewModel().horizentalItemList
    
    // MARK: - Life Cycle Methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setDelegateAndDatasource()
    }
    
    // MARK: - Private Methods
    private func setDelegateAndDatasource() {
        horizentalCollectionView.delegate = self
        horizentalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource protocol Confirmation Extension
extension PidenBienViewController: UICollectionViewDataSource {
    
    // MARK: - Internal Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizentalCollectionView {
            return horizentalItemListData.count
        }
        return verticalItemsImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizentalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: horizentalReuseIdentifier, for: indexPath as IndexPath) as! HorizentalCollectionViewCell
            cell.setInnerViewWith(colorHex: horizentalItemListData[indexPath.row].innerViewColorHex)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: verticalReuseIdentifier, for: indexPath as IndexPath) as! VerticalCollectionViewCell
            cell.setItemWith(image: verticalItemsImages[indexPath.row])
            cell.setItemWith(title: verticalItemsImages[indexPath.row])
            return cell
        }
    }
}

extension PidenBienViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - Internal Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
