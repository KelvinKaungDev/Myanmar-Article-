import AVFoundation
import SwiftUI

struct TotalQuiz {
    
    var quizzNumber = 0
    var score : Int = 0
    var player : AVAudioPlayer!
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let quizs = [
        QuizBrain(question: "What is the iconic signature of Inlay Lake?", multipleChoice: ["Water Garden", "Leg-rowing Technique", "Freash Water"], answer: "Leg-rowing Technique", sound : true),
        QuizBrain(question: "Pae Pyote and Nan Pyar represent the Myanmar independence day", multipleChoice: ["True", "False"], answer: "True", sound : true),
        QuizBrain(question: "Another word for the Myanmar Water festival?", multipleChoice: ["Thadingyut", "Thingyan", "Tazaungdaing"], answer: "Thingyan", sound : true),
        QuizBrain(question: "Who got the peace Nobel Prize in Myanmar?", multipleChoice: ["Daw Aung San Su Kyi", "Malala Yousafzai", "Nadia Murad"], answer: "Daw Aung San Su Kyi", sound : true),
        QuizBrain(question: "When you come to Myanmar during the water festival, which food you should try?", multipleChoice: ["Mote Lone Yay Paw", "Pae Pyote and Nan Pyar", "Laphet Thoke"], answer: "Mote Lone Yay Paw", sound : true),
        QuizBrain(question: "Which place is one of the UNESCO places in Myanmar?", multipleChoice: ["Bagan", "Inlay Lake", "Pyin Oo Lwin"], answer: "Bagan", sound : true),
        QuizBrain(question: "The water festival is the most important festival in Myanmar.", multipleChoice: ["True", "False"], answer: "True", sound : true),
        QuizBrain(question: "What is a popular gift to bring back home for friends and family in Myanmar?", multipleChoice: ["Mote Lone Yay Paw", "Pizza", "Lat Phat Thoke"], answer: "Lat Phat Thoke", sound : true),
        QuizBrain(question: "Which Bridge is the longest teakwood bridge in the world?", multipleChoice: ["Golden Gate Bridge", "U Bein Bridge", "Tower Bridge"], answer: "U Bein Bridge", sound : true),
        QuizBrain(question: "Daw Aung San Su Kyi is daughter of General Aung San", multipleChoice: ["True", "False"], answer: "True", sound : true),
        QuizBrain(question: "Your Total Score is", multipleChoice: ["RETAKE"], answer: "", sound : false)
    ]

    func quizzQuestionCount() -> Int {
        return quizs.count - 1
    }
    
    func sound() -> Bool {
        return quizs[quizzNumber].sound
    }
    
    func quizAnswerButton() -> [String] {
        return quizs[quizzNumber].multipleChoice
    }
    
    mutating func checkUserAnswer(_ userAnswer : String) -> Bool {
        if (userAnswer != quizs[quizzNumber].answer) {
            return false
        }

        score += 1
        return true
    }
    
    func totalScore() -> Int {
        return score
    }
    
    mutating func quizNextQuestion() {
        if quizzNumber + 1 < quizs.count {
            quizzNumber += 1
        }
        else {
            quizzNumber = 0
            score = 0
        }
    }
    
    func getQuestionText() -> String {
        return quizs[quizzNumber].question
    }
    
    func getQuestionAnswer() -> String {
        return quizs[quizzNumber].answer
    }
    
    func showProgress() -> Float {
        return Float(quizzNumber) / Float(quizs.count)
    }
    
    func overView() -> Bool {
        let result : Float = ( Float(quizs.count) - 1 ) / Float(quizs.count)
        
        if showProgress() != result {
            return false
        }
        
        return true
    }
    
    func scoreCheck(score : Int) -> String {
        switch score {
            case 8..<15 :
                return "Gread Job Your Score is \(score). Now You know famous about Myanmar"
            case 5..<8 :
                return "Not Bad Your Score is \(score)"
            default :
                return "Sorry You Score is \(score). You should read article and retake"
        }
    }
    
    mutating func audioPlay(sound : String) {
        if self.sound() {
            let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}

