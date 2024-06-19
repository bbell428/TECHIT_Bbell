//
//  Data.swift
//  LionSchool
//
//  Created by 이소영 on 6/17/24.
//

import Foundation

let mySchool: School = School(name: "멋쟁이고등학교", campaign: "예능 특목고", levels: [
    Level(name: "1학년", grade: "막내를 무시하지마", schoolClasses: [
        SchoolClass(name: "애니메이션반", campaign: "짱구는 사실 35살", students: [
            Student(name: "짱구", talent: "내용 입력(애니)", mbti: "ENFP", star: "사자자리"),
            Student(name: "도라에몽", talent: "내용 입력(애니)", mbti: "", star: ""),
            Student(name: "흰둥이", talent: "내용 입력(애니)", mbti: "", star: ""),
            Student(name: "큐티니", talent: "내용 입력(애니)", mbti: "", star: ""),
            Student(name: "하니", talent: "내용 입력(애니)", mbti: "", star: ""),
            Student(name: "하츄핑", talent: "내용 입력(애니)", mbti: "", star: "")
        ]),
        SchoolClass(name: "스포츠반", campaign: "금메달을 향하여!", students: [
            Student(name: "박태환", talent: "내용 입력(스포츠)", mbti: "ISTJ", star: "황소자리"),
            Student(name: "이상혁", talent: "내용 입력(스포츠)", mbti: "", star: ""),
            Student(name: "손흥민", talent: "내용 입력(스포츠)", mbti: "", star: ""),
            Student(name: "김연아", talent: "내용 입력(스포츠)", mbti: "", star: ""),
            Student(name: "김연경", talent: "내용 입력(스포츠)", mbti: "", star: ""),
            Student(name: "강호동", talent: "내용 입력(스포츠)", mbti: "", star: ""),
            Student(name: "장미란", talent: "내용 입력(스포츠)", mbti: "", star: "")
        ]),
        SchoolClass(name: "가수반", campaign: "개인 공연까지 힘내자", students: [
            Student(name: "아이유", talent: "내용 입력(가수)", mbti: "INTP", star: "처녀자리"),
            Student(name: "태연", talent: "내용 입력(가수)", mbti: "", star: ""),
            Student(name: "로제", talent: "내용 입력(가수)", mbti: "", star: ""),
            Student(name: "벤", talent: "내용 입력(가수)", mbti: "", star: ""),
            Student(name: "박효신", talent: "내용 입력(가수)", mbti: "", star: ""),
            Student(name: "임창정", talent: "내용 입력(가수)", mbti: "", star: "")
        ])
    ]),
    Level(name: "2학년", grade: "중간의 서러움", schoolClasses: [
            SchoolClass(name: "배우반", campaign: "신인상 트로피 받자", students: [
                Student(name: "변우석", talent: "내용 입력(배우)", mbti: "ENTP", star: "물고기 자리"),
                Student(name: "손석구", talent: "내용 입력(배우)", mbti: "", star: ""),
                Student(name: "이채민", talent: "내용 입력(배우)", mbti: "", star: ""),
                Student(name: "김지원", talent: "내용 입력(배우)", mbti: "", star: ""),
                Student(name: "공효진", talent: "내용 입력(배우)", mbti: "", star: ""),
                Student(name: "김지미", talent: "내용 입력(배우)", mbti: "", star: "")
            ]),
            SchoolClass(name: "래퍼반", campaign: "내용 입력(래퍼)", students: [
                Student(name: "비와이", talent: "내용 입력(래퍼)", mbti: "ISTP", star: "게자리"),
                Student(name: "씨잼", talent: "내용 입력(래퍼)", mbti: "", star: ""),
                Student(name: "타이거JK", talent: "내용 입력(래퍼)", mbti: "", star: ""),
                Student(name: "이영지", talent: "내용 입력(래퍼)", mbti: "", star: ""),
                Student(name: "키드밀리", talent: "내용 입력(래퍼)", mbti: "", star: ""),
                Student(name: "재키와이", talent: "내용 입력(래퍼)", mbti: "", star: "")
            ]),
            SchoolClass(name: "다국적반", campaign: "내용 입력(다국적)", students: [
                Student(name: "탕웨이", talent: "내용 입력(다국적)", mbti: "ESTJ", star: "처녀자리"),
                Student(name: "아이묭", talent: "내용 입력(다국적)", mbti: "", star: ""),
                Student(name: "박보검", talent: "내용 입력(다국적)", mbti: "", star: ""),
                Student(name: "톰크루즈", talent: "내용 입력(다국적)", mbti: "", star: ""),
                Student(name: "엠마왓슨", talent: "내용 입력(다국적)", mbti: "", star: ""),
            ]),
        ]),
    Level(name: "3학년", grade: "학교 탑", schoolClasses: [
        SchoolClass(name: "과학반", campaign: "그래도 지구는 돈다!", students: [
            Student(name: "아리스토텔레스", talent: "내용 입력(과학)", mbti: "ISNP", star: "물병자리"),
            Student(name: "에디슨", talent: "내용 입력(과학)", mbti: "", star: ""),
            Student(name: "갈릴레오갈릴레이", talent: "내용 입력(과학)", mbti: "", star: ""),
            Student(name: "마리퀴리", talent: "내용 입력(과학)", mbti: "", star: ""),
            Student(name: "찰스다윈", talent: "내용 입력(과학)", mbti: "", star: ""),
        ]),
        SchoolClass(name: "미술반", campaign: "가자 소더비로!", students: [
            Student(name: "반고흐", talent: "내용 입력(미술)", mbti: "ISTJ", star: "게자리"),
            Student(name: "다빈치", talent: "내용 입력(미술)", mbti: "", star: ""),
            Student(name: "뭉크", talent: "내용 입력(미술)", mbti: "", star: ""),
            Student(name: "피카소", talent: "내용 입력(미술)", mbti: "", star: ""),
            Student(name: "미켈란젤로", talent: "내용 입력(미술)", mbti: "", star: "")
        ]),
        SchoolClass(name: "예능반", campaign: "예능", students: [
            Student(name: "유재석", talent: "내용 입력(예능)", mbti: "ENTJ", star: "쌍둥이자리"),
            Student(name: "박명수", talent: "내용 입력(예능)", mbti: "", star: ""),
            Student(name: "이은지", talent: "내용 입력(예능)", mbti: "", star: ""),
            Student(name: "지예은", talent: "내용 입력(예능)", mbti: "", star: ""),
            Student(name: "신동엽", talent: "내용 입력(예능)", mbti: "", star: "")
        ])
    ])
])
