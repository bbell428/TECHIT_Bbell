var kboLeagueTable: [String: Double] = [
    "KIA": 0.598,
    "LG": 0.541,
    "두산": 0.541,
    "삼성": 0.530
]

// 기존에 존재하는 key의 값을 업데이트해봅시다
kboLeagueTable["KIA"] = 0.599
print(kboLeagueTable)

// 새로운 key의 값을 언급하면, 추가됩니다!
kboLeagueTable["SSG"] = 0.500
print(kboLeagueTable)

// 키를 추가해봅시다
kboLeagueTable["최강몬스터즈"] = 0.700

// 키를 제거해봅시다
kboLeagueTable["최강몬스터즈"] = nil
print(kboLeagueTable)

for (team, wins) in kboLeagueTable {
    print("\(team)의 승률 \(wins)")
}
/*
 KIA의 승률 0.599
 두산의 승률 0.541
 SSG의 승률 0.5
 삼성의 승률 0.53
 LG의 승률 0.541
 */
