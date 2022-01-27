//
//  ViewController.swift
//  ChoosePokemon
//
//  Created by Chu Go-Go on 2022/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questioLabel: UILabel!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet var pokeTest: [UIButton]!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var finalImageView: UIImageView!
    @IBOutlet weak var finalLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    var questions = [Question]()
    var questionIndex = 0
    var answers = ""
    var score = 0
    var allQuest = [Question(pokeName: "人牆魔偶", pokeImage: "人牆魔偶", answer: "超能系", questOption: ["超能系","妖精系","火系"]),
                    Question(pokeName: "傑尼龜", pokeImage: "傑尼龜", answer: "水系", questOption: ["水系","冰系","火系"]),
                    Question(pokeName: "卡比獸", pokeImage: "卡比獸", answer: "一般系", questOption: ["鋼系","一般系","格鬥系"]),
                    Question(pokeName: "双尾怪手", pokeImage: "双尾怪手", answer: "一般系", questOption: ["邪惡系","一般系","格鬥系"]),
                    Question(pokeName: "夢妖", pokeImage: "夢妖", answer: "幽靈系", questOption: ["邪惡系","幽靈系","毒系"]),
                    Question(pokeName: "小火龍", pokeImage: "小火龍", answer: "火系", questOption: ["火系","鋼系","一般系"]),
                    Question(pokeName: "帕奇利兹", pokeImage: "帕奇利兹", answer: "電系", questOption: ["電系","草系","一般系"]),
                    Question(pokeName: "戰槌龍", pokeImage: "戰槌龍", answer: "岩石系", questOption: ["龍系","鋼系","岩石系"]),
                    Question(pokeName: "才怪樹", pokeImage: "才怪樹", answer: "岩石系", questOption: ["草系","地面系","岩石系"]),
                    Question(pokeName: "拉普拉斯", pokeImage: "拉普拉斯", answer: "水系", questOption: ["水系","龍系","鋼系"]),
                    Question(pokeName: "浮潜鼬", pokeImage: "浮潜鼬", answer: "水系", questOption: ["水系","冰系","一般系"]),
                    Question(pokeName: "瑪納霏", pokeImage: "瑪納霏", answer: "水系", questOption: ["水系","冰系","妖精系"]),
                    Question(pokeName: "皮卡丘", pokeImage: "皮卡丘", answer: "電系", questOption: ["電系","一般系","妖精系"]),
                    Question(pokeName: "胡地", pokeImage: "胡地", answer: "超能力系", questOption: ["超能力系","幽靈系","妖精系"]),
                    Question(pokeName: "腕力", pokeImage: "腕力", answer: "格鬥系", questOption: ["格鬥系","地面系","岩石系"]),
                    Question(pokeName: "蚊香蛙王", pokeImage: "蚊香蛙王", answer: "水系", questOption: ["水系","草系","毒系"]),
                    Question(pokeName: "迷你龍", pokeImage: "迷你龍", answer: "龍系", questOption: ["龍系","水系","妖精系"]),
                    Question(pokeName: "阿勃梭魯", pokeImage: "阿勃梭魯", answer: "邪惡系", questOption: ["邪惡系","幽靈系","妖精系"]),
                    Question(pokeName: "雷吉斯奇鲁", pokeImage: "雷吉斯奇鲁", answer: "鋼系", questOption: ["超能力系","幽靈系","鋼系"]),
                    Question(pokeName: "風速狗", pokeImage: "風速狗", answer: "火系", questOption: ["火系","一般系","妖精系"])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        allQuest.shuffle()
        updateUI()
    }
    
    func updateUI(){
//        打亂你選項的內容
        allQuest[questionIndex].questOption.shuffle()
//        圖片是從你問題的裡面叫出來
        pokeImageView.image = UIImage(named: allQuest[questionIndex].pokeImage)
//        叫出相應對的答案
        answers = allQuest[questionIndex].answer
//        叫出相應對的題目
        pokeNameLabel.text = allQuest[questionIndex].pokeName
        //        叫出一個for in loop 讓他跑三次
        for i in 0..<3 {
            //            宣告option讓按鍵文字跑出三個選項
            var option = allQuest[questionIndex].questOption[i]
            //            讓你Button的文字是你questionIndex裡面的選項
            pokeTest[i].setTitle(option, for: .normal)
        }
//        因為questionIndex是從0開始計算所以要顯示第一題的話要＋1
        questioLabel.text = "第\(questionIndex + 1)/10題"
    }
    
    @IBAction func clickAnswer(_ sender: UIButton) {
//        每按一次就會跑到下一題
        questionIndex += 1
//        如果你Button的名字跟答案是一樣的
        if sender.currentTitle == answers {
//            你分數就會加10分
            score += 10
        }
//        點前10次的時候就會跑到下一題
        if questionIndex <= 9{
            updateUI()
//            當到第十題的時候要蓋住以及顯示的元件
        }else {
            buttonA.isHidden = true
            buttonB.isHidden = true
            buttonC.isHidden = true
            pokeImageView.isHidden = true
            pokeNameLabel.isHidden = true
            questioLabel.isHidden = true
            finalImageView.isHidden = false
            finalLabel.isHidden = false
            finalScoreLabel.isHidden = false
            resetButton.isHidden = false
        }
        if score == 100 {
            finalLabel.text = "你真是神奇寶貝大師！"
            finalScoreLabel.text = "總分：\(score)"
        }else if score >= 80{
            finalLabel.text = "真的是差一點啊！\n再去修行吧！"
            finalScoreLabel.text = "總分：\(score)"
        }else if score >= 60 {
            finalLabel.text = "好好修行吧！"
            finalScoreLabel.text = "總分：\(score)"
        }else {
            finalLabel.text = "你還是去玩數碼寶貝吧！"
            finalScoreLabel.text = "總分：\(score)"
        }
    }
    @IBAction func clickReset(_ sender: UIButton) {
        buttonA.isHidden = false
        buttonB.isHidden = false
        buttonC.isHidden = false
        pokeImageView.isHidden = false
        pokeNameLabel.isHidden = false
        questioLabel.isHidden = false
        finalImageView.isHidden = true
        finalLabel.isHidden = true
        finalScoreLabel.isHidden = true
        sender.isHidden = true
        gameStar()
    }
    
    func gameStar(){
//        宣告為0
        questionIndex = 0
//        答案是空值
        answers = ""
//        分數為0
        score = 0
//        問題在洗牌一次
        allQuest.shuffle()
//     讓選項再重新洗牌一次
        allQuest[questionIndex].questOption.shuffle()
        pokeImageView.image = UIImage(named: allQuest[questionIndex].pokeImage)
        answers = allQuest[questionIndex].answer
        pokeNameLabel.text = allQuest[questionIndex].pokeName
        //        叫出一個for in loop 讓他跑三次
        for i in 0..<3 {
            //            宣告option讓按鍵文字跑出三個選項
            var option = allQuest[questionIndex].questOption[i]
            //            讓你Button的文字是你questionIndex裡面的選項
            pokeTest[i].setTitle(option, for: .normal)
        }
        questioLabel.text = "第\(questionIndex + 1)/10題"
    }
    
}

