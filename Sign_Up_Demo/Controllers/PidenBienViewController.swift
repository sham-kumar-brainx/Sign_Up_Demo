import UIKit

class PidenBienViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var verticalCollectionView: UICollectionView!
    @IBOutlet weak var horizentalCollectionView: UICollectionView!
    @IBOutlet var pideBienMainScreenView: PidenBienMainScreenView!
    
    // MARK: - Private Properties
    private let horizentalItemListData = PideBienViewModel().horizentalItemList
    private let verticalItemListData = PideBienViewModel().verticalItemList
    private let itemsInOneLine: CGFloat = 2
    private let itemSpacing: CGFloat = 15
    private let inset = 16.0

    // MARK: - Life Cycle Methods
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setDelegateAndDatasource()
        pideBienMainScreenView.cartButtonView.addTapAction(#selector(playButtonTapped(_:)), target: self)
    }
    
    // MARK: - Private Methods
    private func setDelegateAndDatasource() {
        horizentalCollectionView.delegate = self
        horizentalCollectionView.dataSource = self
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
    }
    
    private func openCustomPideBienViewController() {
        let customPideBienViewController = CustomPideBienViewController.instantiate(from: .main)
        customPideBienViewController.modalPresentationStyle = .fullScreen
        customPideBienViewController.modalTransitionStyle = .crossDissolve
        present(customPideBienViewController, animated: true)
    }
    
    // MARK: - Action Methods
    @objc
    func playButtonTapped(_ sender: UITapGestureRecognizer) {
        openCustomPideBienViewController()
    }
}

// MARK: - UICollectionViewDataSource protocol Confirmation Extension
extension PidenBienViewController: UICollectionViewDataSource {
    
    // MARK: - Internal Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizentalCollectionView {
            return horizentalItemListData.count
        }
        return verticalItemListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == horizentalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizentalCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! HorizentalCollectionViewCell
            cell.setInnerViewWith(colorHex: horizentalItemListData[indexPath.row].innerViewColorHex)
            cell.setItemWith(title: horizentalItemListData[indexPath.row].title)
            cell.setItemWith(subTitle: horizentalItemListData[indexPath.row].subTitle)
            cell.setItemWith(image: horizentalItemListData[indexPath.row].itemImage)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionViewCell.reuseIdentifier, for: indexPath as IndexPath) as! VerticalCollectionViewCell
            cell.setItemWith(image: verticalItemListData[indexPath.row].itemImage)
            cell.setItemWith(title: verticalItemListData[indexPath.row].title)
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

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LocalizedKey.verticalHeaderIdentifier.string,
                for: indexPath)
            guard let typedHeaderView = headerView as? CustomCollectionReusableView
            else { return headerView }
            typedHeaderView.setOrderingMessageWith(title: LocalizedKey.orderingMessage.string)
            return typedHeaderView
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: LocalizedKey.horizentalFooterIdentifier.string,
                for: indexPath)
            return footerView
        default:
            assert(false, LocalizedKey.invalidMessage.string)
        }
    }
}
