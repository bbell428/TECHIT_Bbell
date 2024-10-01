//
//  CountryDetailView.swift
//  CounrtryAPI
//
//  Created by 김종혁 on 9/30/24.
//

import SwiftUI
import MapKit

struct CountryDetailView: View {
    var city: Country
    
    var body: some View {
        ScrollView {
            MapView(coordinate: CLLocationCoordinate2D(latitude: city.latitude, longitude: city.longitude))
                .frame(height: 300)
            VStack {
                
                AsyncImage(url: URL(string: city.image)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .clipShape(Circle())
                .frame(width: 200, height: 200)
                .padding(.top, -80)
                
                Text("\(city.name)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top)
                
                Text("인구 수: \(city.population)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                Text("언어: \(city.language)")
                    .font(.headline)
                    .padding(.top)
                    .lineLimit(nil) // 줄 수 제한 없음
                    .frame(width: 300)
                    .multilineTextAlignment(.leading) // 텍스트 정렬

            }
        }
        
    }
}

struct CircleImage: View {
    var image: Image
    var size: CGFloat // 크기를 조절하기 위한 변수 추가

    var body: some View {
        image
            .resizable() // 이미지 크기 조절을 위해 추가
            .frame(width: size, height: size) // 크기 조절
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    return CountryDetailView(
        city: Country(
            id: 1,
            name: "South Korea",
            population: 51780579,
            capital: "Seoul",
            language: "Korean",
            latitude: 37.5665,
            longitude: 126.9780,
            image: "south_korea"
        )
    )
}
