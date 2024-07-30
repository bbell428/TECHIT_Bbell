//
//  MemberManager.swift
//  CountryWannaGo
//
//  Created by 홍재민 on 7/30/24.
//

import Foundation

class MemberManager: NSObject {
    static let instance: MemberManager = MemberManager()
    private var members: [Member] = [
        //1조
        Member(name: "홍재민", countryInfo: CountryInfo(name: "미국", flag: "🇺🇸", capital: "워싱턴", greeting: "Hi!")),
        Member(name: "강승우", countryInfo: CountryInfo(name: "스페인", flag: "🇪🇸", capital: "마드리드", greeting: "hola")),
        Member(name: "이주노", countryInfo: CountryInfo(name: "그리스 ", flag: "🇬🇷", capital: " 아테네", greeting: "γεια σας")),
        Member(name: "김종혁", countryInfo: CountryInfo(name: "영국", flag: "🇬🇧", capital: "런던", greeting: "Hi")),
        //2조
        Member(name: "김수민", countryInfo: CountryInfo(name: "미국", flag: "🇺🇸", capital: "워싱턴DC ", greeting: "hi")),
        Member(name: "김효정", countryInfo: CountryInfo(name: "호주", flag: "🇦🇺", capital: "캔버라 ", greeting: "Hello")),
        Member(name: "이소영", countryInfo: CountryInfo(name: "스페인", flag: "🇪🇸", capital: "마드리드 ", greeting: "Hola")),
        Member(name: "최승호", countryInfo: CountryInfo(name: "일본", flag: "🇯🇵", capital: "도쿄 ", greeting: "こんにちは")),
        Member(name: "황인영", countryInfo: CountryInfo(name: "대만", flag: "🇹🇼", capital: "타이페이 ", greeting: "Nihao")),
        //3조
        Member(name: " 김정원", countryInfo: CountryInfo(name: " 호주", flag: "🇦🇺", capital: "캔버라", greeting: "hi")),
         Member(name: " 김승철", countryInfo: CountryInfo(name: " 아이슬랜드", flag: "🇮🇸", capital: "레이캬비크", greeting: "HallÓ")),
        Member(name: " 홍지수", countryInfo: CountryInfo(name: " 미국", flag: "🇺🇸", capital: "워싱턴 D.C", greeting: "Hello")),
        //4조
        Member(name: "구영진", countryInfo: CountryInfo(name: "몰디브", flag: "🇲🇻", capital: "말레", greeting: "Assalamu Alaikum")),
        Member(name: "박준영", countryInfo: CountryInfo(name: "독일", flag: "🇩🇪", capital: "베를린", greeting: "Hallo!")),
        Member(name: "심현정", countryInfo: CountryInfo(name: "스웨덴", flag: "🇸🇪", capital: "스톡홀름", greeting: "Hej")),
        Member(name: "이다영", countryInfo: CountryInfo(name: "스페인", flag: "🇪🇸", capital: "마드리드", greeting: "Mucho gusto")),
        //5조
        Member(name: "김동경", countryInfo: CountryInfo(name: "스위스", flag: "🇨🇭", capital: "베른", greeting: "Bonjour")),
        Member(name: "김원호", countryInfo: CountryInfo(name: "미국", flag: "🇺🇸", capital: "워싱턴 D.C.", greeting: "hello")),
        Member(name: "권희철", countryInfo: CountryInfo(name: "독일", flag: "🇩🇪", capital: "베를린", greeting: "Guten Morgen")),
        Member(name: "배문성", countryInfo: CountryInfo(name: "오스트리아", flag: "🇦🇹", capital: "빈", greeting: "Grüß Gott, Guten Morgen")),
        Member(name: "박범규", countryInfo: CountryInfo(name: "프랑스", flag: "🇫🇷", capital: "파리", greeting: "Bonjour")),
        //6조
        Member(name: "강희창", countryInfo: CountryInfo(name: "아르헨티나", flag: "🇦🇷", capital: "부에노스아이레스", greeting: "Hola!")),
        Member(name: "김수은", countryInfo: CountryInfo(name: "스위스", flag: "🇨🇭", capital: "베른", greeting: "Salut!")),
        Member(name: "신현우", countryInfo: CountryInfo(name: "일본", flag: "🇯🇵", capital: "도쿄", greeting: "おはよう!")),
        Member(name: "이정민", countryInfo: CountryInfo(name: "프랑스", flag: "🇫🇷", capital: "파리", greeting: "Bonjour!"))
    ]
    @objc dynamic private(set) var selectedMemberIndex: Int = -1
    
    var selectedMember: Member? {
        selectedMemberIndex > -1 ? members[selectedMemberIndex] : nil
    }
    var memberCount: Int {
        members.count
    }
    
    private override init() {}
    
    func setMember(_ member: Int) {
        selectedMemberIndex = member
    }
    
    func getMember(_ index: Int) -> Member {
        return members[index]
    }
}
