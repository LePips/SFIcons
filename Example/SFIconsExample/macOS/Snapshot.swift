import AppKit
import SwiftUI

// https://cindori.com/developer/screenshot-view-swiftui

extension View {

    func snapshot() -> NSImage? {
        let view = NoInsetHostingView(rootView: self)
        view.setFrameSize(view.fittingSize)
        return view.bitmapImage()
    }
}

/* We're not exactly sure why this is needed, but with just a normal
 NSHostingView the image has undesired insets, and this fixes it. */
class NoInsetHostingView<V>: NSHostingView<V> where V: View {
    override var safeAreaInsets: NSEdgeInsets {
        .init()
    }
}

extension NSView {

    func bitmapImage() -> NSImage? {
        guard let rep = bitmapImageRepForCachingDisplay(in: bounds) else {
            return nil
        }
        cacheDisplay(in: bounds, to: rep)
        guard let cgImage = rep.cgImage else {
            return nil
        }
        return NSImage(cgImage: cgImage, size: bounds.size)
    }
}

extension NSImage {

    var pngData: Data? {
        guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
        return bitmapImage.representation(using: .png, properties: [:])
    }

    // nil pngData error would be lost but whatever
    func pngWrite(to url: URL, options: Data.WritingOptions = .atomic) throws {
        try pngData?.write(to: url, options: options)
    }
}
