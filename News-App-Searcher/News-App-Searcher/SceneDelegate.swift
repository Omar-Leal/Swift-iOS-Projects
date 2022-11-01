//
//  SceneDelegate.swift
//  News-App-Searcher//
//  Created by Omar Leal on 10/29/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
//        UINavigationBar.appearance().barTintColor = UIColor(displayP3Red: 47/225, green: 54/225, blue: 64/225, alpha: 1.0)
//            UINavigationBar.appearance().backgroundColor = UIColor(displayP3Red: 47/225, green: 54/225, blue: 64/225, alpha: 1.0)
//            UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//            UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    
        guard let windowSceneApp = ( scene as? UIWindowScene ) else { return }
        window = UIWindow(frame: windowSceneApp.coordinateSpace.bounds)
        window?.windowScene = windowSceneApp
        window?.backgroundColor = .systemPink
        window?.rootViewController = UINavigationController(rootViewController: HomeVC())
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
       
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }


}

