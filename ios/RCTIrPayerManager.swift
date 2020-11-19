//
//  IrPayerManager.swift
//  IrPlayer
//
//  Created by Maziar on 10/15/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation


@objc (RCTIrPlayerManager)
class RCTIrPlayerManager: RCTViewManager {

    override static func requiresMainQueueSetup() -> Bool {
        return true
    }

    override func view() -> UIView! {
        let view = IrPlayer(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }
    
    @objc func play(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.play()
        }
    }

    @objc func pause(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.pause()
        }
    }
    
    @objc func togglePlay(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.togglePlay()
        }
    }
    
    @objc func stop(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.stop()
        }
    }
    
    
    @objc func setMediaTime(_ node: NSNumber, time: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.setMediaTime(time: time)
        }
    }
    
//    @objc
//    func getCount(_ callback: RCTResponseSenderBlock) {
//      callback([count])
//    }

//    @objc
//      func decrement(_ resolve: RCTPromiseResolveBlock, rejecter reject: RCTPromiseRejectBlock) -> Void {
//        var count = 0
//        if (count == 0) {
//          let error = NSError(domain: "", code: 200, userInfo: nil)
//          reject("E_COUNT", "count cannot be negative", error)
//        } else {
//          count -= 1
//          resolve("count was decremented")
//        }
//      }
}
