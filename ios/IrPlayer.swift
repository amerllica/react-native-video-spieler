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

    private func setupView() {
        self.frame = CGRect(x: 0, y: 0, width: self.width.intValue , height: self.height.intValue)
        self.isUserInteractionEnabled = true
        mediaPlayer.delegate = self
        mediaPlayer.drawable = self
        if let url = URL(string: self.src) {
            mediaPlayer.media = VLCMedia(url: url)
        }
    }

    @objc(play)
    func play() -> Void {
        print("--------------->play")
        self.mediaPlayer.play()
    }
    
    @objc(pause)
    func pause() -> Void {
        mediaPlayer.pause()
    }
    
    @objc(stop)
    func stop() -> Void {
        mediaPlayer.stop()
    }
    
    @objc(remainingTime)
    func remainingTime() -> String {
        return mediaPlayer.remainingTime.stringValue
    }
    
    @objc(state)
    func state() -> String {
        return VLCMediaPlayerStateToString(mediaPlayer.state)
    }
    
    @objc(togglePlay)
    func togglePlay() -> Void {
        if mediaPlayer.isPlaying {
            mediaPlayer.pause()
        }
        else {
            mediaPlayer.play()
        }
    }
    
    @objc(getTime)
    func getTime() -> String {
        print("--------------->time")
        return mediaPlayer.time.stringValue
    }

}


extension IrPlayer: VLCMediaPlayerDelegate {
    func mediaPlayerStateChanged(_ aNotification: Notification!) {
        switch mediaPlayer.state {
        case .stopped:
            print("stopped")
            break
        case .buffering:
            print("buffering")
            break
        case .ended:
            print("ended")
            break
        case .error:
            print("error")
            break
        case .esAdded:
            print("esAdded")
            break
        case .opening:
            print("opening")
            break
        case .paused:
            print("paused")
            break
        case .playing:
            print("playing")
            break
        default:
            break
        }
    }
}

