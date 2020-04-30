//
//  AuthorizationView.swift
//  mapAssignment
//
//  Created by Field Employee on 4/28/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import UIKit
import LocalAuthentication

class AuthorizationView : UIViewController {
  @IBOutlet weak var noBioButton: UIButton!
  @IBOutlet weak var noBioLabel: UILabel!
  @IBAction func noBioButtonClick(_ sender: Any) {
    continueAnyways()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    noBioButton.isHidden = true
    noBioLabel.isHidden = true
    attemptAuthorization()
  }

  func attemptAuthorization() {
    let localAuthenticationContext = LAContext()
    
    localAuthenticationContext.localizedFallbackTitle = NSLocalizedString("Use Passcode", comment: "fallback title")
    var authError: NSError?
    let reasonString = NSLocalizedString("To use this app, you must be a true alpha", comment: "authorization text")
    
    if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
      localAuthenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reasonString) { success, evaluateError in
        if success {
          DispatchQueue.main.async {
            let mapController = self.storyboard?.instantiateViewController(withIdentifier: "mapController")
            mapController?.modalPresentationStyle = .fullScreen
            self.present(mapController!, animated: true)
          }
        }
      }
    } else {
      noBioLabel.isHidden = false
      noBioButton.isHidden = false
      noBioLabel.text = NSLocalizedString("Please enable biometrics for optimal security", comment: "text for no biometrics")
      noBioLabel.textAlignment = .center
      noBioButton.setTitle(NSLocalizedString("Continue Anyways", comment: "no biometrics button text"), for: .normal)
      noBioButton.titleLabel?.textAlignment = .center
    }
  }
  
  @objc func continueAnyways() {
    let mapController = self.storyboard?.instantiateViewController(withIdentifier: "mapController")
    mapController?.modalPresentationStyle = .fullScreen
    self.present(mapController!, animated: true)
  }
  
}


