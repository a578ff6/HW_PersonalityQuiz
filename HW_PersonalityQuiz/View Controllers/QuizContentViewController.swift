//
//  QuizContentViewController.swift
//  HW_PersonalityQuiz
//
//  Created by 曹家瑋 on 2023/8/3.
//

import UIKit

/// 用於展示問答題目及選項
class QuizContentViewController: UIViewController {

    /// 追蹤答題進度
    @IBOutlet weak var questionProgressView: UIProgressView!
    /// 顯示當前問題的數量
    @IBOutlet weak var questionIndexLabel: UILabel!
    /// 顯示當前問題的內容
    @IBOutlet weak var questionLabel: UILabel!
    /// 四個答題選項的按鈕
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    /// 存放所有問題的陣列
    var questions: [Question] = [
        Question(quetionText: "你早上的精神狀況如何？", options:[
            Option(optionText: "完全清醒，元氣滿滿！", score: 3),
            Option(optionText: "需要一些時間才能完全醒來", score: 2),
            Option(optionText: "很難醒來，感覺很累", score: 1),
            Option(optionText: "直到午餐我都還在睡夢中", score: 0)
        ]),
        Question(quetionText: "你平常喜歡什麼樣的風味？", options: [
            Option(optionText: "強烈和獨特", score: 3),
            Option(optionText: "甜和香醇", score: 2),
            Option(optionText: "柔和和細膩", score: 1),
            Option(optionText: "沒特別喜好", score: 0)
        ]),
        Question(quetionText: "你在工作或學習時最需要什麼？", options: [
            Option(optionText: "高度專注和精神集中", score: 3),
            Option(optionText: "一種穩定和平靜的狀態", score: 2),
            Option(optionText: "靈感和創新", score: 1),
            Option(optionText: "放空茫然", score: 0)
        ]),
        Question(quetionText: "如果咖啡成為你的下午茶，你會選擇什麼風味的咖啡？", options: [
            Option(optionText: "深烘焙的，濃厚風味", score: 3),
            Option(optionText: "中烘焙的，均衡口感", score: 2),
            Option(optionText: "淺烘焙的，果香味強", score: 1),
            Option(optionText: "我通常不會在下午喝咖啡", score: 0)
        ]),
        Question(quetionText: "你通常喝咖啡的時候是？", options: [
            Option(optionText: "清晨，開始新的一天", score: 3),
            Option(optionText: "下午，提振精神", score: 2),
            Option(optionText: "晚上，讀書或工作", score: 1),
            Option(optionText: "我一整天都會喝咖啡", score: 0)
        ]),
        Question(quetionText: "你最喜歡哪種甜點？", options: [
            Option(optionText: "黑巧克力", score: 3),
            Option(optionText: "焦糖布丁", score: 2),
            Option(optionText: "鮮果塔", score: 1),
            Option(optionText: "我不喜歡甜食", score: 0)
        ])
    ]
    
    /// 紀錄當前題目的索引
    var currentQuestionIndex = 0
    /// 紀錄總分數的變數
    var totalScore = 0
    
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        // 隱藏返回按鈕
        navigationItem.hidesBackButton = true
//        navigationItem.title = "尋找適合的咖啡"
        // 生成第一個問題
        loadQuestion(at: currentQuestionIndex)
    }
    
    
    // 四個按鈕的IBAction，處理選擇選項的操作
    @IBAction func optionButtonTapped(_ sender: UIButton) {
        
        // 獲取當前問題和選項
        let question = questions[currentQuestionIndex]
        // 需要在 Storyboard 中為每個選項按鈕設置正確的 tag 值，才能正常使用。
        let selectedOption = question.options[sender.tag]
        
        // 更新總得分
        totalScore += selectedOption.score
        
        // 測試用（觀察答題分數變化）
        print("Question \(currentQuestionIndex + 1) score: \(selectedOption.score), Total score: \(totalScore)")

        // 檢查是否還有下一個問題。如果有，加載下一個問題，否則顯示結果頁面
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
            loadQuestion(at: currentQuestionIndex)
        } else {
            // 顯示結果頁面（segue 的 identifier 是 "showResult"）
            performSegue(withIdentifier: "showResult", sender: nil)
        }
        
    }
    
    
    /// 顯示結果頁面的 Segue。此方法會在使用者完成測驗後被調用，
    /// 創建一個 QuizResultViewController 的實例，然後轉換到該 ViewController 以顯示適合的咖啡。
    @IBSegueAction func displayResult(_ coder: NSCoder) -> QuizResultViewController? {
        
        // 當執行Segue時，總得分(totalScore)將被傳遞給QuizResultViewController的finalScore屬性。
        let controller = QuizResultViewController(coder: coder)
        controller?.finalScore = totalScore
        return controller
    }
    
    
    /// 生成問題和選項。會讀取題目並設置對應的選項到介面上。
    /// - Parameter index: 題目索引
    func loadQuestion(at index: Int) {
        
        let question = questions[index]
        
        // 設置答題進度
        let totalProgress = Float(currentQuestionIndex) / Float(questions.count)
        
        // 更新問題編號的Label
        questionIndexLabel.text = "Q.\(index + 1)"
        
        // 更新答題進度條
        questionProgressView.setProgress(totalProgress, animated: true)

        // 更新題目內容
        questionLabel.text = question.quetionText
                
        // 更新答題選項的按鈕文字
        option1Button.setTitle(question.options[0].optionText, for: .normal)
        option2Button.setTitle(question.options[1].optionText, for: .normal)
        option3Button.setTitle(question.options[2].optionText, for: .normal)
        option4Button.setTitle(question.options[3].optionText, for: .normal)
    }
    
    
}
