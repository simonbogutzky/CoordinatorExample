//
//  Coordinator.swift
//  CoordinatorExample
//
//  Created by Simon Bogutzky on 13.01.22.
//

import UIKit

protocol Coordinator: AnyObject {
    
    var parent: Coordinator? { get set }
    var children: [Coordinator] { get set }
    
    var viewController: UIViewController? { get set }
    var navigationController : UINavigationController? { get set }
    
    
    func start()
    func addChild(_ child: Coordinator)
    func removeChild(_ child: Coordinator)
    func removeCoordinatorOf(fromViewController: UIViewController) -> Bool
}


extension Coordinator {
    
    func addChild(_ child: Coordinator) {
        children.append(child)
        child.parent = self
    }
    
    func removeChild(_ child: Coordinator) {
        if let index = children.firstIndex(where: { $0 === child }) {
            child.parent = nil
            children.remove(at: index)
        }
    }
    
    func removeCoordinatorOf(fromViewController: UIViewController) -> Bool {
        print("Parent: \(self)")
        
        for child in self.children {
            
            if child.viewController === fromViewController {
                print("Remove child: \(child)")
                self.removeChild(child)
                return true
            }
            
            if child.children.count > 0 {
                print("Ask child: \(child)")
                if child.removeCoordinatorOf(fromViewController: fromViewController) {
                    return true
                }
            }
        }
        print("Coordinator for \(fromViewController) not found")
        return false
    }
    
} 
