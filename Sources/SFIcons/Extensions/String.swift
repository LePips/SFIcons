//
//  String.swift
//  SFIcons
//

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
    
    var isSingleEmoji: Bool {
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
    
    static func randomEmoji() -> String {
        String(Character(contiguousEmoji.randomElement()!))
    }
}

fileprivate let contiguousEmoji: [UnicodeScalar] = {
    
    let ranges: [ClosedRange<Int>] = [
        0x1f600...0x1f64f,
        0x1f680...0x1f6c5,
        0x1f6cb...0x1f6d2,
        0x1f6e0...0x1f6e5,
        0x1f6f3...0x1f6fa,
        0x1f7e0...0x1f7eb,
        0x1f90d...0x1f93a,
        0x1f93c...0x1f945,
        0x1f947...0x1f971,
        0x1f973...0x1f976,
        0x1f97a...0x1f9a2,
        0x1f9a5...0x1f9aa,
        0x1f9ae...0x1f9ca,
        0x1f9cd...0x1f9ff,
        0x1fa70...0x1fa73,
        0x1fa78...0x1fa7a,
        0x1fa80...0x1fa82,
        0x1fa90...0x1fa95,
    ]
    
    return ranges.reduce([], +).map { return UnicodeScalar($0)! }
}()


extension UnsafeMutableRawPointer {
    
    public var asEmoji: String {
        // Inspired by https://gist.github.com/iandundas/59303ab6fd443b5eec39
        let index = abs(self.hashValue) % contiguousEmoji.count
        return String(contiguousEmoji[index])
    }
}
