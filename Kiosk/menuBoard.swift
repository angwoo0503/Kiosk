//
//  class.swift
//  Kiosk
//
//  Created by 서영덕 on 2023/07/24.
//

import Foundation

enum Categories: String, CaseIterable {
    case burger = "버거"
    case chicken = "치킨"
    case side = "사이드"
    case beverage = "음료"
}

class Menu {
    var menu_Name: String
    var menu_Cost: Int
    var menu_Info: String
    
    init(menu_Name: String, menu_Cost: Int, menu_Info: String) {
        self.menu_Name = menu_Name
        self.menu_Cost = menu_Cost
        self.menu_Info = menu_Info
    }
}

var menu_Burger = [
    1 : Menu(menu_Name: "타워버거", menu_Cost: 6_300, menu_Info: "두툼한 통가슴살 필렛과 해시브라운, 슬라이스 치즈까지 KFC 시그니처 버거"),
    2 : Menu(menu_Name: "징거버거", menu_Cost: 5_500, menu_Info: "더 커진 닭가슴살필렛과 상큼한 토마토가 어우러진 대표 치킨버거"),
    3 : Menu(menu_Name: "캡새버거", menu_Cost: 4_300, menu_Info: "탱글탱글한 새우살이 콕콕 그 새우버거가 KFC에서 더 맛있게 나왔새우")
]

var menu_Chicken = [
    1 : Menu(menu_Name: "핫크리스피치킨", menu_Cost: 3_000, menu_Info: "KFC만의 비법으로 매콤 바삭하게 튀겨낸 KFC 핫크리스피치킨"),
    2 : Menu(menu_Name: "갓양념치킨", menu_Cost: 3_300, menu_Info: "달콤 매콤, 먹을수록 땡기는 맵달의 조화 한국인 입맛에 딱 맞춘 환상의 양념치킨"),
    3 : Menu(menu_Name: "뉴갓쏘이치킨", menu_Cost: 3_300, menu_Info: "육즙 가득 바삭한 치킨과 KFC 비법 간장소스가 만났다!")
]

var menu_Side = [
    1 : Menu(menu_Name: "케이준후라이", menu_Cost: 2_800, menu_Info: "케이준 양념으로 더욱 고소하고 바삭해진 KFC 케이준후라이"),
    2 : Menu(menu_Name: "코울슬로", menu_Cost: 2_000, menu_Info: "양배추와 당근, 각종 신선한 야채를 상큼하게 버무린 샐러드")
]

var menu_Beverage = [
    1 : Menu(menu_Name: "코카콜라", menu_Cost: 2_000, menu_Info: "속까지 시원해지는 청량음료의 대표! 콜라"),
    2 : Menu(menu_Name: "스프라이트", menu_Cost: 2_000, menu_Info: "속까지 시원해지는 청량음료 스프라이트!")
]

var menus: [Categories: [Int : Menu]] = [.burger: menu_Burger, .chicken: menu_Chicken, .side: menu_Side, .beverage: menu_Beverage]











class MenuPrint {

    
    
    
    func printMenuBoard(category: String, menu_Board: [Int : Menu]) {
        print("------------------------------------------")
        print("\n\(category) 메뉴판\n")
        let menuBoardKeys = menu_Board.keys.sorted()
        for key in menuBoardKeys {
            if let value = menu_Board[key] {
                // 가격 천단위 , 적용
                let costStyle = NumberFormatter()
                costStyle.numberStyle = .decimal
                let kfcCost = costStyle.string(from: NSNumber(value:  value.menu_Cost)) ?? ""
                print("\(key) | \(value.menu_Name) | W: \(kfcCost) | \(value.menu_Info)\n")
            }
        }
        print("")
    }
}





 
//카테고리 버거 선택 시 ↓
 

 
// let menuPrint = MenuPrint()
//menuPrint.printMenuBoard(category: "버거", menu_Board: menu_Burger)
 

 

//카테고리 치킨 선택 시 ↓
 
/*
 
 let menuPrint = MenuPrint()
menuPrint.printMenuBoard(category: "치킨", menu_Board: menu_Chicken)
 
 */
 

//카테고리 사이드 선택 시 ↓
 
/*
 
 let menuPrint = MenuPrint()
menuPrint.printMenuBoard(category: "사이드", menu_Board: menu_Side)
 
 */

//카테고리 음료 선택 시 ↓
 
/*
 
 let menuPrint = MenuPrint()
menuPrint.printMenuBoard(category: "음료", menu_Board: menu_Beverage)
 
 */















