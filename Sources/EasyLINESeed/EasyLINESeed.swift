import SwiftUI

@frozen enum FontError: Error {
    case fontRegistrationError
    case makeError
}

@frozen public struct LINEType {
    public static let bold = Self.init(fontName: "LINESeedJP_A_OTF_Bd", weight: UIFont.Weight.bold)
    public static let extraBold = Self.init(fontName: "LINESeedJP_A_OTF_Eb", weight: UIFont.Weight.black)
    public static let regular = Self.init(fontName: "LINESeedJP_A_OTF_Rg", weight: UIFont.Weight.regular)
    public static let thin = Self.init(fontName: "LINESeedJP_A_OTF_Th", weight: UIFont.Weight.thin)
    let familyname: String = "LINE Seed JP App_OTF"
    let fontName: String
    let weight: UIFont.Weight

    private init(fontName: String, weight: UIFont.Weight) {
        self.weight = weight
        self.fontName = fontName
        do {
            try register(fontName: fontName)
        } catch(let fontError) {
            fatalError(fontError.localizedDescription)
        }
    }

    private func register(fontName: String) throws {
        guard let asset = NSDataAsset(name: fontName, bundle: Bundle.module),
              let provider = CGDataProvider(data: asset.data as NSData),
              let font = CGFont(provider),
              CTFontManagerRegisterGraphicsFont(font, nil) else {
            throw FontError.fontRegistrationError
        }
    }
}

public extension Font {
    struct LINESeed {
        private static func convertFontWeight(_ weight: UIFont.Weight) -> Font.Weight {
            switch weight {
            case .ultraLight:
                return .ultraLight
            case .light:
                return .light
            case .thin:
                return .thin
            case .regular:
                return .regular
            case .semibold:
                return .semibold
            case .bold:
                return .bold
            case .heavy:
                return .heavy
            case .black:
                return .black
            default:
                return .regular
            }
        }
        public static func fixed(_ lineType: LINEType,
                                     size: CGFloat) -> Font {
            return Font.custom(lineType.familyname, fixedSize: size)
                .weight(convertFontWeight(lineType.weight))
        }

        public static func relative(_ lineTYpe: LINEType,
                                        size: CGFloat,
                                        relativeTo textStyle: Font.TextStyle) -> Font {
            return Font.custom(lineTYpe.familyname, size: size, relativeTo: textStyle)
                .weight(convertFontWeight(lineTYpe.weight))
        }

        public static var largeTitle: Font {
            makeFont(.largeTitle, lineType: .extraBold)
        }

        public static var title: Font {
            makeFont(.title, lineType: .bold)
        }

        public static var subTitle: Font {
            makeFont(.title2, lineType: .bold)
        }

        public static var body: Font {
            makeFont(.body, lineType: .regular)
        }

        public static var footnote: Font {
            makeFont(.footnote, lineType: .thin)
        }

        private static func makeFont(_ style: Font.TextStyle, lineType: LINEType) -> Font {
            let textStyle: UIFont.TextStyle
            switch style {
            case .largeTitle:
                textStyle = .largeTitle
            case .title:
                textStyle = .title1
            case .title2:
                textStyle = .title2
            case .title3:
                textStyle = .title3
            case .headline:
                textStyle = .headline
            case .subheadline:
                textStyle = .subheadline
            case .body:
                textStyle = .body
            case .callout:
                textStyle = .callout
            case .footnote:
                textStyle = .footnote
            case .caption:
                textStyle = .caption1
            case .caption2:
                textStyle = .caption2
            @unknown default:
                textStyle = .body
            }
            let size = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle).pointSize
            return fixed(lineType, size: size)
        }
    }
}

#if os(iOS)
public extension UIFont {
    struct LINESeed {
        public static func custom(_ lineType: LINEType, size: CGFloat) -> UIFont {
            var attributes = UIFontDescriptor(name: lineType.fontName, size: size).fontAttributes
            var traits = (attributes[.traits] as? [UIFontDescriptor.TraitKey: Any]) ?? [:]

            traits[.weight] = lineType.weight
            attributes[.name] = nil
            attributes[.traits] = traits
            attributes[.family] = lineType.familyname

            let descriptor = UIFontDescriptor(fontAttributes: attributes)

            return UIFont(descriptor: descriptor, size: size)
        }

        public static var largeTitle: UIFont {
            makeUIFont(.largeTitle, lineType: .extraBold)
        }

        public static var title: UIFont {
            makeUIFont(.title1, lineType: .bold)
        }

        public static var subTitle: UIFont {
            makeUIFont(.title2, lineType: .bold)
        }

        public static var body: UIFont {
            makeUIFont(.body, lineType: .regular)
        }

        public static var footnote: UIFont {
            makeUIFont(.footnote, lineType: .thin)
        }

        private static func makeUIFont(_ style: UIFont.TextStyle, lineType: LINEType) -> UIFont {
            let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: style)
            return custom(lineType, size: descriptor.pointSize)
        }
    }
}
#endif
