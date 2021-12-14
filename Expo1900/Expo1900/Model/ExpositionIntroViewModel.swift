import UIKit

struct ExpositionIntroViewModel {
    let exposition: Exposition = DataModel.itemsShared
    
    var title: String
    var image: UIImage
    var visitors: String
    var location: String
    var duration: String
    var description: String
    
    
    init(title: String = "", image: UIImage = UIImage(), visitors: String = "", location: String = "", duration: String = "", description: String = "") {
        self.title = title
        self.image = image
        self.visitors = visitors
        self.location = location
        self.duration = duration
        self.description = description
        
    }
    
    mutating func setUpData() {
        title = exposition.title.replacingOccurrences(of: "(", with: "\n(")
        visitors = "방문객 : " + exposition.visitor + "명"
        location = "개최지 : " + exposition.location
        duration = "개최 기간 : " + exposition.duration
        description = exposition.description
        image = UIImage(named: "poster")!
    }
    
   
}
