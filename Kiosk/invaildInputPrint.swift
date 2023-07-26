import Foundation

protocol InvaildInputPrint {
    func printErrorMessage()
}

extension InvaildInputPrint {
    func printErrorMessage() {
        print("------------------------------------------")
        print("잘못된 번호를 입력했어요. 다시 입력해주세요.")
        print("------------------------------------------")
    }
}
