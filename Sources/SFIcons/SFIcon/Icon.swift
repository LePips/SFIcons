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

        static func == (lhs: Icon, rhs: Icon) -> Bool {
            switch (lhs, rhs) {
            case let (.string(ls), .string(rs)):
                ls == rs
            case let (.sfSymbol(systemName: lsn), .sfSymbol(systemName: rsn)):
                lsn == rsn
            default:
                false
            }
        }
    }
}
