//
//  PostData.swift
//  BizNews
//
//  Created by 윤진영 on 7/19/24.
//

import Foundation

struct Results: Decodable {
    let articles: [Post]
}

struct Post: Decodable, Identifiable {
    let id = UUID() //ID가 없으니까, 고유의 아이디 생성
    let title: String
    let author: String
    let url: String
    
}
