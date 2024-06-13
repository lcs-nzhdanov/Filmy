//
//  SharedFunctions.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-06-12.
//

import Foundation

// Convert minutes into "xh xm"
func minutesToHours(lengthMinutes: Int) -> String {
    let hours: Int = lengthMinutes / 60
    let minutes: Int = lengthMinutes % 60
    
    return (minutes == 0 ? "\(hours)h": "\(hours)h \(minutes)m")
}


// Convert list into String with commas in between
func listToString(list: [String]) -> String {
    return list.joined(separator: ", ")
}
