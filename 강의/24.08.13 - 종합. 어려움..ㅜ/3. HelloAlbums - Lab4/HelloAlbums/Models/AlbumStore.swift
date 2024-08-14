//
//  AlbumStore.swift
//  HelloAlbums
//
//  Created by 김종혁 on 8/13/24.
//

import Foundation

class AlbumStore {
    static let shared = AlbumStore()
    
    var albums: [Album] = []
    
    init() {
        albums = [
            Album(publisher: .KJH,
                  name: "마성의 여자 A",
                  posterURL: "https://mblogthumb-phinf.pstatic.net/MjAyNDA2MjZfNDAg/MDAxNzE5NDExNDcxMzMw.QGErxEvLA_ZJ6h-LyZn71r7WS5tDbUpSBAvRTcn6mHgg.jkOczCU6KNx3YoAQ0l0WRlOP8ex4C7GqMjj4z2OLxY0g.JPEG/unnamed.jpg?type=w800",
                  infoURL: "https://www.youtube.com/watch?v=d0QFalAKRNM"
                 ),
            
            Album(publisher: .KJH,
                  name: "Good bye bye",
                  posterURL: "https://img.vogue.co.kr/vogue/2023/11/style_65603c6be1089-960x1440.jpg",
                  infoURL: "https://www.youtube.com/watch?v=i7kRQsCIvv0"
                 ),
            
            Album(publisher: .KJH,
                  name: "Baddie",
                  posterURL: "https://i.namu.wiki/i/eRjqHdLDazns2WTT0W6DKZSr7jzVI0BHBSuwipE0OSM3q0VsM_2oYV3XP3qMPtc2YkSi56mJ6sb3b_r6zcCk0g.webp",
                  infoURL: "https://www.youtube.com/watch?v=ocBhK7w0dRY"
                 ),
            
            Album(publisher: .KJH,
                  name: "Lost Stars",
                  posterURL: "https://image.bugsm.co.kr/album/images/500/4377/437787.jpg",
                  infoURL: "https://www.youtube.com/watch?v=UOf6uHwB3Tk"
                 ),
            
            Album(publisher: .KJH,
                  name: "아이돌(アイドル)",
                  posterURL: "https://newsimg.sedaily.com/2023/07/16/29S5JPWPBV_4.jpeg",
                  infoURL: "https://www.youtube.com/watch?v=qI3Cuh3RFcI"
                 ),
            
            Album(publisher: .BMS,
                  name: "(여자)아이들((G)I-DLE) - 나는 아픈 건 딱 질색이니까(Fate)",
                  posterURL: "https://image.bugsm.co.kr/album/images/500/40953/4095394.jpg",
                  infoURL: "https://www.youtube.com/watch?v=ATK7gAaZTOM"
                 ),
            
            Album(publisher: .BMS,
                  name: "Imagine Dragons - Bones",
                  posterURL: "https://image.bugsm.co.kr/album/images/500/174607/17460791.jpg",
                  infoURL: "https://youtu.be/D9G1VOjN_84?si=ikT9wdVH8qB2uNAk"
                 ),
            
            Album(publisher: .BMS,
                  name: "Imagine Dragons - Enemy",
                  posterURL: "https://image.bugsm.co.kr/album/images/500/163541/16354110.jpg",
                  infoURL: "https://youtu.be/D9G1VOjN_84?si=ikT9wdVH8qB2uNAk"
                 ),
            
            Album(publisher: .BMS,
                  name: "Nathan Evans - Wellerman",
                  posterURL: "https://m.media-amazon.com/images/I/81Hfd+e7mwL._UF1000,1000_QL80_.jpg",
                  infoURL: "https://www.youtube.com/watch?v=qP-7GNoDJ5c"
                 ),
            
            Album(publisher: .BMS,
                  name: "Eminem - Venom",
                  posterURL: "https://upload.wikimedia.org/wikipedia/en/7/73/Venom_%28Eminem_song%29_single_cover.jpg",
                  infoURL: "https://www.youtube.com/watch?v=8CdcCD5V-d8"
                 )
        ]
    }
}
