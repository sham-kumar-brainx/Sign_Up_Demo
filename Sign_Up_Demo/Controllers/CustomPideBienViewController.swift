import UIKit

class CustomPideBienViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Private Properties
    private let horizentalItemListData = PideBienViewModel().horizentalItemList
    private let verticalItemListData = PideBienViewModel().verticalItemList
    private lazy var compositionalLayout: UICollectionViewCompositionalLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self]
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            switch Section(rawValue: sectionIndex) {
            case .horizontalScroll:
                return self?.setupHorizontalScrollSection()
            case .verticalScroll:
                return self?.setupVerticalScrollSection()
            case .none:
                fatalError("Should not be none")
            }
        }
        return layout
    }()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCollectionView()
    }
    
    // MARK: - Private Methods
    private func setUpCollectionView() {
        collectionView.register(HorizontalCollectionCell.nib(), forCellWithReuseIdentifier: HorizontalCollectionCell.reuseIdentifier)
        collectionView.register(VerticalCollectionCell.nib(), forCellWithReuseIdentifier: VerticalCollectionCell.reuseIdentifier)
        collectionView.register(HeaderCollectionReusableView.nibForHeaterAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifierForHeaterAndFooter)
        collectionView.register(FooterCollectionReuseableView.nibForHeaterAndFooter(), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReuseableView.reuseIdentifierForHeaterAndFooter)
        collectionView.collectionViewLayout = compositionalLayout
        collectionView.dataSource = self
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
    }
    
    // MARK: - Internal Methods
    func setupHorizontalScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.90), heightDimension: .absolute(204)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets(top: 125.0, leading: 16.0, bottom: -15.0, trailing: 16.0)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func setupVerticalScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(165)), subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 1.0)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        let headerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(40)),
            elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        let footerView = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(100)),
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom)
        section.boundarySupplementaryItems = [headerView, footerView]
        return section
    }
}

extension CustomPideBienViewController: UICollectionViewDataSource {
    
    // MARK: - Internal Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .horizontalScroll:
            return horizentalItemListData.count
        case .verticalScroll:
            return verticalItemListData.count
        case .none:
            fatalError("Should not be none")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch Section(rawValue: indexPath.section) {
        case .horizontalScroll:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionCell.reuseIdentifier, for: indexPath as IndexPath) as! HorizontalCollectionCell
            cell.setCellData(with: horizentalItemListData[indexPath.row])
            return cell
        case .verticalScroll:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionCell.reuseIdentifier, for: indexPath) as! VerticalCollectionCell
            cell.setCellData(with: verticalItemListData[indexPath.row])
            return cell
        case .none:
            fatalError("Should not be none")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifierForHeaterAndFooter, for: indexPath) as! HeaderCollectionReusableView
            return headerView
        } else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterCollectionReuseableView.reuseIdentifierForHeaterAndFooter, for: indexPath) as! FooterCollectionReuseableView
            return footerView
        }
    }
}
