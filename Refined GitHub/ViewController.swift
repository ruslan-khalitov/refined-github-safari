//
//  ViewController.swift
//  Refined GitHub for Safari
//
//  Created by Ville Lautanala on 17/02/2019.
//  Copyright © 2019 Ville Lautanala. All rights reserved.
//

import Cocoa
import SafariServices.SFSafariApplication

class ViewController: NSViewController {

    @IBOutlet var appNameLabel: NSTextField!
    @IBOutlet var personalTokenInput: NSSecureTextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.appNameLabel.stringValue = "Refined GitHub for Safari";
        self.personalTokenInput.stringValue = Settings.shared.personalToken;
    }
    
    @IBAction func openSafariExtensionPreferences(_ sender: AnyObject?) {
        let bundlePrefix = Bundle(for: ViewController.self).bundleIdentifier ?? ""
        SFSafariApplication.showPreferencesForExtension(withIdentifier: "\(bundlePrefix)-extension") { error in
            if let _ = error {
                // Insert code to inform the user that something went wrong.

            }
        }
    }
    
    @IBAction func personalTokenDidChange(_ notification: AnyObject?) {
        Settings.shared.personalToken = self.personalTokenInput.stringValue;
    }
}
