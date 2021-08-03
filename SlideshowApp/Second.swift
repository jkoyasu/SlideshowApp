//
//  Second.swift
//  SlideshowApp
//
//  Created by koyasu on 2021/08/04.
//

import UIKit

class Second: UIViewController {
    
    var secondphoto: UIImage!
    @IBOutlet weak var secondphotoView: UIImageView!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        secondphotoView.image = secondphoto
        button.backgroundColor = UIColor.white
        button.layer.borderWidth = 1  // 5
        button.layer.borderColor = UIColor.blue.cgColor  // 6
        button.layer.cornerRadius = 10  // 7
        button.layer.shadowOffset = CGSize(width: 3, height: 3 )  // 8
        button.layer.shadowOpacity = 0.5  // 9
        button.layer.shadowRadius = 10  // 10
        button.layer.shadowColor = UIColor.gray.cgColor  // 11
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
