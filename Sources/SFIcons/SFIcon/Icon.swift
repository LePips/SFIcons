//
//  Icon.swift
//  SFIcons
//

import Foundation

extension SFIcon {
    
    enum Icon: Codable, Equatable, Hashable {
        
        case string(String)
        case sfSymbol(systemName: String)
        
        func isSameCase(_ rhs: Icon) -> Bool {
            switch (self, rhs) {
            case (.string, .string):
                true
            case (.sfSymbol, .sfSymbol):
                true
            default:
                false
            }
        }
        
        static func ==(lhs: Icon, rhs: Icon) -> Bool {
            switch (lhs, rhs) {
            case (.string(let ls), .string(let rs)):
                ls == rs
            case (.sfSymbol(systemName: let lsn), .sfSymbol(systemName: let rsn)):
                lsn == rsn
            default:
                false
            }
        }
    }
}
