import SwiftUI

struct SingleQuizCollections : View {
    
    @State var quiz : SingleTopicQuiz
    @State private var progress: Float = 0.0
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body : some View {
        VStack {
            
            VStack {
                if !quiz.overView() {
                    Text("Your Score")
                        .font(.title)
                        .foregroundColor(.brown)
                    
                    Text("\(quiz.totalScore()) out of \(quiz.quizzQuestionCount())")
                        .font(.title3)
                        .foregroundColor(.brown)
                }
            }
            
            Spacer()
            
            VStack {
                VStack(alignment: .leading,spacing: 5) {
                    
                    if quiz.overView() {
                        let score = quiz.totalScore()
                        let total = quiz.quizzQuestionCount()
        
                        Text("Congrations! You finished quiz.You got \(score) out of \(total).")
                            .font(.system(size:25))
                            .padding(10)
                            .lineSpacing(3)
                    } else {
                        Text(quiz.getQuestionText())
                            .font(.system(size:25))
                            .padding(10)
                            .lineSpacing(3)
                    }
                    
                }
                .foregroundColor(.brown)
                .padding(15)
            }
            
            Spacer()
            
            VStack {
                
                ForEach(Array(quiz.quizAnswerButton().enumerated()), id: \.offset) { index, question in
                    Button(action: {
                        let userAnswer = question
                        let result = quiz.checkUserAnswer(userAnswer)
                        
                        if result {
                            quiz.audioPlay(sound: "C")
                        } else {
                            quiz.audioPlay(sound: "W")
                        }
                        
                        quiz.quizNextQuestion()
                        progress = quiz.showProgress()
                    }) {
                        HStack {
                            Spacer()
                            Text(question)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding()
                        .background(.brown)
                        .cornerRadius(10)
                        .frame(width: 280, height: 50, alignment: .center)
                    }
                    
                    if quiz.overView() {
                        Button(action : {
                            presentationMode.wrappedValue.dismiss()
                        })
                        {
                            HStack {
                                Spacer()
                                Text("Done")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .padding()
                            .background(.brown)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50, alignment: .center)
                        }
                    }
                }
                
                VStack {
                    ProgressView(value: progress)
                        .padding()
                }
            }
            
        }
    }
}



