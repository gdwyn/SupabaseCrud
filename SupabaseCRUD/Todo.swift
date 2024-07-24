//
//  ToDo.swift
//  SupabaseCRUD
//
//  Created by Godwin IE on 23/07/2024.
//

import Foundation

struct Todo: Identifiable, Codable, Equatable {
    let id: Int
    let title: String
    let done: Bool
}
