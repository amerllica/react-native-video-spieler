import Foundation
import UIKit
import MobileVLCKit


@objc(IrPlayer)
class IrPlayer: UIView {
    @objc var mediaPlayer = VLCMediaPlayer()

    @objc var width: NSNumber = 100 {
        didSet {
            self.setupView()
        }
    }

    @objc var height: NSNumber = 100 {
        didSet {
            self.setupView()
        }
    }

    @objc var src = "http://streams.videolan.org/streams/mp4/Mr_MrsSmith-h264_aac.mp4" {
        didSet {
            self.setupView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }

    private func setupView() {
        self.frame = CGRect(x: 0, y: 0, width: self.width.intValue , height: self.height.intValue)
        self.isUserInteractionEnabled = true
        mediaPlayer.drawable = self
        if let url = URL(string: self.src) {
            mediaPlayer.media = VLCMedia(url: url)
        }
        
    }

    @objc(play)
    func play() -> Void {
        
       print("-------------------> play fired")
    
        if let url = URL(string: self.src) {
            print("-------------------> mediaPlayer \(mediaPlayer)")
            mediaPlayer.media = VLCMedia(url: url)
            print("-------------------> url \(url)")
            mediaPlayer.play()
        }
    }
    
    @objc(pause)
    func pause() -> Void {
        mediaPlayer.pause()
    }

}
