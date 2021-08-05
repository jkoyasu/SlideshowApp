import UIKit

var photo:UIImage!

class ViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var slideButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    var status : Bool = true
    var timer:Timer! = nil
    var num = 1
    var screenWidth:CGFloat = UIScreen.main.bounds.size.width
    var screenHeight:CGFloat = UIScreen.main.bounds.size.height
    
    // タイマー用の時間のための変数
    var timer_sec: Float = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slideButton.setTitle("再生", for: .normal)
        
        photo = UIImage(imageLiteralResourceName: String(num)+".jpg")
        photoView.image = photo
        photoView.isUserInteractionEnabled = true
        let width = photo.size.width
        let height = photo.size.height
        let scale = height / screenHeight
        photoView.frame = CGRect(x: 0,y: 0,width: width * scale / 4,height: height * scale / 4)
        photoView.center = CGPoint(x: (screenWidth / 2),y: (screenHeight / 2))
        self.view.addSubview(photoView)
        self.view.clipsToBounds = true
        
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "toSecond", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecond" {
            slideButton.setTitle("再生", for: .normal)
            status = true
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
                backButton.isEnabled = status
                forwardButton.isEnabled = status
            }
            var second = segue.destination as! Second
            second.secondphoto = UIImage(imageLiteralResourceName: String(num)+".jpg")
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if num < 3{
            num += 1
        }else{
            num -= 2
        }
        photo = UIImage(imageLiteralResourceName: String(num)+".jpg")
        photoView.image = photo
    }
    
    // 再生ボタン IBAction
    @IBAction func Slide(_ sender: Any) {
        if status{
            slideButton.setTitle("停止", for: .normal)
                status = false
                if self.timer == nil {
                    self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                }}else{
                slideButton.setTitle("再生", for: .normal)
                status = true
                if self.timer != nil {
                    self.timer.invalidate()
                    self.timer = nil
                }}
        backButton.isEnabled = status
        forwardButton.isEnabled = status
    }
    // 一時停止ボタン IBAction
    @IBAction func goforward(_ sender: Any) {
        if num < 3{
            num += 1
        }else{
            num -= 2
        }
        photo = UIImage(imageLiteralResourceName: String(num)+".jpg")
        photoView.image = photo
    }
    // リセットボタン IBAction
    @IBAction func goback(_ sender: Any) {
        if num == 1{
            num += 2
        }else{
            num -= 1
        }
        photo = UIImage(imageLiteralResourceName: String(num)+".jpg")
        photoView.image = photo
    }
}
