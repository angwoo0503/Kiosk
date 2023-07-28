import Foundation

class ReadIntFromConsole {
    func readIntFromConsole() -> Int? {
        // 사용자로부터 입력 받기
        guard let input = readLine() else {
            return nil // 입력이 없을 경우 nil 반환
        }
        
        // 입력된 문자열을 Int로 변환
        guard let intValue = Int(input) else {
            return nil // 변환 실패 시 nil 반환
        }
        
        return intValue // 변환된 Int 값 반환
    }
}
