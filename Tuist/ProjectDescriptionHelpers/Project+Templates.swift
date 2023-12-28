import Foundation
import ProjectDescription
//
//extension Target {
//  static func previewTarget(
//    projectName: String,
//    dependencies: [TargetDependency])
//    -> Self
//  {
//    .init(
//      name: "\(projectName)Preview",
//      platform: .iOS,
//      product: .app,
//      bundleId: "com.sro.threads.\(projectName.lowercased()).preview",
//      deploymentTarget: .iOS(targetVersion: "17.0", devices: DeploymentDevice.iphone),
//      infoPlist: .extendingDefault(with: infoValue),
//      sources: ["Sources/**"],
//      resources: ["Resources/**"],
//      dependencies: dependencies,
//      settings: .defaultConfigSettings(true))
//  }
//
//  static func previewTestTarget(projectName: String) -> Self {
//    .init(
//      name: "\(projectName)PreviewTests",
//      platform: .iOS,
//      product: .unitTests,
//      bundleId: "com.sro.threads.\(projectName.lowercased()).preview.tests",
//      deploymentTarget: .iOS(targetVersion: "17.0", devices: .iphone),
//      sources: ["Tests/**"],
//      dependencies: [
//        .target(name: "\(projectName)Preview"),
//      ],
//      settings: .defaultConfigSettings(true))
//  }
//}
//
//extension Collection<Scheme> {
//
//  public static func testScheme(previewTestTarget: String) -> [Scheme] {
//    [
//      .init(
//        name: "\(previewTestTarget)Preview",
//        shared: true,
//        hidden: false,
//        buildAction: .init(targets: ["\(previewTestTarget)Preview"]),
//        testAction: .targets(["\(previewTestTarget)PreviewTests"])),
//    ]
//  }
//}
//
extension Settings {
  public static var defaultConfigSettings: (Bool) -> Settings {
    { isDev in
      .settings(
        base: [
          "CODE_SIGN_IDENTITY": "iPhone Developer",
          "CODE_SIGN_STYLE": "Automatic",
          "ASSETCATALOG_COMPILER_GENERATE_SWIFT_ASSET_SYMBOL_EXTENSIONS": "YES",
          "Mode": isDev ? "Development" : "Production",
        ], configurations: [], defaultSettings: .recommended)
    }
  }
}
//
//extension Project {
//
//  public static func previewProject(
//    projectName: String,
//    packages: [Package],
//    dependencies: [TargetDependency])
//    -> Self
//  {
//    .init(
//      name: "\(projectName)Preview",
//      organizationName: "sro",
//      packages: packages,
//      targets: [
//        .previewTarget(projectName: projectName, dependencies: dependencies),
//        .previewTestTarget(projectName: projectName),
//      ],
//      schemes: .testScheme(previewTestTarget: projectName))
//  }
//}
//
public var infoValue: [String: Plist.Value] {
  defaultInfoValue
    .merging(customPropertyInfoValue) { $1 }
}

var defaultInfoValue: [String: Plist.Value] {
  [
    "CFBundleDevelopmentRegion": "$(DEVELOPMENT_LANGUAGE)",
    "CFBundleDisplayName": "${PRODUCT_NAME}",
    "CFBundleShortVersionString": .string(.appVersion()),
    "CFBundleVersion": .string(.appBuildVersion()),
    "LSHasLocalizedDisplayName": .boolean(true),
    "UIApplicationSupportsMultipleScenes": .boolean(false),
    "UISupportedInterfaceOrientations": .array([
      "UIInterfaceOrientationPortrait",
    ]),
    "UISupportedInterfaceOrientations~ipad": .array([
      "UIInterfaceOrientationPortrait",
      "UIInterfaceOrientationLandscapeLeft",
      "UIInterfaceOrientationLandscapeRight",
    ]),
    "UIStatusBarHidden": .boolean(true),
    "UIRequiresFullScreen": .boolean(true),
    "LSRequiresIPhoneOS": .boolean(true),
    "UIApplicationSceneManifest": .dictionary([
      "UIApplicationSupportsMultipleScenes": .boolean(false),
    ]),
    "LSMinimumSystemVersion": "13.3",
    "UIApplicationSupportsIndirectInputEvents": .boolean(true),
    "UILaunchScreen": .dictionary([:]),
    "UISceneConfigurations": .dictionary([
      "UIApplicationSupportsMultipleScenes": .boolean(false),
      "UISceneConfigurations": .dictionary([
        "UIWindowSceneSessionRoleApplication": .array([.dictionary([
          "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate",
        ])]),
      ]),
    ]),
    "ITSAppUsesNonExemptEncryption": .boolean(false),
    "NSAppTransportSecurity": .dictionary([
      "NSAllowsArbitraryLoads": .boolean(true),
    ]),
  ]
}

var customPropertyInfoValue: [String: Plist.Value] {
  [
    "Mode": .string("$(Mode)"),
  ]
}

extension String {

  public static func appVersion() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yy.MM.dd"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter.string(from: Date())
  }

  public static func appBuildVersion() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMddHHmmsss"
    formatter.locale = Locale(identifier: "ko_KR")
    return formatter.string(from: Date())
  }
}
