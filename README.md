![banner](https://github.com/LePips/SFIcons/assets/20747774/ec99dcc9-7eb6-4789-b9fc-7f554b11adbe)

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
| <img width="200" alt="sfSymbol Example" src="https://github.com/LePips/SFIcons/assets/20747774/7cbd9321-23e0-4109-84eb-25c17d2f1aac">  | <img width="200" alt="string emoji example" src="https://github.com/LePips/SFIcons/assets/20747774/2b10ab70-eb75-476e-b7a5-6feaf9d0609c">  | <img width="200" alt="string initials example" src="https://github.com/LePips/SFIcons/assets/20747774/bf6cc3a3-11d5-477b-90c2-57434a53ecd5"> |

## Example

A sample project is provided for iOS, tvOS, and macOS. tvOS and macOS will generate a random icon and iOS has a customizable view that replicates the list creation from Reminders with emoji and text icon input.

<img width="30%" alt="iOS example" src="https://github.com/LePips/SFIcons/assets/20747774/75870428-e046-45b7-86dc-87400df3fc09">
