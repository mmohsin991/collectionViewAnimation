//
//  DestinationVC.swift
//  collectionViewAnimation
//
//  Created by Mohsin on 23/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class DestinationVC: UIViewController, BeanTransitionManagerDelegate {

    
    @IBOutlet weak var delegateContentImageView: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.lblTitle.text = "Image.."
    }
    @IBAction func back(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
