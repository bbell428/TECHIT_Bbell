//
//  GoodsManager.swift
//  Shopping_LAB1
//
//  Created by Hyunwoo Shin on 8/19/24.
//

import Foundation

class GoodsManager {
    var members: [Member] = [
        Member(
            memberName: "신현우",
            goodsList: [
                Goods(goodsName: "농담곰 인형", goodsSite: "https://shinsegaemall.ssg.com/item/itemView.ssg?itemId=1000573355396&siteNo=6004&salestrNo=6005&tlidSrchWd=%EB%8B%B4%EA%B3%B0&srchPgNo=1&src_area=slist&advertBidId=9999999998", goodsImage: "https://sitem.ssgcdn.com/90/87/76/item/1000594768790_i1_1200.jpg"),
                Goods(goodsName: "농담곰 메모지", goodsSite: "https://shinsegaemall.ssg.com/item/itemView.ssg?itemId=1000608340350&siteNo=6004&salestrNo=6005&tlidSrchWd=%EB%8B%B4%EA%B3%B0&srchPgNo=1&src_area=slist", goodsImage: "https://sitem.ssgcdn.com/50/03/34/item/1000608340350_i1_1200.jpg"),
                Goods(goodsName: "농담곰 밴드", goodsSite: "https://shinsegaemall.ssg.com/item/itemView.ssg?itemId=1000600939196&siteNo=6004&salestrNo=6005&tlidSrchWd=%EB%8B%B4%EA%B3%B0&srchPgNo=1&src_area=slist", goodsImage: "https://sitem.ssgcdn.com/96/91/93/item/1000600939196_i1_1200.jpg"),
                Goods(goodsName: "농담곰 수면 안대", goodsSite: "https://shinsegaemall.ssg.com/item/itemView.ssg?itemId=1000604066369&siteNo=6004&salestrNo=6005&tlidSrchWd=%EB%8B%B4%EA%B3%B0&srchPgNo=1&src_area=slist", goodsImage: "https://sitem.ssgcdn.com/69/63/06/item/1000604066369_i1_1200.jpg"),
                Goods(goodsName: "농담곰 라면 인형", goodsSite: "https://shinsegaemall.ssg.com/item/itemView.ssg?itemId=1000608662385&siteNo=6004&salestrNo=6005&tlidSrchWd=%EB%8B%B4%EA%B3%B0&srchPgNo=1&src_area=slist", goodsImage: "https://sitem.ssgcdn.com/85/23/66/item/1000608662385_i1_1200.jpg"),
            ]),
        
        Member(
            memberName: "홍재민",
            goodsList: [
                Goods(goodsName: "Mac Studio", goodsSite: "https://www.apple.com/kr/shop/buy-mac/mac-studio/12코어-cpu-30코어-gpu-16코어-neural-engine-32gb-메모리-512gb#", goodsImage: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/mac-studio-202306-gallery-1?wid=4000&hei=3074&fmt=jpeg&qlt=90&.v=1683939204737"),
                Goods(goodsName: "iPhone SE", goodsSite: "https://www.apple.com/kr/shop/buy-iphone/iphone-se", goodsImage: "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/iphone-se-finish-unselect-gallery-1-202207?wid=5120&hei=2880&fmt=webp&qlt=70&.v=VEhreGxMWU8vckorVEJ3dVU2RjJZZFgrSXpWVEhWaW9YTGlWRHFoSHU0L3R6NnhRaHBRWDl3NFJZMDZlMGtTTWd2S3NaRzcrU0dmYjNHTUFiMnlsWFRocXAvNjVVaCtjTTZGTUNzOU8wNkdHQitiblNSUmw5N2I0WHR6NmEySjM=&traceId=1"),
                Goods(goodsName: "AirPods Pro", goodsSite: "https://www.apple.com/kr/shop/product/MTJV3KH/A/airpods-pro", goodsImage: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/MTJV3?wid=2000&hei=2000&fmt=jpeg&qlt=90&.v=1694014871985"),
                Goods(goodsName: "해피해킹", goodsSite: "https://prod.danawa.com/info/?pcode=13320602&keyword=해피해킹&cate=112782", goodsImage: "https://img.danawa.com/prod_img/500000/602/320/img/13320602_1.jpg?shrink=500:*&_v=20220713122141"),
                Goods(goodsName: "ProDisplay", goodsSite: "https://www.apple.com/kr/shop/buy-mac/pro-display-xdr/스탠다드-글래스", goodsImage: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/pro-display-hero_FV1?wid=820&hei=474&fmt=jpeg&qlt=90&.v=1572997644832")
            ]),
        Member(
            memberName: "이주노",
            goodsList: [
                Goods( goodsName: "아이폰 15 Pro" ,goodsSite: "https://prod.danawa.com/info/?pcode=28209767" , goodsImage: "https://img.danawa.com/prod_img/500000/767/209/img/28209767_1.jpg?_v=20240208114808" ),
                Goods( goodsName: "2023 맥북 프로 14 M3" ,goodsSite: "https://support.apple.com/ko-kr/117735",goodsImage: "https://p.turbosquid.com/ts-thumb/yk/RldSsb/OV/amp14b_0000/jpg/1700780775/600x600/fit_q87/35c82240e70c1e8372e3f280566d3832ce3eab19/amp14b_0000.jpg" ),
                Goods( goodsName: "애플워치 울트라" ,goodsSite: "https://prod.danawa.com/info/?pcode=13155981",goodsImage: "https://img.danawa.com/prod_img/500000/981/155/img/13155981_1.jpg?_v=20240404110052" ),
                Goods( goodsName: "2023 아이맥 24 M3" ,goodsSite: "https://www.coupang.com/vp/products/7719391917?itemId=20712937183&vendorItemId=87783931511&src=1042503&spec=10304991&addtag=400&ctag=7719391917&lptag=10304991I20712937183&itime=20240819152344&pageType=PRODUCT&pageValue=7719391917&wPcid=17159482209390123695590&wRef=&wTime=20240819152344&redirect=landing&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7Do7-QSFueiVpMA6pyf8PSNR7fImwd5hV57TG17YBANIzkXaaV0twPMaArCOEALw_wcB&mcid=3890e58795ed4415b099759b5930b72a&campaignid=20475378677&adgroupid=",goodsImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDNuY1HwTlb6knXkQ3_R4mq6JoPcmH4CqqFQ&s" ),
                Goods( goodsName: "2024 아이패드 프로 11 M4" ,goodsSite: "https://prod.danawa.com/info/?pcode=52153823" ,goodsImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSRTOiVf6qZQ5ObmlBKIoGu6joiVFtB74TiQ&s" ),
            ]),
        Member(
            memberName: "김동경",
            goodsList: [
                Goods(goodsName: "모션데스크", goodsSite: "https://lunalab.co.kr/desk/?idx=1&gad_source=1&gbraid=0AAAAAChcR_L3lQjfhosK3NFsQIQnceFy9&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7Dp9Ue_b4xHhE5lkOpwllf91wTmthWGO7gvOBa8iWjo_WwRvm-IUMRAaAkDdEALw_wcB&gclsrc=aw.ds", goodsImage: "https://cdn.imweb.me/thumbnail/20211021/079fb649e5e29.jpg"),
                Goods(goodsName: "아이맥", goodsSite: "https://prod.danawa.com/info/?pcode=13958165", goodsImage: "https://img.danawa.com/prod_img/500000/165/958/img/13958165_1.jpg?_v=20210913152250"),
                Goods(goodsName: "스미스 머신", goodsSite: "https://www.coupang.com/vp/products/7727899236?itemId=20757991328&vendorItemId=87828216572&src=1042503&spec=10304025&addtag=400&ctag=7727899236&lptag=10304025I20757991328V87828216572&itime=20240819150908&pageType=PRODUCT&pageValue=7727899236&wPcid=17240477038864538009996&wRef=&wTime=20240819150908&redirect=landing&gclid=Cj0KCQjwt4a2BhD6ARIsALgH7DoLe9cJ8wLpj_SP9jWgJVr01AxGx2JG4H67XWdchzxWSH1K0yFUkFoaApK1EALw_wcB&mcid=a2f6dbf7fb8c4824a4be8cb686b7f0a8&campaignid=21307631972&adgroupid=", goodsImage: "https://thumbnail10.coupangcdn.com/thumbnails/remote/230x230ex/image/vendor_inventory/d826/2ea511ae1a70c9e44b5c354864998d04c0362d5730904e00b6a7c9f7d1ac.jpg"),
                Goods(goodsName: "로우 피규어", goodsSite: "https://dokidokigoods.co.kr/product/입고완료-반프레스토-피규어-원피스-트라팔가-로우-만화-애니-공식-굿즈/17658/", goodsImage: "https://m.dokidokigoods.co.kr/web/product/big/202307/0171346c813af8fac59f72a91ab5efb4.jpg"),
                Goods(goodsName: "RTX 4090", goodsSite: "https://www.itworld.co.kr/news/262894", goodsImage: "https://www.itworld.co.kr/files/itworld/ITW_202211_01/1103_002Nvidia-GeForce-RTX-4090-1.jpg")
            ])
    ]
}
