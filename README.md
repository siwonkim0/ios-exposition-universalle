# iOS 만국 박람회


### 동작 영상

| 만국박람회 인트로 | 
| -------- |
| ![example1](https://user-images.githubusercontent.com/25794814/146667223-ed716e00-3981-49bf-871a-eec884b365c9.gif) |

| Dynamic Type 접근성 지원 |
| -------- |
|![example2](https://user-images.githubusercontent.com/25794814/146667268-73c1ddf0-a2ff-459c-ae09-bb70fbcd54fb.gif)  |


### 그라운드 룰 
모든 팀원이 참여하는 것과 같은 기본적인 규칙 이외의 우리 팀만의 규칙을 정해요!)

프로젝트에 집중하는 시간

- 오전 10시 ~ 저녁 7시 (필요 시 30분 정도 조정 가능)
- 밥먹는 시간 : 1시간 ~ 1시간 30분 소요 (여유있게)
- 공식적인 휴일 : 주말!

TIL, 일일회고

- 저녁 11시 이후 ~ 저녁 12시 이후에 각자 합니다.

규칙

- **모르거나 새로운 개념**을 적용하고, 배우고 싶을 때 시간을 주세요!
- 기계적으로 동작하는 원리보다는 큰 그림 **(추상화된 영역, 컨셉)**
- 긴 호흡 보다는 정리된 말로 커뮤니케이션 해봅시다!
- 커뮤니케이션을 진행할 때 편하고 적극적으로 표현해주세요!
- 페어 프로그래밍 커밋 단위(함수를 구현, 기능 구현)로! 최대한 지켜기
- 깃허브 프로젝트 계획 관리를 도전 (깃허브 이슈, 마일스톤!)
- 깃허브 스텝별로 브랜치 나누는 규칙 적용!
- 공부한 것 기록은 바로바로 하기

---

## 핵심 개념

### JSONDecoder 

* Codable
* CodingKey
* NSDataAsset
* Meta Type

### TableView

* DataSource 프로토콜
* tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
* tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

### AutoLayout
* Scroll View
    * Content Layout Guide
    * Frame Layout Guide


## 알게된 부분 

### 섹션의 수가 하나일때 `numberOfSections(in:)`` 함수를 지우는것보다 1로 명시하기
    * 공식문서 : ‘The first method that will be called is numberOfSections(in:). EmojiDictionary will have one section, so delete the comment inside the body of the method and return 1. ’

### 특정 화면에서만 네비게이션바를 비활성화 하는 방법 
```swift
self.navigationController?.isNavigationBarHidden = true
```

* ViewLifeCycle

![](https://i.imgur.com/91IyGCT.jpg)

특정 뷰에서만 띄어지는 부분(예를 들면 네이게이션바의 활성화 비활성화, 화면의 가로세로 설정)
을 설정할 때 이전에 배웠던 `viewLifeCycle`을 이용하면 유용하다고 생각했다. 

### Meta Type

- Self는 언제 어떤 의미를 나타내나요? (deocde가 누구의 메서드이고, 그 누구에서 Self는 무엇을 의미할까요?)
    - `Self` 구체적인 타입이 아닌 class, structure, enum 등의 타입을 선언부 안쪽에서 현재 어떤 타입인지 편리하게 지칭할 수 있는 수단입니다.
    - decode 메서드는 Foundation 의 JSONDecoder 클래스에 구현된 인스턴스 메서드 입니다.
    - 따라서 decode 메서드 입장에서 Self 는 JSONDeccoder 타입을 의미합니다.
    
- 제네릭 인스턴스 메서드인 decode에서 언급해주신 T.Type이 의미하는 것은 무엇인가요?
    - decode 메서드의 T.Type 타입으로 받아오는 type 인자는 공급받은 JSON 객체로 부터 디코딩할 값의 타입을 지정해주는 역할을 합니다.
    - T는 decode가 제네릭 인스턴스 메서드이기 때문에 함수가 사용되는 시점에서 T가 의미하는 타입이 결정되도록하는 타입 파라미터입니다.
    - 클래스, 구조체, 열거형 타입의 메타 타입은 그 타입의 이름이며 `.Type` 이 뒤에 따릅니다.
    - 따라서 메타 타입이 들어와야 하기 때문에 변환시키고자하는 타입의 메타타입을 넘겨줘야합니다.
    - 따라서 Exposition.self, ExpositionItem.self 와 같은 코드를 통해 메타 타입을 얻어서 decoder 의 인자로 넣어줍니다.
    
- `GroceryProduct.self`에서 GroceryProduct는 타입이죠? `타입.self`가 나타내는 것은 무엇일까요?
    
    메타타입입니다. 
    
- 메타타입은 어떻게 얻을 수 있을까요?
    - 타입.self 사용
    - 인스턴스의 다이나믹 타입을 알려주는 type(of:) 메서드 사용




### `self` vs `Self'

#### self 
- 타입 내부(선언부)에서 자기 타입의 인스턴스를 지칭할 때
- 타입 선언부 밖에서 메타 타입을 "값"으로 접근하기 위해서 사용

#### Self 

- 타입 내부(선언부)에서 자기의 타입을 대신 지칭할 때

메타타입을 학습하기 전에 알고 있었던 `self` 와 `Self` 키워드의 개념은 self는 타입의 인스턴스를 지칭하고, Self는 타입 자체를 지칭한다는 것이었습니다.

그러나 메타타입은 타입.self 를 하면 그 타입의 인스턴스가 아니라 타입의 value 자체를 지칭한다고 하여 혼란이 왔습니다. 

예제 코드를 보니 타입 내부에서 쓰이는 self와 타입 외부에서 쓰이는 self가 다른 개념임을 깨달았습니다.

- 타입 내부에서 사용시

```swift
class Superclass {
    func f() -> Self { return self }
}

let x = Superclass()
print(type(of: x.f()))
// Prints "Superclass"
```

SuperClass 라는 클래스 내부에서 쓰인 Self는 자기 자신의 타입을 의미

self는 자기 자신의 인스턴스를 의미

- 타입 외부에서 사용시 → 메타 타입

메타타입이란 `타입.self`를 붙여서 타입 이름을 value 로 접근할 수 있게 하는 것 

```swift
class SomeBaseClass {
    class func printClassName() {
        
    }
}

class AnotherSubClass: SomeBaseClass {
    let string: String
    required init(string: String) {
        self.string = string
    }
    override class func printClassName() {
        print("AnotherSubClass")
    }
}

let metatype: AnotherSubClass.Type = AnotherSubClass.self
let anotherInstance = metatype.init(string: "some string")

print(metatype) //AnotherSubClass
print(anotherInstance) //__lldb_expr_34.AnotherSubClass

print(type(of: AnotherSubClass(string: "some string")) //AnotherSubClass
```

타입 외부에서 사용시 자신의 인스턴스를 의미하는 것이 아니라 자신의 타입 그자체를 의미한다는 사실을 알게 되었습니다. 

type(of: 인스턴스)를 사용해도 AnotherSubClass.self 와 동일하게 자신의 타입 그자체 == 메타타입을 의미합니다.

다이나믹 타입 = 런타임 타입
스태틱 타입 = 컴파일 타입

## 고민한 부분 

### JSONDecoder 사용시 키값을 다르게 디코딩하는 방법
JSONDecoder 공식문서를 보면서 JSON 파일의 key값과 우리가 변환하려는 타입의 프로퍼티명을 다르게 할수있는 Decoding 방식을 찾아보았습니다.

공식문서의 Topics 란에 Customizing Decoding 항목중에 keyDecodingStrategy 방식중에 Custom Decoding 방식인 `custom(([CodingKey]) -> CodingKey)` 사용해보려 했습니다. 

그러다가 적용에 실패하였고 더 검색을 해보다가 **Encoding and Decoding Custom Types** 라는 아티클을 발견하게 되어 거기서 소개된 방식인 **Choose Properties to Encode and Decode Using Coding Keys** 를 적용하여 문제를 해결하였습니다.

### Codable의 채택
지금 당장 Encodable의 기능이 필요하지 않은 상태에서 Codable보단 Decodable만 채택하는게 좋다고 생각하였습니다. SOLID의 인터페이스 분리의 원칙에 따라 인터페이스도 필요에 의한 한가지 책임을 지도록 해야한다고 생각하여 프로토콜을 채택할 객체가 굳이 Encodable이 필요하지 않은 상태이기 때문에 Decodable만 채택하도록 구현하였습니다.

### `ViewController` 끼리의 데이터 전달 방식

테이블 뷰에서 특정 셀이 클릭되었을 때 다음 화면에서 세부 정보를 보여주기위해 다음의 방법을 생각해보았습니다.

1. 각 VC가 NSDataAsset을 통해 직접 JSON 파일을 불러온 뒤에 필요한 정보를 화면에 보여주고, 세부 정보 화면이 보여줘야 하는 데이터 정보만 segue를 통해 전달 (예: 배열(데이터)의 인덱스를 전달)
3. 하나의 VC가 NSDataAsset을 통해 직접 JSON 파일을 로드하고 데이터 인스턴스를 다른 VC에게 주입해주는 방식
4. singleton을 통해 앱 전역에 존재하는 데이터를 구현해두고 두개의 VC가 동일한 데이터에 접근해서 필요한 정보만 보여주는 방식 

세가지 선택지 중에서 `1번`째를 선택하여 구현했습니다.

**그 이유로는**

매번 VC 가 데이터를 불러오고 파일 입출력을 사용하기 때문에 컴퓨팅 자원을 많이 소모하며 동일한 JSON 파일을 불러오는 코드가 중복으로 작성된다는 단점이 존재하지만, 

View 가 보여줘야 하는 자료의 근원이 JSON 파일 하나이기 때문에 파일이 변경될 경우 각 VC가 갱신된 정보를 불러올 수 있습니다.

또한 `3번` 방법인 singleton 인스턴스를 사용하여 데이터를 불러올 경우 공유 자원의 데이터에 대한 무결성을 보장하기 어려울 수 있다고 생각하였으며 화면이 전환되었을 때 불필요한 데이터가 메모리에 남아있지 않도록 구현하고자 3번을 선택지에서 제외시켰습니다.

`2번` 선택지의 경우 세부 화면에서 보여줘야 할 데이터보다 불필요하게 더 많은 데이터를 넘겨준다고 생각하여 선택지에서 제외시켰습니다.

**1번 방식을 스토리보드 segue를 사용하는 방식으로 구현**

셀과 다음VC를 segue로 연결한 후에 셀이 클릭되면 자동으로 호출되는 prepare메서드 안에서 segue.destination으로 다음VC를 불러온 후 클릭된 셀의 indexPath를 다음 VC의 프로퍼티에 할당하는 방식입니다. 
```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? KoreanArtWorkTableViewCell else { return }
       
        if let destinationVC = segue.destination as? aaaViewController {
            let id = tableView.indexPath(for: cell)?.row
            destinationVC.id = id
        }
        
    }


```
처음에는 1번 방식을 사용했으나 뷰모델의 데이터를 뷰컨트롤러에 가져와서 뷰에 맞게 업데이트할 때
뷰모델의 데이터를 세팅하는 기능과 UI를 업데이트하는 기능을 분리하기 위해 2, 3번의 방식도 생각해보았습니다. 

### `MVC패턴`에서 뷰의 데이터를 `ViewController`에 업데이트하는 방법

1. 메서드 사용하는 방식

```swift
private func updateUI() {
    var modelForMainView = ExpositionViewModel()
    modelForMainView.setUpData()
    expositionIntroTitleLabel.text = modelForMainView.title
    expositionIntroImageView.image = UIImage(named: modelForMainView.image)
    visitorCountLabel.text = modelForMainView.visitors
    locationLabel.text = modelForMainView.location
    durationLabel.text = modelForMainView.duration
    descriptionLabel.text = modelForMainView.description
}
```

2. 계산 프로퍼티 사용하는 방식

fetchedData라는 계산 프로퍼티를 만들어서 fetchedData에 접근할때마다 뷰모델의 인스턴스를 생성하여 데이터를 셋업하고 셋업한 데이터를 리턴해서 프로퍼티에 접근하는 방식을 생각해보았습니다.
-> 하지만 이 방식은 접근할때마다 데이터를 새로 불러와서 비효율적입니다. 

```swift
var fetchedData: ExpositionViewModel {
    var modelForMainView = ExpositionViewModel()
    modelForMainView.setUpData()
    return modelForMainView
}

override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
}

private func updateUI() {
    expositionIntroTitleLabel.text = fetchedData.title
    expositionIntroImageView.image = UIImage(named: fetchedData.image)
    visitorCountLabel.text = fetchedData.visitors
    locationLabel.text = fetchedData.location
    durationLabel.text = fetchedData.duration
    descriptionLabel.text = fetchedData.description
}
```

3. 프로퍼티 옵져버 사용하는 방식

프로퍼티 옵져버를 사용하면 모델이 가진 데이터가 변하면 모델이 변하고,
뷰컨의 프로퍼티옵져버가 모델이 변하는 것을 감지해서 뷰컨의 modelForMainView 프로퍼티가 변합니다.
이 방식은 데이터가 변할때만 프로퍼티가 변한다는 점에서 2번 방법보다 효율적인 방법이라고 생각하여 이 방법으로 리팩토링하였습니다.

```swift
var modelForMainView = ExpositionViewModel() {
    didSet {
        updateUI()
    }
}

override func viewDidLoad() {
    super.viewDidLoad()
    modelForMainView.setUpData()
}

private func updateUI() {
    expositionIntroTitleLabel.text = modelForMainView.title
    expositionIntroImageView.image = UIImage(named: modelForMainView.image)
    visitorCountLabel.text = modelForMainView.visitors
    locationLabel.text = modelForMainView.location
    durationLabel.text = modelForMainView.duration
    descriptionLabel.text = modelForMainView.description
}
```



### 대부분의 뷰컨트롤러에서 사용되는 `decodeData`메서드의 구현방식 

1. enum JSONParser: decodeData()를 static 메서드로 구현
2. class JSONParser: 싱글턴 class에 디코딩된 데이터 자체를 구현
3. struct JSONParser **:** 각 뷰컨에서 인스턴스를 생성해서 인스턴스 메서드인 decodeData() 메서드를 실행하도록 구현




#### 1. enum JSONParser: decodeData()를 static 메서드로 구현

```swift
enum JsonParser {
    static func decodeData<T: Decodable>(of dataName: String, how: T.Type) -> T {
        guard let data = NSDataAsset(name: dataName) else {
            fatalError()
        }
        
     
```

지금 저희의 만국박람회 프로젝트에서는 모든 화면이 decode 된 데이터를 불러오는 작업이 필요합니다.

따라서.. 인스턴스를 각각의 뷰컨트롤러에서 생성하여 인스턴스 메서드를 불러오는 방향보다는 static메서드를 통하여 따로 인스턴스 생성없이 decode를 바로 해주는 전역함수를 생성하면 사용에 용이할 것 같습니다. 

#### 2. class JSONParser: 싱글턴 class에 디코딩된 데이터 자체를 구현

```swift
class DataModel {
    static let itemsShared = JsonParser.decodeData(of: "items", how: Exposition.self)
    static let expositionShared = JsonParser.decodeData(of: "exposition_universelle_1900", how: [Exposition].self)

    private init() {}
}
```

```swift
let data = DataModel.itemsShared
```

enum 안의 static 메서드로 decodeData가 떠다니는 것과 데이터 자체가 데이터영역에 남아있는것과의 비용차리를 고려해봤을때, 이러한 작은 프로젝트에서는 상관없다고 생각하고 한번 이렇게 디코드된 데이터를 남겨놓으면 어디서든 불러올 수 있다고 생각했습니다. 하지만, 프로젝트가 확장된다면 static 메서드로 어디서든 전역적으로 사용할 수 있는게 훨씬 좋은 방법일수도 있겠다는 생각이 들었습니다.
 

#### 3. struct JSONParser **:** 각 뷰컨에서 인스턴스를 생성해서 인스턴스 메서드인 decodeData() 메서드를 실행하도록 구현

```swift
struct JSONParser<T: Decodable> {
    func decodeData(of dataName: String) -> T? {
        guard let data = NSDataAsset(name: dataName) else { return nil }
        
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(T.self, from: data.data)
        
        return decodedData
    }
}
```

```swift
guard let data = JSONParser<Exposition>().decodeData(of: expositionIdentifier) else { return }
```

#### 고민의 결과

데이터 영역에 데이터나 메서드가 사용하지 않게 되더라도 남아있는 1, 2번 방식과는 다르게 사용할 때만 인스턴스를 생성하는 방식도 나쁘지 않겠다는 생각이 들었습니다. 하지만 이 방법 역시 매번 인스턴스를 생성하는 비용이 들고, `decode`된 데이터 전체가 데이터 영역에 남아있는 것 보다는 여러 객체에서 사용되는 재사용성이 높은 함수를 전역적으로 선언해준 2번의 방법인 static 메서드로 결정했습니다.


### 에러처리
```swift
enum JSONParser {
    static func decodeData<T: Decodable>(of dataName: String, type: T.Type) **-> Result<T, Error>** {
        guard let assetFile = NSDataAsset(name: dataName) else { return .failure(.dataNotExist) }
        
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(type, from: assetFile.data) else { return .failure(.decodeFailure) } //에러 핸들링을 하지않고잇음 실패햇다고만 퉁치는중
        
        return .success(decodedData)
    }
    
    enum Error: LocalizedError {
        case dataNotExist
        case decodeFailure
        
        var errorDescription: String? {
            switch self {
            case .decodeFailure:
                return "데이터가 존재하지 않습니다."
            case .dataNotExist:
                return "데이터를 JSON으로 decode 하는 과정에서 실패하였습니다."
            }
        }
    }
}
```

```swift
let expositionIdentifier = "exposition_universelle_1900"
let result = JSONParser.decodeData(of: expositionIdentifier, type: Exposition.self)

switch result {
case .success(let data):
    self.exposition = data
default:
    self.exposition = Exposition()
```

result 타입을 사용하여 성공하는 경우 성공적으로 디코딩된 데이터를 연관값으로 넘겨줘서 뷰컨트롤러의 프로퍼티에 값을 넣고, 실패하는 경우 기본값을 주는 방식으로 구현했습니다. 
