//
//  QuizHomePageViewController.swift
//  HW_PersonalityQuiz
//
//  Created by 曹家瑋 on 2023/8/3.
//

import UIKit

/// QuizHomePageViewController - 首頁主視圖（是顯示首頁的主視圖，使用者點擊開始按鈕來開始測驗。）
class QuizHomePageViewController: UIViewController {

    
    /// 咖啡動畫顯示的 UIImageView
    @IBOutlet weak var coffeeAnimationImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // 更新動畫圖片
        updateAnimation()
    }
    
    /// 更新動畫圖片
    fileprivate func updateAnimation() {
        // 從資源檔案中讀取 "coffee-" 開頭的一系列圖片，並將它們以指定的時間間隔組合成動畫
        let coffeeAnimatedImage = UIImage.animatedImageNamed("coffee-", duration: 0.5)
        coffeeAnimationImageView.image = coffeeAnimatedImage
    }
    
    /// 開始測驗按鈕
    /// 會在使用者點擊開始按鈕後被調用，並且觸發 "startQuiz" 的 segue，從而轉換到問卷的問題頁面。
    @IBAction func startQuizButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    /// Unwind Segue的方法。當在QuizResultViewController的 Navigation Bar上的"完成"被點擊時，該方法會被調用，並返回到QuizHomePageViewController畫面。（補充學習）
    @IBAction func unwindToQuizHomePage(segue: UIStoryboardSegue) {
        // 此方法被調用時，會自動返回到QuizHomePageViewController，目前不需要寫任何內容。
    }

}
