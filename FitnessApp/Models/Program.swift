import Foundation

struct Program {
    
    let title: String
    let calories: Int
    let image: String
    let duration: Int
    let excercises: [Excercise]
}

extension Program {
    
    static let beginnerMockProgram = Program(title: "Beginner", calories: 100, image: "lady-junge", duration: 1, excercises: [
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise
    ])
    
    static let intermediateMockProgram = Program(title: "Intermediate", calories: 200, image: "lady-jump", duration: 2, excercises: [
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise,
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise
    ])
    
    static let advancedMockProgram = Program(title: "Advanced", calories: 300, image: "lady-stretch", duration: 3, excercises: [
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise,
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise,
        Excercise.mockPushupExcercise,
        Excercise.mockJumpingJackExcercise
    ])
}
