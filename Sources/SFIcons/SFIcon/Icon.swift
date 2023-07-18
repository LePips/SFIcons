import Foundation

public extension SFIcon {

    enum Icon: Codable, Equatable, Hashable {

        case string(String)
        case sfSymbol(systemName: String)

        public func isSameCase(_ rhs: Icon) -> Bool {
            switch (self, rhs) {
            case (.string, .string):
                return true
            case (.sfSymbol, .sfSymbol):
                return true
            default:
                return false
            }
        }

        public static func == (lhs: Icon, rhs: Icon) -> Bool {
            switch (lhs, rhs) {
            case let (.string(ls), .string(rs)):
                return ls == rs
            case let (.sfSymbol(systemName: lsn), .sfSymbol(systemName: rsn)):
                return lsn == rsn
            default:
                return false
            }
        }
    }
}
