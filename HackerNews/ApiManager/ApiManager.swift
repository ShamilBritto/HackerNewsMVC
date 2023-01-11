//
//  ApiManager.swift
//  HackerNews
//
//  Created by GGS-BKS on 10/01/23.
//

import Foundation

class ApiManager {
    

    func getNewsFrom(url: String , closure : @escaping (NewsModel) ->()){
        
        guard let serverURL = URL(string : url) else{
            print ("Server URL is not correct, Kindly recheck")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: serverURL)) {data, response, error in
            
            if error != nil{
                print ("Unable to fetch data from server , encontered error")
                return
            }
            //Convert data to model
            do{
                let hackerNewsList = try JSONDecoder().decode(NewsModel.self , from: data!)
                closure(hackerNewsList)
            } catch{
                print(error)
            }
        }.resume()
}
}
