

enum OrderError: Error {
    case mainPageError
    case detailMenuPageError
    case orderCheckPageError
    case cartPageError
    case orderPageError

    var localizedDescription: String {
        switch self {
        case .mainPageError:
            return "메인 페이지 에러 : 유효하지 않은 입력값입니다."
        case .detailMenuPageError:
            return "상세 메뉴 페이지 에러 : 유효하지 않은 입력값입니다."
        case .orderCheckPageError:
            return "장바구니 추가 페이지 에러 : 유효하지 않은 입력값입니다."
        case .cartPageError:
            return "장바구니 페이지 에러 : 유효하지 않은 입력값입니다."
        case .orderPageError:
            return "주문 페이지 에러 : 유효하지 않은 입력값입니다."
        }
    }
}
