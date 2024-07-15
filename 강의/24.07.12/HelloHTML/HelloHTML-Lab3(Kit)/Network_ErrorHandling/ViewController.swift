//
//  ViewController.swift
//  Network_ErrorHandling
//
//  Created by 김동경 on 2024/07/12.
//

import UIKit


enum GettingHTMLError: Error {
    case urlError
    case urlSeesionError
}

class ViewController: UIViewController {

    @IBOutlet weak var resultTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func jongHuk(_ sender: Any) {
        Task {
            do {
                let data: Data = try await requestHTML(from: "https://github.com/bbell428?tab=repositories")
                if let result: String = String(data: data, encoding: .utf8) {
                    resultTextView.text = result
                }
                
            } catch GettingHTMLError.urlError {
                print("잘못된 URL입니다")
            } catch GettingHTMLError.urlSeesionError {
                print("데이터를 가져오는 데 문제 발생")
            } catch {
                print("알 수 없는 오류 발생")
            }
        }
    }
    
    @IBAction func jungone(_ sender: Any) {
        Task {
            do {
                let data: Data = try await requestHTML(from: "https://github.com/gadisom")
                if let result: String = String(data: data, encoding: .utf8) {
                    resultTextView.text = result
                }
                
            } catch GettingHTMLError.urlError {
                print("잘못된 URL입니다")
            } catch GettingHTMLError.urlSeesionError {
                print("데이터를 가져오는 데 문제 발생")
            } catch {
                print("알 수 없는 오류 발생")
            }
        }
        
    }
    
    @IBAction func dongkyung(_ sender: Any) {
        Task {
            do {
                let data: Data = try await requestHTML(from: "https://github.com/dongykung")
                if let result: String = String(data: data, encoding: .utf8) {
                    resultTextView.text = result
                }
                
            } catch GettingHTMLError.urlError {
                print("잘못된 URL입니다")
            } catch GettingHTMLError.urlSeesionError {
                print("데이터를 가져오는 데 문제 발생")
            } catch {
                print("알 수 없는 오류 발생")
            }
        }
        
    }
    
    @IBAction func jungmin(_ sender: Any) {
        Task {
            do {
                let data: Data = try  await requestHTML(from: "https://github.com/Jeolmi123")
                if let result: String = String(data: data, encoding: .utf8) {
                    resultTextView.text = result
                }
                
            } catch GettingHTMLError.urlError {
                print("잘못된 URL입니다")
            } catch GettingHTMLError.urlSeesionError {
                print("데이터를 가져오는 데 문제 발생")
            } catch {
                print("알 수 없는 오류 발생")
            }
        }
        
    }
    
    
    
    func requestHTML(from urlString: String) async throws -> Data {
       
        guard let url = URL(string: urlString) else {
            throw GettingHTMLError.urlError
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw GettingHTMLError.urlSeesionError
        }
    }
    
}

