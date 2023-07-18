import Foundation

// https://stackoverflow.com/a/39425959

extension Character {

    var isSimpleEmoji: Bool {
        guard let firstScalar = unicodeScalars.first else { return false }
        return firstScalar.properties.isEmoji && firstScalar.value > 0x238C
    }

    var isCombinedIntoEmoji: Bool {
        unicodeScalars.count > 1 && unicodeScalars.first?.properties.isEmoji ?? false
    }

    var isEmoji: Bool {
        isSimpleEmoji || isCombinedIntoEmoji
    }
}

extension String {

    public var isSingleEmoji: Bool {
        count == 1 && containsEmoji
    }

    var containsEmoji: Bool {
        contains { $0.isEmoji }
    }

    var containsOnlyEmoji: Bool {
        !isEmpty && !contains { !$0.isEmoji }
    }

    func character(at offset: Int) -> Element? {

        if offset >= count {
            return nil
        }

        let index = self.index(startIndex, offsetBy: offset)
        return self[index]
    }

    public static func randomEmoji() -> String {
        String(Character(contiguousEmoji.randomElement()!))
    }
}

private let contiguousEmoji: [UnicodeScalar] = {

    let ranges: [ClosedRange<Int>] = [
        0x1F600 ... 0x1F64F,
        0x1F680 ... 0x1F6C5,
        0x1F6CB ... 0x1F6D2,
        0x1F6E0 ... 0x1F6E5,
        0x1F6F3 ... 0x1F6FA,
        0x1F7E0 ... 0x1F7EB,
        0x1F90D ... 0x1F93A,
        0x1F93C ... 0x1F945,
        0x1F947 ... 0x1F971,
        0x1F973 ... 0x1F976,
        0x1F97A ... 0x1F9A2,
        0x1F9A5 ... 0x1F9AA,
        0x1F9AE ... 0x1F9CA,
        0x1F9CD ... 0x1F9FF,
        0x1FA70 ... 0x1FA73,
        0x1FA78 ... 0x1FA7A,
        0x1FA80 ... 0x1FA82,
        0x1FA90 ... 0x1FA95,
    ]

    return ranges.reduce([], +).map { UnicodeScalar($0)! }
}()
