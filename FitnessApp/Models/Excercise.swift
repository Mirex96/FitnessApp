import Foundation

struct Excercise {
    
    let name: String
    let animation: String
    let duration: Int
    
}

extension Excercise {
    static let mockJumpingJackExcercise = Excercise(name: "Jumping Jack", animation: "jumpingjack", duration: 15)
    static let mockPushupExcercise = Excercise(name: "Push Up", animation: "pushups", duration: 15)

}
