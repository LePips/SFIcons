import SwiftUI

class UISFIconTextField: UITextField {

    override var textInputContextIdentifier: String? {
        ""
    }

    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                return mode
            }
        }
        return nil
    }
}

/// `UITextField` that will automatically open with the emoji keyboard
public struct SFIconEmojiTextField: UIViewRepresentable {

    @Binding
    private var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public func makeUIView(context: Context) -> some UIView {
        let textField = UISFIconTextField()

        textField.delegate = context.coordinator

        return textField
    }

    public func updateUIView(_ uiView: UIViewType, context: Context) {}

    public func makeCoordinator() -> Coordinator {
        Coordinator(text: _text)
    }

    public class Coordinator: NSObject, UITextFieldDelegate {

        @Binding
        var text: String

        init(text: Binding<String>) {
            self._text = text
        }

        public func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text?.uppercased() ?? ""
        }

        public func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.text = nil
            text = ""
        }

        public func textFieldDidEndEditing(_ textField: UITextField) {
            textField.text = nil
            text = ""
        }
    }
}
