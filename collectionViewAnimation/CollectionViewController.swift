//
//  CollectionViewController.swift
//  collectionViewAnimation
//
//  Created by Mohsin on 23/06/2015.
//  Copyright (c) 2015 PanaCloud. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var beanTransitioningManager : BeanTransitionManager!
    
    
    let cellArray = ["dsa","dsad","dsa","dsaf"]

    override func viewDidLoad() {
        super.viewDidLoad()

        self.beanTransitioningManager = BeanTransitionManager(transitionDuration: 0.5)
        
        
//        self.beanTransitioningManager.updateExpandingImageViewWithCell(<#cell: BeanTransitionManagerCellExpanding!#>, atIndexPath: <#NSIndexPath!#>, inCollectionView: <#UICollectionView!#>, onView: <#UIView!#>, andDuration: <#NSTimeInterval#>)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return self.cellArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? MyCell
    
        // Configure the cell
    
        return cell!
    }
    
    
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        
        performSegueWithIdentifier("showSeg", sender: self)
        

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSeg"{
            
            let indexPath = self.collectionView?.indexPathsForSelectedItems()[0] as NSIndexPath
            
            self.collectionView?.deselectItemAtIndexPath(indexPath, animated: true)

            let cell = self.collectionView?.cellForItemAtIndexPath(indexPath) as MyCell
            
            
            self.beanTransitioningManager.updateExpandingImageViewWithCell(cell, atIndexPath: indexPath, inCollectionView: collectionView, onView: self.view, andDuration: 5.5)
            

            
            let desVC = segue.destinationViewController as DestinationVC
            
            desVC.transitioningDelegate = self.beanTransitioningManager
            
        }    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
    
    

}



class MyCell: UICollectionViewCell, BeanTransitionManagerCellExpanding {
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    
}
