import Foundation

class PideBienViewModel {
    
    // MARK: - Internal Properties
    var horizentalItemList = [HorizentalScrollItemList]()
    var verticalItemList = [VerticalScrollItemList]()
    
    // MARK: - Initializer Methods
    init() {
        loadHorizentalScrollItemList()
        loadVerticalScrollItemList()
    }
    
    // MARK: - Private Methods
    private func loadHorizentalScrollItemList() {
        horizentalItemList.append(HorizentalScrollItemList(title: LocalizedKey.title.string, subTitle: LocalizedKey.title.string, innerViewColorHex: AppConstants.lightGreenColorHex, itemImage: LocalizedKey.cupGlass.string))
        horizentalItemList.append(HorizentalScrollItemList(title: LocalizedKey.title.string, subTitle: LocalizedKey.title.string, innerViewColorHex: AppConstants.boskiTypeColorHex, itemImage: LocalizedKey.cupGlass.string))
        horizentalItemList.append(HorizentalScrollItemList(title: LocalizedKey.title.string, subTitle: LocalizedKey.title.string, innerViewColorHex: AppConstants.lightGreenColorHex, itemImage: LocalizedKey.cupGlass.string))
    }
    
    private func loadVerticalScrollItemList() {
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.food.string, itemImage: LocalizedKey.food.string))
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.superMarket.string, itemImage: LocalizedKey.superMarket.string))
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.alcoholDelivery.string, itemImage: LocalizedKey.alcoholDelivery.string))
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.pets.string, itemImage: LocalizedKey.pets.string))
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.pharmacy.string, itemImage: LocalizedKey.pharmacy.string))
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.flowersAndGifts.string, itemImage: LocalizedKey.flowersAndGifts.string))
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.food.string, itemImage: LocalizedKey.food.string))
        verticalItemList.append(VerticalScrollItemList(title: LocalizedKey.mall.string, itemImage: LocalizedKey.mall.string))
    }
}
