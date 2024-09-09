//
//  ChannelStore.swift
//  LionCast
//
//  Created by Jongwook Park on 9/6/24.
//

import Foundation
import Observation

@Observable
class ChannelStore {
    var channels: [Channel]
    var currentChannelIndex: Int
    
    var currentChannel: Channel {
        channels[currentChannelIndex]
    }
    
    init() {
        channels = [
            Channel(name: "KBS1", 
                    imageName: "kbs_1tv",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=11&cc=ok",
                    kind: .tv),
            Channel(name: "KBS2",
                    imageName: "kbs_2tv",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=12&cc=ok",
                    kind: .tv),
            Channel(name: "KBS NEWS D",
                    imageName: "kbs_news",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=81",
                    kind: .tv),
            Channel(name: "1FM",
                    imageName: "kbs_radio_ch_24",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=24",
                    kind: .radio),
            Channel(name: "2FM",
                    imageName: "kbs_radio_ch_25",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=25",
                    kind: .radio),
            Channel(name: "1라디오",
                    imageName: "kbs_radio_ch_21",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=21",
                    kind: .radio),
            Channel(name: "2라디오",
                    imageName: "kbs_radio_ch_22",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=22",
                    kind: .radio),
            Channel(name: "3라디오",
                    imageName: "kbs_radio_ch_23",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=23",
                    kind: .radio),
            Channel(name: "한민족",
                    imageName: "kbs_radio_ch_26",
                    siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=26",
                    kind: .radio),
        ]
        
        currentChannelIndex = 0
    }
    
    #if DEBUG
    static var sampleChannel: Channel {
        Channel(name: "KBS1", imageName: "kbs_1tv", siteURL: "https://refer.kbs.co.kr/pre/player/player_playlist.php?ch=11", kind: .tv)
    }
    #endif
    
    func updateChannelInfo() async {
        
        for (index, channel) in channels.enumerated() {
            
            var currChannel = channel
            
            guard let url = URL(string: channel.siteURL) else {
                continue
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let html = String(data: data, encoding: .utf8) ?? ""
                print(html)
                
                currChannel.name = html.subStringBetween(
                    "<span class=\"channel-txt\">",
                    "</span>")
                
                currChannel.programName = html.subStringBetween(
                    "playlist.title = '",
                    "';")
                
                currChannel.title = html.subStringBetween(
                    "<span class=\"tit\">",
                    "</span>")
                
                currChannel.nextProgramName = html.subStringBetween(
                    "<span class=\"next-program\">",
                    "</span>")
                
                currChannel.videoURL = html.subStringBetween(
                    "playlist.file = '",
                    "';")
                
                currChannel.imageURL = html.subStringBetween(
                    "playlist.image = '",
                    "';")
                
                // 값타입이기 때문에 바뀐 새로운 내용으로 교체 필요!
                channels[index] = currChannel
                
            } catch {
                
            }
        }
    }
}
