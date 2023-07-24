//
//  payment.swift
//  Kiosk
//
//  Created by 서영덕 on 2023/07/24.
//

import Foundation


// 은행 점검 시간


let bankCheckStartTime : String = "23:10:00"
let bankCheckEndTime : String = "23:20:00"


//결제 시
// 현재 시간이 "23:10:00" ~ "23:20:00" 사이면 "지금은 은행 점검 시간입니다."를 반환하는 함수입니다.

func bankCheck() -> String {
     if bankCheckStartTime <= nowTime &&
            nowTime <= bankCheckEndTime {
        return "지금은 은행 점검 시간입니다."
    } else {
        return "정상결제"
    }
}

/*

실행하고 싶을 때
 
print(bankCheck())

*/


/*
 
 이 함수를 그대로 쓸 수는 없을 것 같고
 반복문 안에 예를 들면
 switch bankCheckStartTime <= nowTime &&
 nowTime <= bankCheckEndTime {
 
 case 1 : print("지금은 은행 점검 시간입니다.")
 case 2 : print("결제 진행 중")
 
 요런식으로 사용하면 되지 않을까 생각합니다.
 
 }
 
 
 ps. 예제의 구문은 정말 예시로 적은거라 문법에 어긋날수도 있습니다.
 
 */
