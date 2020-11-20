import Foundation
import UIKit
import MobileVLCKit


@objc(IrPlayer)
class IrPlayer: UIView {
    @objc var mediaPlayer = VLCMediaPlayer()
    
    @objc var onStateChange: RCTDirectEventBlock?
    @objc var onStopped: RCTDirectEventBlock?
    @objc var onBuffering: RCTDirectEventBlock?
    @objc var onEnded: RCTDirectEventBlock?
    @objc var onError: RCTDirectEventBlock?
    @objc var onEsAdded: RCTDirectEventBlock?
    @objc var onOpening: RCTDirectEventBlock?
    @objc var onPaused: RCTDirectEventBlock?
    @objc var onPlaying: RCTDirectEventBlock?
    
    @objc var onTimeChanged: RCTDirectEventBlock?

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
            mediaPlayer.media.delegate = self
        }
    }

    @objc(play)
    func play() -> Void {
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
    
    @objc(togglePlay)
    func togglePlay() -> Void {
        if mediaPlayer.isPlaying {
            mediaPlayer.pause()
        }
        else {
            mediaPlayer.play()
        }
    }
    
    @objc(volumeUp)
    func volumeUp() -> Void {
        mediaPlayer.audio.volumeUp()
    }
    
    @objc(volumeDown)
    func volumeDown() -> Void {
        mediaPlayer.audio.volumeDown()
    }
    
    @objc
    func setVolume(volume : NSNumber) -> Void {
        mediaPlayer.audio.volume = volume.int32Value
    }
    
    @objc
    func setMediaTime(time : NSNumber) -> Void {
        mediaPlayer.time = VLCTime(int: time.int32Value)
    }
    

}


extension IrPlayer: VLCMediaPlayerDelegate {
    func mediaPlayerStateChanged(_ aNotification: Notification!) {
        print("mediaPlayer.media.length--------->\(mediaPlayer.media.length.intValue)")
        
        if onStateChange != nil {
            onStateChange!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
        }
        switch mediaPlayer.state {
        case .stopped:
            if onStopped != nil {
                onStopped!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .buffering:
            if onBuffering != nil {
                onBuffering!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "mediaLengthMinute": mediaPlayer.media.length.stringValue ?? "",
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .ended:
            if onEnded != nil {
                onEnded!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                          "time": mediaPlayer.time.intValue,
                          "volume": mediaPlayer.audio.volume,
                          "mediaLength": mediaPlayer.media.length.intValue,
                          "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .error:
            if onError != nil {
                onError!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                          "time": mediaPlayer.time.intValue,
                          "volume": mediaPlayer.audio.volume,
                          "mediaLength": mediaPlayer.media.length.intValue,
                          "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .esAdded:
            if onEsAdded != nil {
                onEsAdded!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "mediaLengthMinute": mediaPlayer.media.length.stringValue ?? "",
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .opening:
            if onOpening != nil {
                onOpening!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .paused:
            if onPaused != nil {
                onPaused!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .playing:
            if onPlaying != nil {
                onPlaying!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                           "time": mediaPlayer.time.intValue,
                           "volume": mediaPlayer.audio.volume,
                           "mediaLength": mediaPlayer.media.length.intValue,
                           "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        default:
            break
        }
    }
    
    func mediaPlayerTimeChanged(_ aNotification: Notification!) {
        if onTimeChanged != nil {
            onTimeChanged!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
        }
    }
    
}


extension IrPlayer: VLCMediaDelegate {
    func mediaDidFinishParsing(_ aMedia: VLCMedia) {
        switch aMedia.parsedStatus {
        case .done:
            break
        case .failed:
            break
        case .skipped:
            break
        case .timeout:
            break
        default:
            break
        }
    }
}
