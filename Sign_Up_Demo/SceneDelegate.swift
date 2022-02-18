import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  // MARK: - Internal Properties
  var window: UIWindow?
  
  // MARK: - Internal Methods
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let _ = (scene as? UIWindowScene) else { return }
//    setRootViewController()
  }
  
  func sceneDidDisconnect(_ scene: UIScene) { }
  
  func sceneDidBecomeActive(_ scene: UIScene) { }
  
  func sceneWillResignActive(_ scene: UIScene) { }
  
  func sceneWillEnterForeground(_ scene: UIScene) { }
  
  func sceneDidEnterBackground(_ scene: UIScene) { }
  
  // MARK: - Private Methods
  private func setRootViewController() {
    var vc: BaseViewController
    vc = UIViewController.instantiate(SignUpViewController.self, fromStoryboard: .main)
//    vc =  MainViewController.instantiate(from: .main)
    let navRootController = UINavigationController(rootViewController: vc)
    navRootController.setNavigationBarHidden(true, animated: false)
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navRootController
    window?.makeKeyAndVisible()
  }
}

