//
//  QuizResultViewController.swift
//  HW_PersonalityQuiz
//
//  Created by 曹家瑋 on 2023/8/3.
//

import UIKit

/// 顯示測驗結果的頁面。
/// 該頁面，根據使用者的得分，顯示相應的咖啡種類和描述。
class QuizResultViewController: UIViewController {
    
    /// 顯示咖啡種類（coffeeType）
    @IBOutlet weak var coffeeTypeLabel: UILabel!
    /// 顯示結果（coffeDescription描述）
    @IBOutlet weak var coffeeDescriptionLabel: UILabel!
    /// 顯示咖啡相對應圖片
    @IBOutlet weak var coffeeImageView: UIImageView!
    
    /// 儲存使用者的測驗結果分數
    var finalScore: Int?        // 其實finalScore一定會有值（可以直接"！"），但我這邊練習使用"?" 希望更安全
    
    /// 咖啡種類，將根據 finalScore 決定
    var coffeeType: CoffeeType?
    
    /// 設置分數範圍與結果
    let resultScoreRange: [Result] = [
        Result(range: Range(15...18), type: .espresso),
        Result(range: Range(10...14), type: .latte),
        Result(range: Range(5...9), type: .cappuccino),
        Result(range: Range(0...4), type: .icedDrip)
    ]
    
    /// viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 禁止使用 Navigation Bar 的返回按鈕
        navigationItem.hidesBackButton = true
        
        //        print("Final Score: \(finalScore)") // 測試
        
        // 如果 finalScore 有值，則使用該分數顯示對應的結果。否則，顯示錯誤訊息。
        if let score = finalScore {
            displayResult(for: score)
        }
        else {
            coffeeTypeLabel.text = "coffeeTypeLabel 出現錯誤"
            coffeeDescriptionLabel.text = "coffeeDescriptionLabel 出現錯誤"
        }
        
        // 生成相對應的咖啡圖片
        showCoffeeImage()
    }
    
    
    /// 根據得分得到相對應的咖啡種類
    /// - Parameter score: 得分
    /// - Returns: 對應咖啡的總類
    func getResult(for score: Int) -> CoffeeType {
        // for迴圈 遍歷 resultScoreRange 找到對應的咖啡種類
        for result in resultScoreRange {
            if result.range.contains(score) {
                return result.type
            }
        }
        fatalError("找不到對應的咖啡種類")    // 確定每個得分都有對應的結果，基本上不會觸發
    }
    
    
    /// 根據得分顯示對應的結果
    /// - Parameter score: 得分
    func displayResult(for score: Int) {
        let coffeeType = getResult(for: score)
        coffeeTypeLabel.text = coffeeType.rawValue
        coffeeDescriptionLabel.text = coffeeType.coffeDescription
    }
    
    
    /// 根據 finalScore 生成並顯示相對應的咖啡圖片
    func showCoffeeImage() {
        // 檢查 finalScore 是否包含值（根據 score 來設置 coffeeType）
        if let score = finalScore {
            if score >= 15 {
                coffeeType = .espresso
            } else if score >= 10 {
                coffeeType = .latte
            } else if score >= 5 {
                coffeeType = .cappuccino
            } else {
                coffeeType = .icedDrip
            }
        }
        
        // 設置相應的圖片到 UIImageView 中
        if let coffeeType = coffeeType,
           let coffeeImage = coffeeType.image {
            coffeeImageView.image = coffeeImage
        }
        else {
            // 如果 finalScore 為 nil 的處理方式（基本上用不到）
            coffeeImageView.image = nil
        }
    }
    
}
