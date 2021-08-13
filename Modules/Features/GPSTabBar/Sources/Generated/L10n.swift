// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import GPSExtensions

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum S {

  internal enum TabBar {
    internal enum Item {
      internal enum Favorite {
        /// star
        internal static let imageName = S.tr("Localizable", "TabBar.Item.Favorite.ImageName")
        /// star.fill
        internal static let selectedImageName = S.tr("Localizable", "TabBar.Item.Favorite.SelectedImageName")
        /// Favoritos
        internal static let title = S.tr("Localizable", "TabBar.Item.Favorite.Title")
      }
      internal enum Home {
        /// house
        internal static let imageName = S.tr("Localizable", "TabBar.Item.Home.ImageName")
        /// house.fill
        internal static let selectedImageName = S.tr("Localizable", "TabBar.Item.Home.SelectedImageName")
        /// Home
        internal static let title = S.tr("Localizable", "TabBar.Item.Home.Title")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension S {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = GenericBundle.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class GenericBundle {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle.resourceBundle(for: GenericBundle.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
