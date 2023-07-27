import Foundation

class AutoMaticOutput {
    var waitingList : [Int] = Array(1...10)
    var roopTime : Int
    var timer: Timer?
    
    init(roopTime: Int) {
        self.roopTime = roopTime
    }
    
    func start() {
        
        let queue = DispatchQueue(label: "com.example.myQueue")
        
        queue.async {
            let timer = Timer(timeInterval: TimeInterval(self.roopTime), repeats: true) { [self] _ in
        print("현재 대기 중인 주문은 \(Int(waitingList.randomElement() ?? 0))건 입니다.")
        }
        RunLoop.current.add(timer, forMode: .default)
        RunLoop.current.run()
        }
    }
}
