/*
 Copyright 2018 Amazon.com, Inc. and its affiliates. All Rights Reserved.
 
 Licensed under the Amazon Software License (the "License").
 You may not use this file except in compliance with the License.
 A copy of the License is located at
 
 http://aws.amazon.com/asl/
 
 or in the "license" file accompanying this file. This file is distributed
 on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 express or implied. See the License for the specific language governing
 permissions and limitations under the License.
 */

import UIKit
import AWSAuthCore
import AWSAuthUI
import AWSMobileClient
import AWSAppSync

class ViewController: UIViewController {

    var appSyncClient: AWSAppSyncClient?
    
    @IBOutlet weak var themeSegmentControl: UISegmentedControl!
    @IBOutlet weak var lblTheme: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getSettings() // Get user settings
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        // AppSync
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appSyncClient = appDelegate.appSyncClient!
        
        // Sign-in UI for Cognito User Pools - If NOT Logged in, show login UI as login required
        if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController.presentViewController(with: self.navigationController!,
               configuration: nil,
               completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                if error != nil {
                    print("Error occurred: \(String(describing: error))")
                } else {
                    // Sign in successful.
                }
            })
        }
        else
        {
            print("IdentityId: \(AWSIdentityManager.default().credentialsProvider.identityId)")
        }
        
        getSettings() // Get user settings
    }
    
    // Action taken when the user selects a theme from the segment controller
    @IBAction func indexChanged(_ sender: Any) {
        switch themeSegmentControl.selectedSegmentIndex {
        case 0:
            lblTheme.text = "Default Theme"
            view.backgroundColor = UIColor.white
            updateSettings(theme: "Default", displayName: "Default Theme")
        case 1:
            lblTheme.text = "Theme 1"
            view.backgroundColor = UIColor.lightGray
            updateSettings(theme: "Theme1", displayName: "Theme 1")
        case 2:
            lblTheme.text = "Theme 2"
            view.backgroundColor = UIColor.cyan
            updateSettings(theme: "Theme2", displayName: "Theme 2")
        case 3:
            lblTheme.text = "Theme 3"
            view.backgroundColor = UIColor.orange
            updateSettings(theme: "Theme3", displayName: "Theme 3")
        default:
            break
        }
    }

    // GraphQL Mutation occurs when a user selects a new theme from segment controller
    func updateSettings(theme: String, displayName: String) {
        let mutationInput = SettingsInput(theme: theme, displayName: displayName)
        let mutation = SetSettingsMutation(settingsInput: mutationInput)
        
        appSyncClient?.perform(mutation: mutation)
    }
    
    func getSettings() {
        appSyncClient?.fetch(query: GetSettingsQuery(), cachePolicy: .returnCacheDataAndFetch) {
            (result, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                return
            }
            
            // Get the current theme setting for the currently logged in user
            guard let themeSetting = result?.data?.getSettings?.theme else {
                print("Theme is nil")
                return
            }
            
            // Set the theme segment and trigger value change based on the current user theme
            switch themeSetting {
            case "Default":
                self.themeSegmentControl.selectedSegmentIndex = 0
                self.themeSegmentControl.sendActions(for: UIControlEvents.valueChanged)
            case "Theme1":
                self.themeSegmentControl.selectedSegmentIndex = 1
                self.themeSegmentControl.sendActions(for: UIControlEvents.valueChanged)
            case "Theme2":
                self.themeSegmentControl.selectedSegmentIndex = 2
                self.themeSegmentControl.sendActions(for: UIControlEvents.valueChanged)
            case "Theme3":
                self.themeSegmentControl.selectedSegmentIndex = 3
                self.themeSegmentControl.sendActions(for: UIControlEvents.valueChanged)
            default:
                break
            }
            
            print("Theme Settings from getSettings: \(themeSetting)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

