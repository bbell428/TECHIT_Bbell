var names: [String] = ["KIA", "삼성", "LG", "두산", "SSG", "NC", "KT", "한화", "롯데", "키움"]

// sorted, map, filter, reduce, foreach
var result: [String] = names.map { name in
    return "\(name) 야구단"
}

print(result)
// ["KIA 야구단", "삼성 야구단", "LG 야구단", "두산 야구단", "SSG 야구단", "NC 야구단", "KT 야구단", "한화 야구단", "롯데 야구단", "키움 야구단"]

names.forEach { name in
    print("\(name) 야구팀 화이팅!")
}
/*
 KIA 야구팀 화이팅!
 삼성 야구팀 화이팅!
 LG 야구팀 화이팅!
 두산 야구팀 화이팅!
 SSG 야구팀 화이팅!
 NC 야구팀 화이팅!
 KT 야구팀 화이팅!
 한화 야구팀 화이팅!
 롯데 야구팀 화이팅!
 키움 야구팀 화이팅!
 */

var teams: [String] = names.filter { name in
    return name < "가"
}

print(teams)
// ["KIA", "LG", "SSG", "NC", "KT"]
