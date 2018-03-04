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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "wonders\(index)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
