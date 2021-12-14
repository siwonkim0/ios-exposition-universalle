import Foundation

class DataModel {
    static let itemsShared = JsonParser.decodeData(of: "items", how: Exposition.self)
    static let expositionShared = JsonParser.decodeData(of: "exposition_universelle_1900", how: [Exposition].self)
    
    private init() {}
}

//
//1. 뷰컨이 쪽지로 알고있다. 뷰컨이 매번 데이터 파일에 접근
//2. 데이터를 다 전달해주는 방법
//3. 전역으로 존재하는 데이터 하나를 만들고, 각각의 뷰컨이 필요한 정보를 쓴다.
//
