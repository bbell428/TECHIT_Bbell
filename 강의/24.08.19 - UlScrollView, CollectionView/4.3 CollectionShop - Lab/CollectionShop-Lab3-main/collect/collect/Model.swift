//
//  Model.swift
//  collect
//
//  Created by 김정원 on 8/19/24.
//

import Foundation
let products = [
    Product(person: .jw,
            name: "감자빵 오리지널 10개입",
            imageURL: "https://thumbnail8.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/31062629277261-d254cb33-8d2a-4f01-9658-936b91be81e8.jpg",
            imageName: nil,
            infoURL: "https://www.coupang.com/vp/products/6004322983?itemId=10877648839&vendorItemId=86670748697&sourceType=CATEGORY&categoryId=393660"),
    
    Product(person: .jw,
            name: "베키아에누보 샌드위치",
            imageURL: "https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/8402381464119312-eff83a61-b9fd-4bfc-951e-c0e9c5aaf6cb.jpg",
            imageName: nil,
            infoURL: "https://www.coupang.com/vp/products/5971267522?itemId=10726639147&vendorItemId=78007266018&sourceType=CATEGORY&categoryId=393660"),
    
    Product(person: .jw,
            name: "동원 라이트 스탠다드 참치",
            imageURL: "https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/39895399538651-5c48dbab-2331-4f86-8344-ed7d1d6e1e64.jpg",
            imageName: nil,
            infoURL: "https://www.coupang.com/vp/products/6398710176?itemId=13673905676&vendorItemId=80925874940&sourceType=CATEGORY&categoryId=393660"),
    
    Product(person: .jw,
            name: "고래사어묵",
            imageURL: "https://thumbnail9.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/2021/06/01/18/5/7d33c0d5-f84a-491b-b238-9d2c61ed434a.jpg",
            imageName: nil,
            infoURL: "https://www.coupang.com/vp/products/6398710176?itemId=13673905676&vendorItemId=80925874940&sourceType=CATEGORY&categoryId=393660"),
    
    Product(person: .jw,
            name: "셰프초이스 육즙가득 떡갈비",
            imageURL: "https://thumbnail6.coupangcdn.com/thumbnails/remote/230x230ex/image/retail/images/6605816886237412-b3649013-d81a-4147-8c9a-eb4dd92762de.jpg",
            imageName: nil,
            infoURL: "https://www.coupang.com/vp/products/1947353717?itemId=3306379817&vendorItemId=71293284850&sourceType=CATEGORY&categoryId=393660"),
    Product(person: .jw,
            name: "모션 데스크",
            imageURL: "https://cdn.imweb.me/thumbnail/20211021/079fb649e5e29.jpg",
            imageName: nil,
            infoURL: "https://lunalab.co.kr/desk/?idx=1&gad_source=1&gbraid=0AAAAAChcR_LoWexRkw59He4akX7xMH-gJ&gclid=EAIaIQobChMIk8bZzajxhwMVSiV7Bx0idzX6EAQYASABEgL36_D_BwE&gclsrc=aw.ds"),
    Product(person: .jw,
            name: "M3 맥북",
            imageURL: "https://www.bhphotovideo.com/images/fb/apple_mrx63ll_a_14_macbook_pro_pro_1793627.jpg",
            imageName: nil,
            infoURL: "https://www.apple.com/kr/shop/buy-mac/macbook-pro/14-m3-max"),
    Product(person: .jw,
            name: "런치패드",
            imageURL: "https://i.namu.wiki/i/k1zyjeVu5-zNBtt7893Fs8VSBoMnumP98uZv8j9O62nt2nNmDzM4b2XDsRLi5_QzjG5DObuRjUn9ojE8zAhoMA.webp",
            imageName: nil,
            infoURL: "https://www.coupang.com/np/search?q=런치+패드&channel=&component=&eventCategory=SRP&trcid=&traid=&sorter=scoreDesc&minPrice=&maxPrice=&priceRange=&filterType=&listSize=36&filter=&isPriceRange=false&brand=&offerCondition=&rating=0&page=3&rocketAll=false&searchIndexingToken=1=1&backgroundColor="),
    Product(person: .jw,
            name: "APPLE 2024 iPad Pro 13 M4 Cellular 2TB+애플펜슬 프로 (+매직키보드)",
            imageURL: "https://img.danawa.com/prod_img/500000/272/165/img/60165272_1.jpg?shrink=330:*&_v=20240716082853", imageName: nil,
            infoURL: "https://item.gmarket.co.kr/Item?goodscode=3995053551&service_id=elecdn&jaehuid=200002657"),
    Product(person: .jw,
            name: "APPLE 아이폰15 프로 맥스 1TB, 자급제 (자급제 공기계)",
            imageURL: "https://img.danawa.com/prod_img/500000/617/209/img/28209617_1.jpg?shrink=330:*&_v=20240208114809", imageName: nil,
            infoURL: "https://www.coupang.com/vp/products/7630888680?itemId=20252601160&vendorItemId=87340558034&src=1032034&spec=10305197&addtag=400&ctag=7630888680&lptag=I20252601160&itime=20240813152116&pageType=PRODUCT&pageValue=7630888680&wPcid=16832955087325221992628&wRef=prod.danawa.com&wTime=20240813152116&redirect=landing&mcid=1a1799b27dcb4fc381a59627a81c4748"),
    Product(person: .sm, name: "아디다스 삼바", imageURL: nil, imageName: "adidas_sm", infoURL: "https://www.adidas.co.kr/?cm_mmc=AdieSEM_google-_-ALWAYSON-_-Trademark-_-Trademark__ADIDAS-_-dv:eCom-_-cn:ALWAYSON-_-pc:google&cm_mmc1=KR&cm_mmc2=PPC-TM-CrossCategory-None-Exact-KR-APAC-eCom-Paid_Search&gad_source=1&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7DrlDGfOXBa555-BTziKS4ss8R9MStO4qLdqchiTAQldNkSbPlarn_8aAtpOEALw_wcB"),
    Product(person: .sm, name: "₩", imageURL: nil, imageName: "mouse_sm", infoURL: "https://www.logitech.com/ko-kr"),
    Product(person: .sm, name: "스탠리 텀블러",imageURL: nil, imageName: "stanly_sm", infoURL: "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjoj-HpsoCIAxUWjLkFHWo_OskYABAAGgJ0bQ&co=1&ase=2&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7DrdsHo2kuaMN_yphEKCKLU2uljkefMW1PjUmBrMxYZkM7hRwfccEgMaAvnaEALw_wcB&ohost=www.google.com&cid=CAESVeD2iXJ080y_ctiLaM-RZZh8fn3bOASOQ00kbCXkfli2fDSSi6T6v28DVVJkHsvqp66c_w4PLAfW-MEijRj3qdlfYagWREe93BqWJj5y8jbQauqxJTM&sig=AOD64_0N40-PCYwEiCAS3vYvWs-vkQpaUw&q&nis=4&adurl&ved=2ahUKEwivk9zpsoCIAxVGp1YBHSmTNAYQ0Qx6BAgJEAM"),
    Product(person: .sm, name: "요넥스 배드민턴 라켓", imageURL: nil, imageName: "badminton_sm", infoURL: "http://www.yonexmall.com/"),
    Product(person: .sm, name: "후지필름 카메라",imageURL: nil, imageName: "camera_sm", infoURL: "https://fujifilm-korea.co.kr/"),
    Product(person: .sm, name: "케이스티파이 케이스", imageURL: nil,imageName: "case_sm", infoURL: "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwilo-qUtoCIAxWFwBYFHRdWAIkYABAEGgJ0bA&co=1&ase=2&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7Do9t1srofPK8-LQ6l6fTNMx4xwQKhBHCO_uEwsflm92SDCF2mmVzmAaAhl6EALw_wcB&ohost=www.google.com&cid=CAESVeD2vbWjpt0cKLyImTh52mT7oIZJ_Hg9zioFAG-MSR0uKjmIQL6Eaq4_DwpTCPdxTgsJutIG4FbZ1JCr6Qk72VTxV9ex0NIIUgr6gMcQem83EoCCVFY&sig=AOD64_0ygpWjG5keCehU7wK304CeY9eV8Q&q&nis=4&adurl&ved=2ahUKEwjR_-WUtoCIAxUFk1YBHXOXEDYQ0Qx6BAgKEAE"),
    Product(person: .sm, name: "에어팟맥스",imageURL: nil, imageName: "airpotmax_sm", infoURL: "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjq5KDDtoCIAxXQHnsHHbgtE8gYABAAGgJ0bQ&co=1&ase=2&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7Dqj85KAkwn4fQfiP-jR6zKCd__6BKravkDf5C3l1D9COf457pIGggwaAgR2EALw_wcB&ohost=www.google.com&cid=CAESVeD2uDvJ8ZtTNPveu5rSILtUc9JK1ZBtAsLGlOCJF95VSm2yyXqNKPP3aNLzjQbGQ2aGZFxJVfI-hOAMVeCZbDhYU7gLe6fK26EGcLgY2gH0K5AyMaM&sig=AOD64_3pjIJ35OrzkZ8U06SBts66HMB4AA&q&nis=4&adurl&ved=2ahUKEwjtv5zDtoCIAxWbr1YBHUksJWUQ0Qx6BAgIEAE"),
    Product(person: .sm, name: "한우", imageURL: nil,imageName: "beef_sm", infoURL: "https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwjXq8zNtoCIAxUk4RYFHc_GE2sYABABGgJ0bA&co=1&ase=2&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7DpAPmuzAEEMZkwCd2IWR0vv3yMWQ9tRuZfGcfBqwVLbcDltjEW1wIkaAlx5EALw_wcB&ohost=www.google.com&cid=CAESVeD2JtwICY3XjJNolgoeUgzRuvX1lTG_1uGdo8Js3TFZQfgQJ6-mnvcr3-DXD4gjwCDP5jBgWd9PQhbwIDEHi9fBqiSlXcVv2WVCT-dlddpuDro258c&sig=AOD64_3d41gUMEYfCbjbbFDVhb-rOi1pFQ&q&nis=4&adurl&ved=2ahUKEwj_9sfNtoCIAxXUr1YBHZsmKM8Q0Qx6BAgOEAE"),
    Product(person: .sm, name: "반팔", imageURL: nil,imageName: "cloth_sm", infoURL: "https://www.musinsa.com/categories/item/001001"),
    Product(person: .sm, name: "닌텐도스위치", imageURL: nil,imageName: "nintendo_sm", infoURL: "https://www.nintendo.co.kr/"),
    Product(
        person: .iy,
        name: "휴그랩 눈마사지기 RIG003",
        imageURL: nil,
        imageName: "eyemassage_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=17135594&cate=17336294"
    ),
    
    Product(
        person: .iy,
        name: "LG전자 스탠바이미 27ART10CMPL (이동형 스탠드)",
        imageURL: nil,
        imageName: "stanbymeTV_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=51549776&cate=10248425"
    ),
    
    Product(
        person: .iy,
        name: "직방 (구)삼성SDS SHP-DR900SK (설치비 포함)",
        imageURL: nil,
        imageName: "samsungDoorLock_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=17584061&cate=102293"
    ),
    
    Product(
        person: .iy,
        name: "LG전자 오브제컬렉션 올 뉴 스타일러 SC5GMR81H",
        imageURL: nil,
        imageName: "Styler_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=32043050&cate=10247884"
    ),
    
    Product(
        person: .iy,
        name: "LG전자 오브제컬렉션 DUE1BGL 12인용 빌트인",
        imageURL: nil,
        imageName: "Dishwasher_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=46101317&cate=102313"
    ),
    
    Product(
        person: .iy,
        name: "한국인삼공사 정관장 홍삼정 에브리타임 10ml 30포 (1개)",
        imageURL: nil,
        imageName: "RedGinseng_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=1954230&cate=16253962"
    ),
    
    Product(
        person: .iy,
        name: "쿠쿠전자 CRP-DHP0610FD (일반구매)",
        imageURL: nil,
        imageName: "PressureCooker_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=7286017&cate=102123"
    ),
    
    Product(
        person: .iy,
        name: "혼다 올뉴 PCX 125 ABS 2024년식",
        imageURL: nil,
        imageName: "pcx125_iy",
        infoURL: "https://prod.danawa.com/info/?pcode=41420729&cate=14237788"
    ),
    
    Product(
        person: .iy,
        name: "LG전자 2024 그램16 16ZD90S-GX79K WIN11 (SSD 1TB)",
        imageURL: nil,
        imageName: "gram16_iy_11zon",
        infoURL: "https://prod.danawa.com/info/?pcode=63421748&cate=112758"
    ),
    
    Product(
        person: .iy,
        name: "LG전자 오브제컬렉션 코드제로 로보킹 AI 올인원 B95AW (B95AWBH, 직배수키트 미포함)",
        imageURL: nil,
        imageName: "robot_iy_11zon",
        infoURL: "https://prod.danawa.com/info/?pcode=63268445&cate=10243069"
    ),
    
    Product(
        person: .yj,
        name: "나하로 맥세이프 아머 하이브리드 휴대폰 케이스",
        imageURL: nil,
        imageName: "a_yj",
        infoURL: "https://www.coupang.com/vp/products/8123438105?vendorItemId=90085968099&sourceType=HOME_PERSONALIZED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-personalized_ads&clickEventId=aef49220-5df1-11ef-b192-db7a7188d6d3"
    ),
    
    Product(
        person: .yj,
        name: "TCL 4K UHD 안드로이드 12 TV",
        imageURL: nil,
        imageName: "b_yj",
        infoURL: "https://www.coupang.com/vp/products/8147474239?vendorItemId=90396528369&sourceType=HOME_PERSONALIZED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-personalized_ads&clickEventId=aef3f5e0-5df1-11ef-8446-cc0fe1fb16fe"
    ),
    
    Product(
        person: .yj,
        name: "LG그램 17인치 터치 인텔 i7 13세대 32GB 2TB WIN11 블랙 17Z90R",
        imageURL: nil,
        imageName: "c_yj",
        infoURL: "https://www.coupang.com/vp/products/7465702474?vendorItemId=90909651563&sourceType=HOME_PERSONALIZED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-personalized_ads&clickEventId=aef46b10-5df1-11ef-913d-59f3a008343d"
    ),
    
    Product(
        person: .yj,
        name: "샤오미 WQHD 커브드 게이밍 모니터",
        imageURL: nil,
        imageName: "d_yj",
        infoURL: "https://www.coupang.com/vp/products/8134833615?vendorItemId=90139746683&sourceType=HOME_RELATED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-related_ads&clickEventId=aee995a0-5df1-11ef-aca5-cc2c1c3a526a"
    ),
    
    Product(
        person: .yj,
        name: "TCL 4K UHD QLED QD-MiniLED 안드로이드12 TV",
        imageURL: nil,
        imageName: "e_yj",
        infoURL: "https://www.coupang.com/vp/products/8048608352?vendorItemId=89658808320&sourceType=HOME_RELATED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-related_ads&clickEventId=aee94780-5df1-11ef-a1fe-65bd61d43093"
    ),
    
    Product(
        person: .yj,
        name: "로보락 S8 MaxV Ultra 로봇청소기 S82USV+EWFD13HRR",
        imageURL: nil,
        imageName: "f_yj",
        infoURL: "https://www.coupang.com/vp/products/8023995834?vendorItemId=89468419607&sourceType=HOME_RELATED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-related_ads&clickEventId=aee92070-5df1-11ef-b853-cf043abf0fa3"
    ),
    
    Product(
        person: .yj,
        name: "마이크로소프트 2023 서피스 랩탑 고 3 12.4 코어i5 인텔 12세대",
        imageURL: nil,
        imageName: "g_yj",
        infoURL: "https://www.coupang.com/vp/products/7636803971?vendorItemId=87367323683&sourceType=HOME_RELATED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-related_ads&clickEventId=aee96e90-5df1-11ef-b42b-82b1f2c94131"
    ),
    
    Product(
        person: .yj,
        name: "아라리 투명 힌지보호 풀커버 누킨360 휴대폰 케이스",
        imageURL: nil,
        imageName: "h_yj",
        infoURL: "https://www.coupang.com/vp/products/5281422050?vendorItemId=90479890929&sourceType=HOME_RELATED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-related_ads&clickEventId=aee995a0-5df1-11ef-b76a-3de1ddeec490"
    ),
    Product(
        person: .yj,
        name: "베루스 모던 고 펜커버 자동 힌지 보호 S펜 카드 수납 휴대폰 케이스",
        imageURL: nil,
        imageName: "i_yj",
        infoURL: "https://www.coupang.com/vp/products/7969745239?vendorItemId=89116160558&sourceType=HOME_RELATED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-related_ads&clickEventId=aee995a0-5df1-11ef-8eef-d73484a81a06"
    ),
    Product(
        person: .yj,
        name: "삼성전자 올인원 프로 일체형 PC DM970AGA-L51A 27인치 인텔 울트라5 16GB WIN11 기업용 사무용 학습용 AI 컴퓨터 PC",
        imageURL: nil,
        imageName: "l_yj",
        infoURL: "https://www.coupang.com/vp/products/8261204054?vendorItemId=90822903263&sourceType=HOME_RELATED_ADS&searchId=feed-0064102dd0a84b5490472cf2e284fc0f-related_ads&clickEventId=aee96e90-5df1-11ef-869b-26a77f341fe4"
    ),
    Product(
        person: .bg,
        name: "바디프랜드 팬텀 로보 안마의자",
        imageURL: nil,
        imageName: "bodyfriend_bg",
        infoURL: "https://www.coupang.com/vp/products/6696906528?itemId=15496955267&vendorItemId=82716295263&sourceType=CATEGORY&categoryId=178155&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "소니정품 풀프레임 캠코더 FX3 (BODY) /시네마라인 ILME-FX3 /ED",
        imageURL: nil,
        imageName: "camcoder_bg",
        infoURL: "https://www.coupang.com/vp/products/7358199233?itemId=18951345488&vendorItemId=86205599964&sourceType=CATEGORY&categoryId=178155&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "Apple 2023 맥북 프로 16 M3",
        imageURL: nil,
        imageName: "macbook_bg",
        infoURL: "https://www.coupang.com/vp/products/7719393063?itemId=20712943007&vendorItemId=87783936819&sourceType=CATEGORY&categoryId=178155&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "PC방 목 발받침 의자 게이밍아치형",
        imageURL: nil,
        imageName: "chair_bg",
        infoURL: "https://www.coupang.com/vp/products/5374501195?itemId=7964061776&vendorItemId=85960349568&q=게이밍+의자&itemsCount=36&searchId=2bd074b3cc654417adadfda393328577&rank=1&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "뷰카 센트 클래식 대용량 디퓨저",
        imageURL: nil,
        imageName: "diffuser_bg",
        infoURL: "https://www.coupang.com/vp/products/7308098821?itemId=20198481887&vendorItemId=87289304988&sourceType=srp_product_ads&clickEventId=76849380-5df7-11ef-ac9f-ce848160ed5b&korePlacement=15&koreSubPlacement=3&q=디퓨져&itemsCount=36&searchId=4bf395aaadbb413ab5982c6f17b1f5d4&rank=2&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "써지오 개별 멀티탭 6구",
        imageURL: nil,
        imageName: "multitab_bg",
        infoURL: "https://www.coupang.com/vp/products/7046278942?itemId=17438348815&vendorItemId=3061670973&q=멀티탭&itemsCount=36&searchId=db64fe7c7e5449689821fe723e119a82&rank=7&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "무아스 퓨어 미니 LED 벽시계",
        imageURL: nil,
        imageName: "clock_bg",
        infoURL: "https://www.coupang.com/vp/products/192064286?itemId=549390642&vendorItemId=4441672995&pickType=COU_PICK&q=전자시계&itemsCount=36&searchId=49615a0617ca42f88f0e27d6222acb01&rank=1&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "에어라파 압축 스프레이 분무기 대형 300ml",
        imageURL: nil,
        imageName: "spray_bg",
        infoURL: "https://www.coupang.com/vp/products/2146584?itemId=19018095656&vendorItemId=3776061129&q=스프레이&itemsCount=36&searchId=ccf52bc8678b43128a68e72d2bb89c6d&rank=16&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "사조 살코기 참치 안심따개, 100g",
        imageURL: nil,
        imageName: "tunacan_bg",
        infoURL: "https://www.coupang.com/vp/products/6858666780?itemId=27469392&vendorItemId=77066380663&pickType=COU_PICK&q=참치캔&itemsCount=36&searchId=bd96851b4f4b492e956f4c6528fd0c6e&rank=0&isAddedCart="
    ),
    
    Product(
        person: .bg,
        name: "무설치 낮잠 접이식침대 6단계 조정 대형 휴대용 야전침대 소음 없고 접이식 싱글침대",
        imageURL: nil,
        imageName: "bed_bg",
        infoURL: "https://www.coupang.com/vp/products/7820133844?itemId=21238077838&vendorItemId=88304786386&q=침대&itemsCount=36&searchId=466f0cefe2f041c0899f21d2d8f17a1a&rank=26&isAddedCart="
    )
    
    
]
enum Person {
    case jw
    case sm
    case bg
    case iy
    case yj
}
struct Product {
    let person : Person
    let name: String
    let imageURL: String?
    let imageName: String?
    let infoURL: String
}
