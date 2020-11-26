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
    
    @objc func volumeUp(_ node: NSNumber, volume: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.volumeUp()
        }
    }
    
    @objc func volumeDown(_ node: NSNumber, volume: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.volumeDown()
        }
    }
    
    @objc func setVolume(_ node: NSNumber, volume: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.setVolume(volume: volume)
        }
    }
    
    
    @objc func jumpForward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.jumpForward()
        }
    }
    
    @objc func jumpBackward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.jumpBackward()
        }
    }
    
    @objc func longJumpForward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.longJumpForward()
        }
    }
    
    @objc func longJumpBackward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.longJumpBackward()
        }
    }
    
    @objc func shortJumpForward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.shortJumpForward()
        }
    }
    
    @objc func shortJumpBackward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.shortJumpBackward()
        }
    }
    
    @objc func mediumJumpForward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.mediumJumpForward()
        }
    }
    
    @objc func mediumJumpBackward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.mediumJumpBackward()
        }
    }
    
    @objc func extraShortJumpForward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.extraShortJumpForward()
        }
    }
    
    @objc func extraShortJumpBackward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.extraShortJumpBackward()
        }
    }
    
    @objc func addPlaybackSubtitle(_ node: NSNumber, subTitleSrc: NSString) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.addPlaybackSlaveSubtitle(subTitleSrc: subTitleSrc)
        }
    }
    
    @objc func addPlaybackAudio(_ node: NSNumber, audioSrc: NSString) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.addPlaybackSlaveAudio(audioSrc: audioSrc)
        }
    }
    
    @objc func fastForward(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.fastForward()
        }
    }
    
    @objc func rewind(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.rewind()
        }
    }
    
    @objc func getMediaInfo(_ node: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.getMediaInfo()
        }
    }
    
    @objc func setCurrentVideoSubTitleIndex(_ node: NSNumber, index: NSNumber) {
        DispatchQueue.main.async {
            let component = self.bridge.uiManager.view(
                forReactTag: node
            ) as! IrPlayer
            component.setCurrentVideoSubTitleIndex(index: index)
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
