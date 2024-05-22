//
//  SkMaxappTiscreenrecordingdetectorModule.swift
//  Ti.ScreenRecordingDetector
//
//  Created by Marian Kucharcik
//  Copyright (c) 2024 Your Company. All rights reserved.
//

import UIKit
import TitaniumKit

/**
 
 Titanium Swift Module Requirements
 ---
 
 1. Use the @objc annotation to expose your class to Objective-C (used by the Titanium core)
 2. Use the @objc annotation to expose your method to Objective-C as well.
 3. Method arguments always have the "[Any]" type, specifying a various number of arguments.
 Unwrap them like you would do in Swift, e.g. "guard let arguments = arguments, let message = arguments.first"
 4. You can use any public Titanium API like before, e.g. TiUtils. Remember the type safety of Swift, like Int vs Int32
 and NSString vs. String.
 
 */

@objc(SkMaxappTiscreenrecordingdetectorModule)
class SkMaxappTiscreenrecordingdetectorModule: TiModule {

  public let testProperty: String = "Hello World"
  
  func moduleGUID() -> String {
    return "87496f09-c651-4c73-a548-6b25e4d8199d"
  }
  
  override func moduleId() -> String! {
    return "sk.maxapp.tiscreenrecordingdetector"
  }

  override func startup() {
    super.startup()
      ScreenRecordingDetector.shared
              NotificationCenter.default.addObserver(self, selector: #selector(screenRecordingStatusChanged(_:)), name: NSNotification.Name("ScreenRecordingStatusChanged"), object: nil)
    debugPrint("[DEBUG] \(self) loaded")
  }

    @objc func isScreenRecording(_ args: [Any]?) -> NSNumber {
            return NSNumber(value: ScreenRecordingDetector.shared.isScreenRecording())
        }
        
        @objc func screenRecordingStatusChanged(_ notification: Notification) {
            if let userInfo = notification.userInfo, let isCaptured = userInfo["isCaptured"] as? Bool {
                fireEvent("screenRecordingStatusChanged", with: ["isCaptured": isCaptured])
            }
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }
}
