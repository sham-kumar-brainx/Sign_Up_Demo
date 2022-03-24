import Foundation

class SideMenuModel {
    
    // MARK: - Internal Properties
    var sideMenuData = [SideMenu]()
    
    // MARK: - Initializer Methods
    init() {
        loadSideMenu()
    }
    
    // MARK: - Private Methods
    private func loadSideMenu() {
        sideMenuData.append(SideMenu(tabName: LocalizedKey.myOrders.string, imageName: LocalizedKey.forward.string))
        sideMenuData.append(SideMenu(tabName: LocalizedKey.payment.string, imageName: LocalizedKey.forward.string))
        sideMenuData.append(SideMenu(tabName: LocalizedKey.addresses.string, imageName: LocalizedKey.forward.string))
        sideMenuData.append(SideMenu(tabName: LocalizedKey.shops.string, imageName: LocalizedKey.forward.string))
        sideMenuData.append(SideMenu(tabName: LocalizedKey.settings.string, imageName: LocalizedKey.forward.string))
    }
}
