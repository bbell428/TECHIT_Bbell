//
//  Extension+UIImage.swift
//  Shopping_LAB1
//
//  Created by Hyunwoo Shin on 8/19/24.
//

import Foundation
import UIKit

extension UIImage {
    static func fetchImage(from urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // HTTP 응답 상태 코드 확인
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        // 이미지 데이터 변환
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "ImageError", code: 0, userInfo: [NSLocalizedDescriptionKey: "Unable to create image from data"])
        }
        
        return image
    }
}
