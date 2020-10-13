import Foundation
import UIKit
//import MobileVLCKit

@objc(IrPlayer)
class IrPlayer: UIView {
    @objc var onClick: RCTBubblingEventBlock?
    @objc var status = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    // in here you can configure your view
    private func setupView() {
        let label : UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
//        label.text = "Ammmmmmmmmmerrrr + Maziar Spile"
        self.addSubview(label)
        self.backgroundColor = self.status ? .green : .red
        self.isUserInteractionEnabled = true
        let mediaPlayer = VLCMediaPlayer()
//        mediaPlayer.delegate = self
        mediaPlayer.drawable = self
        mediaPlayer.media = VLCMedia.init(url: URL(string: "http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4")!)
    }
   
     
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let params: [String : Any] = ["value1":"react demo","value2":1]
        print("event==========>\(event)")
        if let onClick = self.onClick {
            print("params==========>\(params)")
            onClick(params)
        }
    }
}

@objc (RCTIrPlayerManager)
class RCTIrPlayerManager: RCTViewManager {
 
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
 
  override func view() -> UIView! {
    return IrPlayer()
  }
 
}
