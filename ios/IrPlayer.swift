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
    @objc var onGetMediaInfo: RCTDirectEventBlock?
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
            let media = VLCMedia(url: url)
            mediaPlayer.media = media
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
    
    @objc(jumpForward)
    func jumpForward() -> Void {
        mediaPlayer.jumpForward(15)
    }
    
    @objc(jumpBackward)
    func jumpBackward() -> Void {
        mediaPlayer.jumpBackward(15)
    }
    
    @objc(longJumpForward)
    func longJumpForward() -> Void {
        mediaPlayer.longJumpForward()
    }
    
    @objc(longJumpBackward)
    func longJumpBackward() -> Void {
        mediaPlayer.longJumpBackward()
    }
    
    @objc(shortJumpForward)
    func shortJumpForward() -> Void {
        mediaPlayer.shortJumpForward()
    }
    
    @objc(shortJumpBackward)
    func shortJumpBackward() -> Void {
        mediaPlayer.shortJumpBackward()
    }
    
    @objc(mediumJumpForward)
    func mediumJumpForward() -> Void {
        mediaPlayer.mediumJumpForward()
    }
    
    @objc(mediumJumpBackward)
    func mediumJumpBackward() -> Void {
        mediaPlayer.mediumJumpBackward()
    }
    
    @objc(extraShortJumpForward)
    func extraShortJumpForward() -> Void {
        mediaPlayer.extraShortJumpForward()
    }
    
    @objc(extraShortJumpBackward)
    func extraShortJumpBackward() -> Void {
        mediaPlayer.extraShortJumpBackward()
    }
    
    @objc(rewind)
    func rewind() -> Void {
        mediaPlayer.rewind()
    }
    
    @objc(fastForward)
    func fastForward() -> Void {
        mediaPlayer.fastForward()
    }
    
    @objc
    func addPlaybackSlaveSubtitle(subTitleSrc: NSString) -> Void {
        if let url = URL(string: subTitleSrc as String) {
            mediaPlayer.addPlaybackSlave(url , type: .subtitle, enforce: true)
        }
    }

    @objc
    func addPlaybackSlaveAudio(audioSrc: NSString) -> Void {
        if let url = URL(string: audioSrc as String) {
            mediaPlayer.addPlaybackSlave(url , type: .audio, enforce: true)
        }
    }
    
    @objc
    func setVolume(volume : NSNumber) -> Void {
        mediaPlayer.audio.volume = volume.int32Value
    }
    
    @objc
    func setMediaTime(time : NSNumber) -> Void {
        mediaPlayer.time = VLCTime(int: time.int32Value)
    }
    
    @objc
    func setCurrentVideoSubTitleIndex(index : NSNumber) -> Void {
        if mediaPlayer.numberOfSubtitlesTracks > index.intValue {
            mediaPlayer.currentVideoSubTitleIndex = index.int32Value
        }
    }
    
    
 
    
    @objc(getMediaInfo)
    func getMediaInfo() -> Void {
        if onGetMediaInfo != nil {
            onGetMediaInfo!([
                                "videoSize": mediaPlayer.videoSize,
                                "videoTrackNames": mediaPlayer.videoTrackNames ?? "",
                                "videoSubTitlesNames": mediaPlayer.videoSubTitlesNames ?? "",
                                "videoSubTitlesIndexes": mediaPlayer.videoSubTitlesIndexes ?? "",
                                "videoAspectRatio": mediaPlayer.videoAspectRatio ?? "",
                                "audioTrackNames": mediaPlayer.audioTrackNames ?? "",
                                "audioTrackIndexes": mediaPlayer.audioTrackIndexes ?? "",
                                "currentAudioTrackIndex": mediaPlayer.currentAudioTrackIndex ,
                                "currentTitleIndex": mediaPlayer.currentTitleIndex ,
                                "currentVideoSubTitleIndex": mediaPlayer.currentVideoSubTitleIndex ,
                                "currentVideoTrackIndex": mediaPlayer.currentVideoTrackIndex ,
                                "numberOfAudioTracks": mediaPlayer.numberOfAudioTracks ,
                                "numberOfSubtitlesTracks": mediaPlayer.numberOfSubtitlesTracks ,
                                "numberOfVideoTracks": mediaPlayer.numberOfVideoTracks ,
                                "numberOfTitles": mediaPlayer.numberOfTitles ,
                                "position": mediaPlayer.position ,
                                "pitch": mediaPlayer.pitch ,
                                "state": mediaPlayer.state,
                                "isPlaying": mediaPlayer.isPlaying,
                                "remainingTime": mediaPlayer.remainingTime.intValue])
        }
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
                            "tracksInformation": mediaPlayer.media.tracksInformation,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .buffering:
            if onBuffering != nil {
                onBuffering!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "tracksInformation": mediaPlayer.media.tracksInformation,
                            "mediaLengthMinute": mediaPlayer.media.length.stringValue ?? "",
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .ended:
            if onEnded != nil {
                onEnded!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                          "time": mediaPlayer.time.intValue,
                          "volume": mediaPlayer.audio.volume,
                          "tracksInformation": mediaPlayer.media.tracksInformation,
                          "mediaLength": mediaPlayer.media.length.intValue,
                          "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .error:
            if onError != nil {
                onError!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                          "time": mediaPlayer.time.intValue,
                          "volume": mediaPlayer.audio.volume,
                          "tracksInformation": mediaPlayer.media.tracksInformation,
                          "mediaLength": mediaPlayer.media.length.intValue,
                          "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .esAdded:
            if onEsAdded != nil {
                onEsAdded!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "tracksInformation": mediaPlayer.media.tracksInformation,
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
                            "tracksInformation": mediaPlayer.media.tracksInformation,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .paused:
            if onPaused != nil {
                onPaused!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                            "time": mediaPlayer.time.intValue,
                            "volume": mediaPlayer.audio.volume,
                            "tracksInformation": mediaPlayer.media.tracksInformation,
                            "mediaLength": mediaPlayer.media.length.intValue,
                            "remainingTime": mediaPlayer.remainingTime.intValue])
            }
            break
        case .playing:
            if onPlaying != nil {
                onPlaying!(["state": VLCMediaPlayerStateToString(mediaPlayer.state) ?? "No State" ,
                           "time": mediaPlayer.time.intValue,
                           "volume": mediaPlayer.audio.volume,
                           "tracksInformation": mediaPlayer.media.tracksInformation,
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
                            "tracksInformation": mediaPlayer.media.tracksInformation,
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

extension IrPlayer: VLCMediaThumbnailerDelegate {
    func mediaThumbnailerDidTimeOut(_ mediaThumbnailer: VLCMediaThumbnailer!) {
        
    }
    
    func mediaThumbnailer(_ mediaThumbnailer: VLCMediaThumbnailer!, didFinishThumbnail thumbnail: CGImage!) {
//        thumbImageView?.image = UIImage(cgImage: thumbnail)
    }
}

extension IrPlayer {
    func xx() {
    }
}
