//
//  SRP.swift
//  DesignPatterns
//
//  Created by Lev Bondarenko on 03.02.2023.
//

import Foundation
protocol NewsURLBuilder {
    func getNews() -> URL
}

protocol NewsParser {
    func parse(data: Data) -> [News]
}

struct News: Codable {
    let id: Int
    let title: String
}

enum SRP {}

extension SRP {
    class NewsServiceIncorrect {
        func getNews(completion: @escaping ([News]) -> Void) {
            // Создание запроса
            
            guard let url = URL(string: "some/url") else {
                assertionFailure("bad url")
                return
            }
            let request = URLRequest(url: url)
            
            // Отправка данных
            let dataTask = URLSession.shared.dataTask(
                with: url)
            { data, response, error in
                    // 3. Парсинг
                
                guard let data = data,
                      let news = try? JSONDecoder().decode(
                        [News].self,
                        from: data
                      ) else {
                    completion([])
                    return
                }
                
                completion(news)
            }
            
            dataTask.resume()
        }
    }
}

extension SRP {
    class NewsServiceCorrect {
        private let requestBuilder: NewsURLBuilder
        private let parser: NewsParser
        
        init(requestBuilder: NewsURLBuilder, parser: NewsParser) {
            self.requestBuilder = requestBuilder
            self.parser = parser
        }
        
        func getNews(completion: @escaping ([News]) -> Void) {
            // Создание запроса c билдером
            let url = requestBuilder.getNews()
            
            // Отправка данных
            let dataTask = URLSession.shared.dataTask(
                with: url)
            { [weak self] data, response, error in
                    // 3. Парсинг
                guard let data = data, let self = self else {
                    completion([])
                    return
                }
                
                completion(self.parser.parse(data: data))
            }
            
            dataTask.resume()
        }
    }
}




