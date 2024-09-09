import UIKit

func subStringsBetween(_ origin: String, first: String, second: String) -> [String] {
    var results = [String]()
    var searchRange = origin.startIndex..<origin.endIndex
    
    while let firstRange = origin.range(of: first, options: [], range: searchRange),
          let secondRange = origin.range(of: second, options: [], range: firstRange.upperBound..<origin.endIndex) {
        
        let substring = String(origin[firstRange.upperBound..<secondRange.lowerBound])
        results.append(substring)
        
        // 다음 검색 범위를 갱신해 반복
        searchRange = secondRange.upperBound..<origin.endIndex
    }
    
    return results
}

// 함수 호출 예시
let testString = """
<html>
<head>
    <title>Sample HTML</title>
</head>
<body>
    <h1>Hello World</h1>
    <h1>Hi World</h1>
    <h1>Good World</h1>
</body>
</html>
"""
let substrings = subStringsBetween(testString, first: "<h1>", second: "</h1>")
print(substrings)
