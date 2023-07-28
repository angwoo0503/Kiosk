

enum OrderError: Error {
    case inputIntError
    case inputStringError
    
    var errorDescription: String {
        switch self {
        case .inputIntError :
            return "올바른 번호를 입력해주세요."
        case . inputStringError :
            return "잘못된 입력입니다. 숫자를 입력해주세요."
        }
    }
}
