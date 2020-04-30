//
//  DetailViewController.swift
//  mapAssignment
//
//  Created by Field Employee on 4/28/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  var locationData: InterestingLocation?
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descLabel: UILabel!
  
  @IBAction func backButton(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  override func viewDidLoad() {

    super.viewDidLoad()
    
    if let loc = locationData {
      imageView.image = UIImage(named: loc.photoName)
      nameLabel.text = loc.name
      descLabel.text = loc.desc
    } else {
      fatalError("You somehow clicked on a location that doesn't have data.")
    }
  }  
  
}
