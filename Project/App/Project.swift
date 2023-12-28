import ProjectDescription
import ProjectDescriptionHelpers

let targetList: [Target] = [
  .init(
    name: "Threads QA",
    destinations: Destinations.iOS,
    product: .app, 
    bundleId: "com.sro.threads",
    deploymentTargets: .iOS("17.0"),
    infoPlist: .extendingDefault(with: infoValue),
    sources: ["Sources/**"],
    resources: ["Resources/**"],
    dependencies: compositeDependency,
    settings: .defaultConfigSettings(true)),
]

let project: Project = .init(
  name: "Threads",
  organizationName: "sro",
  packages: [
    .package(
      url: "https://github.com/firebase/firebase-ios-sdk.git",
      .upToNextMajor(from: "10.19.0")),
    .local(path: "../Core/Architecture"),
    .local(path: "../Core/DesignSystem"),
    .local(path: "../Core/Domain"),
    .local(path: "../Core/Functor"),
    .local(path: "../Core/Platform"),
    .local(path: "../Feature/Threads"),
    .local(path: "../Feature/Dashboard"),
  ],
  settings: .settings(),
  targets: targetList,
  schemes: [])

private var compositeDependency: [TargetDependency] {
  [
    .package(product: "FirebaseCrashlytics"),
    .package(product: "FirebaseAnalytics"),
    .package(product: "FirebasePerformance"),
    .package(product: "Architecture"),
    .package(product: "DesignSystem"),
    .package(product: "Domain"),
    .package(product: "Functor"),
    .package(product: "Platform"),
    .package(product: "Threads"),
    .package(product: "Dashboard"),
  ]
}
