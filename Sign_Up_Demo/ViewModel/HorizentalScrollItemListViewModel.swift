import Foundation

class HorizentalScrollItemListViewModel {
    
    // MARK: - Internal Properties
    var horizentalItemList = [HorizentalScrollItemList]()
    
    // MARK: - Initializer Methods
    init() {
        if horizentalItemList.isEmpty {
            loadOnBoardingData()
        }
    }
    
    // MARK: - Private Methods
    private func loadOnBoardingData() {
        horizentalItemList.append(HorizentalScrollItemList(title: LocalizedKey.title.string, subTitle: LocalizedKey.title.string, innerViewColorHex: AppConstants.lightGreenColorHex, itemImage: AppConstants.cupGlass))
        horizentalItemList.append(HorizentalScrollItemList(title: LocalizedKey.title.string, subTitle: LocalizedKey.title.string, innerViewColorHex: AppConstants.boskiTypeColorHex, itemImage: AppConstants.cupGlass))
        horizentalItemList.append(HorizentalScrollItemList(title: LocalizedKey.title.string, subTitle: LocalizedKey.title.string, innerViewColorHex: AppConstants.lightGreenColorHex, itemImage: AppConstants.cupGlass))
    }
}
