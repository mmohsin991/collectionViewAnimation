//
//  ViewController.swift
//  collectionViewAnimation
//
//  Created by Mohsin on 23/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var beanTransitioningManager : BeanTransitionManager!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.beanTransitioningManager = BeanTransitionManager(expandingImageView: self.imageView, andTransitionDuration: 1.0)
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showSeg"{
        let desVC = segue.destinationViewController as DestinationVC
            
            desVC.transitioningDelegate = self.beanTransitioningManager
        
        }
    }
    
    


}

