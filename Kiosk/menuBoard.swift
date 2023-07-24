//
//  class.swift
//  Kiosk
//
//  Created by 서영덕 on 2023/07/24.
//

import Foundation


class Menu {
    var menu_Name : String
    var menu_Cost : Int
    var menu_Info : String
    
    init(menu_Name: String, menu_Cost: Int, menu_Info: String) {
        self.menu_Name = menu_Name
        self.menu_Cost = menu_Cost
        self.menu_Info = menu_Info
    }
}

var menu_Board = [
    "001" : Menu(menu_Name: "타워버거", menu_Cost: 6_300, menu_Info: "두툼한 통가슴살 필렛과 해시브라운, 슬라이스 치즈까지 KFC 시그니처 버거") ,
    "002" : Menu(menu_Name: "징거버거", menu_Cost: 5_500, menu_Info: "더 커진 닭가슴살필렛과 상큼한 토마토가 어우러진 대표 치킨버거") ,
    "003" : Menu(menu_Name: "캡새버거", menu_Cost: 4_300, menu_Info: "탱글탱글한 새우살이 콕콕 그 새우버거가 KFC에서 더 맛있게 나왔새우"),
    "004" : Menu(menu_Name: "핫크리스피치킨", menu_Cost: 3_000, menu_Info: "KFC만의 비법으로 매콤 바삭하게 튀겨낸 KFC 핫크리스피치킨"),
    "005" : Menu(menu_Name: "갓양념치킨", menu_Cost: 3_300, menu_Info: "달콤 매콤, 먹을수록 땡기는 맵달의 조화 한국인 입맛에 딱 맞춘 환상의 양념치킨"),
    "006" : Menu(menu_Name: "뉴갓쏘이치킨", menu_Cost: 3_300, menu_Info: "육즙 가득 바삭한 치킨과 KFC 비법 간장소스가 만났다!"),
    "007" : Menu(menu_Name: "케이준후라이", menu_Cost: 2_800, menu_Info: "케이준 양념으로 더욱 고소하고 바삭해진 KFC 케이준후라이"),
    "008" : Menu(menu_Name: "코울슬로", menu_Cost: 2_000, menu_Info: "양배추와 당근, 각종 신선한 야채를 상큼하게 버무린 샐러드"),
    "009" : Menu(menu_Name: "코카콜라", menu_Cost: 2_000, menu_Info: "속까지 시원해지는 청량음료의 대표! 콜라"),
    "010" : Menu(menu_Name: "스프라이트", menu_Cost: 2_000, menu_Info: "속까지 시원해지는 청량음료 스프라이트!")
]



class MenuPrint {
    func printMenuBoard(menu_Board: [String: Menu]) {
        print("-------------------")
        print("\n메뉴판\n")
        let menuBoardKeys = menu_Board.keys.sorted()
        for key in menuBoardKeys {
            if let value = menu_Board[key] {
                print("제품번호: \(key)")
                print("상품명: \(value.menu_Name)")
                print("가격: \(value.menu_Cost)")
                print("상품정보: \(value.menu_Info)\n")
            }
        }
        print("-------------------")
    }
}


/* 실행 하시려면 이렇게 실행하시면 됩니다!
 
 let menuPrint = MenuPrint()
 menuPrint.printMenuBoard(menu_Board: menu_Board)
 
 */





