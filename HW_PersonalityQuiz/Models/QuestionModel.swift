//
//  QuestionModel.swift
//  HW_PersonalityQuiz
//
//  Created by 曹家瑋 on 2023/8/3.
//

import Foundation
import UIKit

/// 問題
struct Question {
    var quetionText: String      // 問題的文字內容
    var options: [Option]        // 問題的選項陣列
}

/// 選項
struct Option {
    var optionText: String      // 選項的文字內容
    var score: Int              // 選擇該選項所獲得的分數
}

/// 結果
struct Result {
    var range: Range<Int>       // 分數的範圍。總分數在這個範圍內，則會獲得對應的咖啡類型
    var type: CoffeeType        // 這是咖啡的類型。基於使用者的分數範圍得出
}

/// 咖啡種類
enum CoffeeType: String {
    case espresso = "濃厚的義式濃縮咖啡"
    case latte = "經典的拿鐵"
    case cappuccino = "香醇的卡布奇諾"
    case icedDrip = "清新的冰滴咖啡"
    
    // 會根據咖啡的類型返回相對應的描述
    var coffeDescription: String {
        switch self {
        case .espresso:
            return "活力四射的「風暴義式」！\n這杯濃厚的義式濃縮咖啡，就像一場迅疾而澎湃的能量風暴，適合你充滿活力的生活節奏。\n每一口咖啡都像是在點燃你的靈感火花，讓你充滿動力和熱情！"
        case .latte:
            return "舒心的「抱抱拿鐵」！\n這是一杯經典的拿鐵咖啡，平衡的風味帶來的舒適感觸對你很重要。\n就像是一個熱情的擁抱，每一口都帶給你溫暖和愉悅，讓你沉醉在悠然自得的時光裡。"
        case .cappuccino:
            return "輕柔的「絲絨卡布」！\n這杯香醇的卡布奇諾，柔和的風味和濃郁的奶泡能讓你感到放鬆。\n就像是一層絲絨般的溫暖覆蓋在心頭，每一口都讓你感到寧靜和平靜，讓你輕鬆享受片刻的寧靜時光。"
        case .icedDrip:
            return "純淨的「清雪冰滴」！\n這是一杯清新的冰滴咖啡，不添加任何糖分，簡單純淨的口感對你來說最重要。\n就像是一場清晨的第一場雪，每一口都如同清新的空氣般清爽，讓你感受到大自然的純淨和原始之美。"
        }
    }
    
    // 咖啡對應的圖片名稱
    var imageName: String {
        switch self {
        case .espresso:
            return "expresso"
        case .cappuccino:
            return "cappuccino"
        case .latte:
            return "latte"
        case .icedDrip:
            return "iced-Drip"
        }
    }
    
    // 咖啡對應的圖片
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
