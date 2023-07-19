![banner](https://github.com/LePips/SFIcons/assets/20747774/0416bc57-292f-4c35-9438-7fdcfb098e7a)

# SFIcons

Generate simple icons using SFSymbols, emojis, or text. Just like Contacts and Reminders!

## Usage

Create an `SFIcon` definition and use within an `SFIconview`. Text modifiers still apply to the underlying `SFSymbol` image and `Text`.

```swift
let sfIcon: SFIcon = SFIcon(
    icon: .sfSymbol(systemName: "list.bullet"),
    iconStyle: .color(.white),
    shape: .circle,
    shapeStyle: .color(.red)
)

// ... in `View`

var body: some View {
    SFIconView(sfIcon: sfIcon)
        .fontWeight(.heavy)
}
```

### Customization

An icon can be a defined `SFSymbol` or `String`. The view can fit about 2 uppercased characters comfortably.

| `.sfSymbol("figure.run")`  | `.string("😂")` | `.string("SJ")` |
| ------------- | ------------- | ------------- |
| <img width="200" alt="29DE0B2C-2FBE-494A-8ECD-E78F8A1E16D8" src="https://github.com/LePips/SFIcons/assets/20747774/cf4198bd-62e4-4716-84c0-2c68e80e8875"> | <img width="200" alt="0AC4AB47-0865-4DA6-A9A7-FCB9D2289476" src="https://github.com/LePips/SFIcons/assets/20747774/84cce308-d0e8-49dc-8e5a-14310899b6bd">  | <img width="200" alt="88512527-A41A-4F0F-83C5-F7FD902647D0" src="https://github.com/LePips/SFIcons/assets/20747774/efc25e58-692a-4509-995f-d9ec4c7c7245"> |

## Example

A sample project is provided for iOS, tvOS, and macOS. tvOS and macOS will generate a random icon and iOS has a customizable view that replicates the list creation from Reminders with emoji and text icon input.

<img width="30%" alt="iOS example" src="https://github.com/LePips/SFIcons/assets/20747774/894b7bd8-0176-4e41-992e-79182564926c">
