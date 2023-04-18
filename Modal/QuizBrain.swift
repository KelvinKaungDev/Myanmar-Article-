struct QuizBrain : Hashable {

    var sound : Bool
    var answer : String
    var question : String
    var multipleChoice : [String]
    
    init(question : String, multipleChoice : [String], answer : String, sound : Bool) {
        self.sound = sound
        self.answer = answer
        self.question = question
        self.multipleChoice = multipleChoice
    }
    
}

