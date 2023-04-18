import AVFoundation
import SwiftUI

struct SingleTopicQuiz {
    
    var quizzNumber = 0
    var score : Int = 0
    var topicNumber : Int
    var player : AVAudioPlayer!
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let quizs = [
        [QuizBrain(question: "Which place is one of the UNESCO places in Myanmar?", multipleChoice: ["Bagan", "Inlay Lake", "Pyin Oo Lwin"], answer: "Bagan", sound : true),
          QuizBrain(question: "Which Bridge is the longest teakwood bridge in the world?", multipleChoice: ["U Bein Bridge", "Golden Gate Bridge", "Tower Bridge"], answer: "U Bein Bridge", sound : true),
          QuizBrain(question: "What is the iconic signature of Inlay Lake?", multipleChoice: ["Water Garden", "Leg-rowing Technique", "Freash Water"], answer: "Leg-rowing Technique", sound : true),
         QuizBrain(question: "Which city can offer the British atmosphere in Myanmar?", multipleChoice: ["Bagan", "Pyin Oo Lwin", "Inlay Lake"], answer: "Pyin Oo Lwin", sound : true),
         QuizBrain(question: "Your Total Score is", multipleChoice: ["RETAKE"], answer: "", sound : false)
        ],
        [QuizBrain(question: "The water festival is the most important festival in Myanmar.", multipleChoice: ["True", "False"], answer: "True", sound : true),
          QuizBrain(question: "Another word for the Myanmar Water festival?", multipleChoice: ["Thingyan", "Thadingyut", "Tha Saung Thie"], answer: "Thingyan", sound : true),
          QuizBrain(question: "Thadingyut is also know as", multipleChoice: ["Water Festival", "Lighting Festival"], answer: "Lighting Festival", sound : true),
          QuizBrain(question: "What is the highlight of the Tazaungdaing Festival?", multipleChoice: ["Fire Balloon", "Lighting", "Water"], answer: "Fire Balloon", sound : true),
         QuizBrain(question: "Your Total Score is", multipleChoice: ["RETAKE"], answer: "", sound : false)
        ],
        [QuizBrain(question: "Pae Pyote and Nan Pyar represent the Myanmar Independence day", multipleChoice: ["True", "False"], answer: "True", sound : true),
          QuizBrain(question: "When you come to Myanmar during the water festival, which food you should try?", multipleChoice: ["Mote Lone Yay Paw", "Pae Pyote and Nan Pyar", "Laphet Thoke"], answer: "Mote Lone Yay Paw", sound : true),
          QuizBrain(question: "Laphet Thoke is also a popular gift to bring back home for friends and family.", multipleChoice: ["True", "False"], answer: "True", sound : true),
         QuizBrain(question: "Your Total Score is", multipleChoice: ["RETAKE"], answer: "", sound : false)
        ],
        [QuizBrain(question: "Who got the peace Nobel Prize in Myanmar?", multipleChoice: ["Malala Yousafzai", "Daw Aung San Su Kyi", "Nadia Murad"], answer: "Daw Aung San Su Kyi", sound : true),
          QuizBrain(question: "Daw Aung San Su Kyi is daughter of General Aung San", multipleChoice: ["True", "False"], answer: "True", sound : true),
         QuizBrain(question: "Who is the first non-European and the first Asian to hold the position of Secretary-General of the United Nations?", multipleChoice: ["General Aung San", "U Thant", "Daw Aung San Su Kyi"], answer: "U Thant", sound : true),
         QuizBrain(question: "Your Total Score is", multipleChoice: ["RETAKE"], answer: "", sound : false)
        ],
    ]
    
    func quizzQuestionCount() -> Int {
        return quizs[topicNumber].count - 1
    }
    
    func sound() -> Bool {
        return quizs[topicNumber][quizzNumber].sound
    }
    
    func quizAnswerButton() -> [String] {
        return quizs[topicNumber][quizzNumber].multipleChoice
    }
    
    mutating func checkUserAnswer(_ userAnswer : String) -> Bool {
        if (userAnswer != quizs[topicNumber][quizzNumber].answer) {
            return false
        }

        score += 1
        return true
    }
    
    func totalScore() -> Int {
        return score
    }
    
    mutating func quizNextQuestion() {
        if quizzNumber + 1 < quizs[topicNumber].count {
            quizzNumber += 1
        }
        else {
            quizzNumber = 0
            score = 0
        }
    }
    
    func getQuestionText() -> String {
        return quizs[topicNumber][quizzNumber].question
    }
    
    func getQuestionAnswer() -> String {
        return quizs[topicNumber][quizzNumber].answer
    }
    
    func showProgress() -> Float {
        return Float(quizzNumber) / Float(quizs[topicNumber].count)
    }
    
    func overView() -> Bool {
        let result : Float = (Float(quizs[topicNumber].count) - 1) /  Float(quizs[topicNumber].count)
        
        if showProgress() != result {
            return false
        }
        
        return true
    }
    
    mutating func audioPlay(sound : String) {
        if self.sound() {
            let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
