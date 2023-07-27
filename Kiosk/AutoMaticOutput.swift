import Foundation

// waitingList_now 고객대기수이며 주문 성공 시 +1 추가 디폴트 0으로 설정
var waitingListNow : Int = 0
// roopTime_Want 원하는 루프타임 설정 디폴트 5로 설정
var roopTimeWant : Int = 10
var roopCount : Int = 100

class AutoMaticOutput {
  var waitingList : Int
  var roopTime : Int
  var timer: Timer?
  var count = 0

  init(roopTime: Int, waitingList: Int) {
    self.roopTime = roopTime
    self.waitingList = waitingList
  }

  func start() {
    let queue = DispatchQueue(label: "com.example.myQueue")
    queue.async {
      self.timer = Timer(timeInterval: TimeInterval(self.roopTime), repeats: true) { [self] _ in
        print("""
                                                            -------------------------------------------
                                                            현재 대기 중인 주문은 \(Int(waitingList))건 입니다.
                                                            -------------------------------------------
        """)
        self.count += 1
        if self.count >= roopCount {
            self.end()
        }
      }
      RunLoop.current.add(self.timer!, forMode: .default)
      RunLoop.current.run()
    }
  }
    func end() {
      timer?.invalidate()
      timer = nil
    }
}
