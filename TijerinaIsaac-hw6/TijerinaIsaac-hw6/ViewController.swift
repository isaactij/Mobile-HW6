//
//  ViewController.swift
//  TijerinaIsaac-hw6
//
//  Created by Isaac on 3/3/18.
//  Copyright © 2018 TijerinaIsaac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var indexP:Int  = 1
    
    //First thing to be called
    override func viewDidLoad() {
        super.viewDidLoad()
        //Begins adjusting the constraints
        let margins = view.layoutMarginsGuide
        // Pin the leading edge of myView to the margin's leading edge
        imageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        // Pin the trailing edge of myView to the margin's trailing edge
        imageView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        // Give myView a 1:2 aspect ratio
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 2.0).isActive = true
        //Sets the image
        imageView.image = UIImage(named: "wonders\(indexP)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
