//
//  main.swift
//  Kiosk
//
//  Created by t2023-m0061 on 2023/07/24.
//

import Foundation




// 한국 시간 (요것이 main에 적어야만 작동이 되는 것 같습니다. payment 파일에 작성하니 상위 권한이 있는 파일에 적으라고 오류가 나네용)

let now = Date()
let koreaTime = DateFormatter()
koreaTime.dateFormat = "HH:mm:ss"
koreaTime.timeZone = TimeZone(identifier: "Asia/Seoul")
let nowTime = koreaTime.string(from: now)





var orderManager = OrderManager(myMoney: 10000)
orderManager.mainPage()

    










