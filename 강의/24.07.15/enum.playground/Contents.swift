enum Country: Int {
    case ARG = 54
    case COL = 57
    case GBR = 44
    case USA = 1
    case ESP = 34
}

// ARG값의 원시값 보기
print(Country.ARG.rawValue) // 54

// 원시값이 34인 나라값 있는지 살펴보기
if let country: Country = Country(rawValue: 34) {
    print(country) // ESP
} else {
    print("해당 국가 없음")
}

// 존재하지 않으면 nil로 처리됨
if let country: Country = Country(rawValue: 134) {
    print(country) // ESP
} else {
    print("해당 국가 없음") // 해당 국가 없음
}
