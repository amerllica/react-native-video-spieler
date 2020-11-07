import Foundation
import UIKit


@objc(IrPlayer)
class IrPlayer: UIView {
    @objc var mediaPlayer = VLCMediaPlayer()
    @objc var txt = "" {
        didSet {
            self.setupView()
        }
    }
    
    @objc var color = "#FFFFFFFF" {
        didSet {
            self.setupView()
        }
    }
    
    @objc var playerWidth: NSNumber = 100 {
        didSet {
            self.setupView()
        }
    }
    
    @objc var playerHeight: NSNumber = 100 {
        didSet {
            self.setupView()
        }
    }
    
    @objc var src = "" {
        didSet {
            self.setupView()
            self.play()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        self.addSubview(button)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }

    // in here you can configure your view
    private func setupView() {
        self.frame = CGRect(x: 0, y: 0, width: self.playerWidth.intValue , height: self.playerHeight.intValue)
        self.backgroundColor = UIColor(hex: self.color)
        self.isUserInteractionEnabled = true
        mediaPlayer.drawable = self
        if let url = URL(string: self.src) {
            mediaPlayer.media = VLCMedia(url: url)
            self.play()
        }
    }
    
    lazy var button: UIButton = {
        let b = UIButton.init(type: UIButton.ButtonType.system)
        b.setTitle("play", for: .normal)
        b.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        b.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        b.addTarget(
          self,
          action: #selector(play),
          for: .touchUpInside
        )
        return b
      }()


    @objc(play)
    func play() -> Void {
        mediaPlayer.play()
    }

}



extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
