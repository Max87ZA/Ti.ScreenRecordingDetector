//
//  ScreenRecordingDetector.swift
//  SkMaxappTiscreenrecordingdetector
//
//  Created by Max87 on 22/05/2024.
//

import Foundation
import UIKit

@objc(ScreenRecordingDetector)
public class ScreenRecordingDetector: NSObject {
    
    @objc public static let shared = ScreenRecordingDetector()
    
    private override init() {
        super.init()
        setupScreenRecordingDetection()
    }
    
    private func setupScreenRecordingDetection() {
        NotificationCenter.default.addObserver(self, selector: #selector(screenRecordingStatusChanged), name: UIScreen.capturedDidChangeNotification, object: nil)
    }
    
    @objc private func screenRecordingStatusChanged() {
        let isCaptured = UIScreen.main.isCaptured
        NotificationCenter.default.post(name: NSNotification.Name("ScreenRecordingStatusChanged"), object: nil, userInfo: ["isCaptured": isCaptured])
    }
    
    @objc public func isScreenRecording() -> Bool {
        return UIScreen.main.isCaptured
    }
}
