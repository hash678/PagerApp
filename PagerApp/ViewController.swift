//
//  ViewController.swift
//  PagerApp
//
//  Created by Hassan Abbasi on 10/05/2020.
//  Copyright © 2020 Hassan Abbasi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let pageView = PageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(pageView)

        pageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        pageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        pageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        pageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
               for _ in 1...5{
                 self.addPage()
                        
             }

        
        
       
    }


    func addPage(){
        let v = UIView()
                  v.backgroundColor = UIColor.random
                         pageView.pages.append(v)
    }
}



extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
