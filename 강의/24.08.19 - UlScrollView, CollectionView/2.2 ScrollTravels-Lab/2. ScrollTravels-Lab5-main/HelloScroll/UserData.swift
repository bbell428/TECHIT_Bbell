//
//  UserData.swift
//  HelloScroll
//
//  Created by 박준영 on 8/19/24.
//

import Foundation

struct Travel : Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var url: String
}

let travelArray: [Travel] = [
    Travel(name: "김효정", location: "일본 삿포로", url: "https://www.kkday.com/ko/blog/wp-content/uploads/hokkaido_travel_4.jpeg"),
    Travel(name: "김효정", location: "일본 삿포로", url: "https://www.kkday.com/ko/blog/wp-content/uploads/hokkaido_travel_2.jpeg"),
    Travel(name: "김효정", location: "일본 삿포로", url: "https://www.kkday.com/ko/blog/wp-content/uploads/hokkaido_travel_17.jpeg"),
    Travel(name: "김효정", location: "일본 삿포로", url: "https://www.kkday.com/ko/blog/wp-content/uploads/hokkaido_travel_18.jpeg"),
    Travel(name: "김효정", location: "일본 삿포로", url: "https://a.travel-assets.com/findyours-php/viewfinder/images/res70/499000/499461-former-hokkaido-government-office-building.jpg"),
    Travel(name: "강희창", location: "페루 - 마추픽추", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA1MDVfMjE2%2FMDAxNzE0OTEyODE4NTYw.yhCmBtNstwLjOR0IiSadDN4XyjXBrhBqSQgL2DBQ0vAg.USbT4yg_Ej_Z0sVP94Sej7XBWQDqEsmk8xNCTH5x34sg.JPEG%2F20240426%A3%DF092918.jpg&type=sc960_832"),
    Travel(name: "강희창", location: "아르헨티나 - 파타고니아 모레노 빙하", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDA0MDlfNDIg%2FMDAxNTg2NDE3NzAzODAz.grS_OnLjbz4cktVbtkneaTGotU4C0QMeS3lZI7C9zhAg.OknwysKxwd1p091ZakSc0UerU2ExZUlS0saCxaIR96Ug.JPEG.treksta051%2Fcm08263936.jpg&type=sc960_832"),
    Travel(name: "강희창", location: "볼리비아 - 우유니 소금사막", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20140529_83%2Fcar3876_140132814320439asY_JPEG%2F10338658_709785475746541_3409531585463149639_o.jpg&type=sc960_832"),
    Travel(name: "강희창", location: "아이슬란드 - 오로라", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTEyMDZfMjI5%2FMDAxNTc1NjI3MzcxMzI3.lNUeH7JgKDsI5uMuREwKrxd86ANyNrTTKQX8VvxcZIAg.ctw8Uqz6QRs1ccAqonT021CTUPhm1yWqY1FSkx4_D1Eg.JPEG.cjsxlawkd91%2F%BF%C0%B7%CE%B6%F3%BF%A9%C7%E0_%2815%29_-_%BA%B9%BB%E7%BA%BB.jpg&type=sc960_832"),
    Travel(name: "강희창", location: "멕시코 - 칸쿤", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEyMTJfMjc1%2FMDAxNzAyMzczOTcwNjU0._VGM922tcRPgq22uC0Z2vNYqHhiSUInEkaTgVqUahPYg.v-qbz6YNYsP8E3mqm5s8S-t6XkzlavMr2OUz-FJmChQg.JPEG.unesco114%2FCancun_headercancun.jpg&type=sc960_832"),
    Travel(name: "이다영", location: "스페인 바로셀로나", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA3MDNfMTU1%2FMDAxNzIwMDA1MDgyNjAy.JoVB5_SESiL6xvpltuWjzg3jLyy1CdPNf3N6N6QQdw8g.7PKPZJ_DHFvgN_Y8FkakEn-NCVrOm5nGpgfii_d_4yMg.PNG%2F%BF%DC.PNG&type=sc960_832"),
    Travel(name: "이다영", location: "일본 삿포로", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA3MTlfMTE3%2FMDAxNzIxMzczMTUzODg0.mcLqLbarYD40nEQKH5qhLkYi5Kf5XJ7tEYiFv6n7Wnog.WpG9d2bKP8GUVFM5TctzVZbN_7KjMjezxZ97-Ug0S3gg.JPEG%2FIMG_4395.jpg&type=sc960_832"),
    Travel(name: "이다영", location: "캐나다 오타와", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fpost.phinf.naver.net%2FMjAxNzA5MTRfMTQg%2FMDAxNTA1MzcwMTI4NTIw.j_0n2KjW7g1bCYIj_AQPP9-azEMHwSyd4-yJXAG54zUg.6unY-cslEr7-2BfdjaEHDlv_fBxXNrxEV88jsIIZkygg.JPEG%2FI-H7ofalpBsrFykwkL3f1MISPU6g.jpg&type=sc960_832"),
    Travel(name: "이다영", location: "몽골 고비사막", url: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA0MDlfMTE5%2FMDAxNzEyNjM3OTk4NzYy.hGm5JzaKkfzVlRaWX_cOY4fgqlVEiSdAzcd_Ynfmq_cg.Y2MauHBesgdRbZB2V-sM6RQXQfS7afY_cC1r5-1oSYkg.JPEG%2FRecovered_jpg_file%2852949%29.jpg&type=sc960_832"),
    Travel(name: "이다영", location: "독일 베를린", url: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fd3b39vpyptsv01.cloudfront.net%2Fphoto%2F1%2F2%2Fcde7e3ece5f007909f5e2a11ab75dbae.jpg&type=sc960_832"),
    Travel(name: "박준영", location: "독일 프랑크푸르트", url: "https://i.namu.wiki/i/jBaDwodKFiijSVn1UgzW1mGL-xmLeO_zM_P9mAOGNERI8a40JNNAAjrmZKbTkbXK0-YeuXpgf_rAhscwcQgVPw.webp"),
    Travel(name: "박준영", location: "일본 후쿠오카", url: "https://www.hilokal.com/blog/content/images/2022/10/--------00-2.jpg"),
    Travel(name: "박준영", location: "미국 라스베가스", url: "https://www.kkday.com/ko/blog/wp-content/uploads/1.-%E1%84%89%E1%85%B3%E1%84%90%E1%85%B3%E1%84%85%E1%85%B5%E1%86%B8wp.jpg"),
    Travel(name: "박준영", location: "스위스 알프스", url: "https://i.namu.wiki/i/nJ0qXNhHnkNYqA4Le-mYyg1yBQqd8LUf4s_G6VzfFTh-R459AxZFL4HDcweWonZvat82XKNc6nZI8kjc4LENgQ.webp"),
    Travel(name: "박준영", location: "대만 지우편", url: "https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/1jPF/image/ca0AXLs3pbeGovS8ho7GqF19wz4.jpg"),
]


