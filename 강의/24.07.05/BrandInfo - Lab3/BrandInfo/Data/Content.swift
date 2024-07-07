//
//  Content.swift
//  BrandInfo
//
//  Created by 김종혁 on 7/5/24.
//

import Foundation

let nikeData: Brand = Brand(name: "나이키",
                                    country: "미국",
                                    logoUrl:"https://ynoblesse.com/wp-content/uploads/2021/11/250808082_1045539429568731_579749520351331533_n.jpg",
                                    startYear: 1964,
                                    nowOnSale: true)

let adidasData: Brand = Brand(name: "아디다스",
                                    country: "독일",
                                    logoUrl:"https://i.namu.wiki/i/qZJ2EFBJweNzjDY_1YXABCINAIo003zQyfOFvt4mHFBl_Blm6SYwRtZyh2Wnpu06CqwmVpn2qdBGDj_cgeXMVQ.jpg",
                                    startYear: 1949,
                                    nowOnSale: true)

let pumaData: Brand = Brand(name: "퓨마",
                                    country: "독일",
                                    logoUrl:"https://w7.pngwing.com/pngs/100/126/png-transparent-puma-logo-thumbnail.png",
                                    startYear: 1948,
                                    nowOnSale: true)

let brands: [Brand] = [nikeData, adidasData, pumaData]
