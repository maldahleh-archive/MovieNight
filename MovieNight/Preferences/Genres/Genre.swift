//
//  Genre.swift
//  MovieNight
//
//  Created by Mohammed Al-Dahleh on 2018-01-29.
//  Copyright © 2018 Mohammed Al-Dahleh. All rights reserved.
//

protocol Genre {
    static var Count: Int { get }
    var name: String { get }
    var id: Int { get }
}
