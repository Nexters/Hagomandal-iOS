import ProjectDescription

extension Project {

    /// Helper function to create the application target and the unit test target.
    public static func makeAppTarget(name: String, dependencies: [TargetDependency]) -> Target {
        
        let infoPlist: [String: InfoPlist.Value] = [
            "CFBundleShortVersionString": "1.0",
            "CFBundleVersion": "1",
            "UIMainStoryboardFile": "",
            "UILaunchStoryboardName": ""
        ]

        let target = Target(
            name: name,
            platform: .iOS,
            product: .app,
            bundleId: "io.Nexters.\(name)",
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: dependencies
        )

        return target
    }
}
