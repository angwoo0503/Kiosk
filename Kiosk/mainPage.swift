//
//  menuPage.swift
//  Kiosk
//
//  Created by 요시킴 on 2023/07/25.
//

import Foundation

enum Categories: String, CaseIterable {
    case burger = "버거"
    case chicken = "치킨"
    case side = "사이드"
    case beverage = "음료"
}

class Menupage {
    let menuList =  "[ KFC 스파르타점 메뉴 ]"
}
let menuPage = Menupage()

class CategoriesListInfo {
    var categoriesInfo: String
    init(categoriesInfo: String) {
        self.categoriesInfo = categoriesInfo
    }
}

enum CategoriesInformation: String, CaseIterable {
    case burgerInformation = "부드러운 통닭다리살, 시크릿 소스, 아삭한 양상추 가 들어있는 치킨버거"
    case chickenInformation = "커넬샌더스가 개발한 11가지 비밀양념에 고압쿠킹 방식으로 육즙이 살아있어 촉촉하고 담백한 KFC 오리지널 치킨"
    case sideInformation = "샐러드, 코울슬로, 비스켓, 비스켓, 버터등 사이드메뉴"
    case beverageInformation = "속까지 시원해지는 청량한 탄산과 카페"
    case programSystem = "프로그램 종료"
}

let categoriesList = Categories.allCases.map { $0.rawValue }
let categoriesInforList = CategoriesInformation.allCases.map { $0.rawValue }

var categoriesInfo = [
    [categoriesList[0]: categoriesInforList[0]],
    [categoriesList[1]: categoriesInforList[1]],
    [categoriesList[2]: categoriesInforList[2]],
    [categoriesList[3]: categoriesInforList[3]]
]
print(categoriesInfo)

func categoriesPagePrint() {
    print("------------------------------------------\n")
    print("KFC 스파르타점에 오신걸 환영합니다.\n아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.\n")
    print(menuPage.menuList)
    for (index, categoryInfo) in categoriesInfo.enumerated() {
        let categoryNumber = index + 1
        
        for (category, info) in categoryInfo {
            print("\(categoryNumber). \(category) | \(info)")
        }
    }
    print("0. 종료 | 프로그램 종료")
}

categoriesPagePrint()

