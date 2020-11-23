//
//  AppDelegate.swift
//  Logger
//

import UIKit
import Logger

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        testLogger(launchOptions: launchOptions)

        return true
    }

    func testLogger(launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        // TODO: - Add a valid URL
        if let url = URL(string: "invalid remote log url") {
            let remoteOutput = RemoteOutput(logLevel: .debug, endpoint: url)
            remoteOutput.decorator = CustomRemoteLogDecorator()
            remoteOutput.bodyCreator = { details, finalMessage in
                return ["headerMessage": details.message,
                        "level": details.level,
                        "line": details.metaInfo.lineNumber,
                        "filename": details.metaInfo.fileName,
                        "details": finalMessage]
            }
            Log.default.addOutput(output: remoteOutput)
        }

        Log.default.addFormatter(CategoryFormatter())
        Log.default.addFormatter(MetaInfoFormatter())
        Log.default.addFormatter(PrefixFormatter())
        Log.default.addFormatter(PostfixFormatter())
        Log.default.addFilter(CategoryFilter(category: .dev))

        Log.debug(launchOptions)
        Log.debug("extra info test 1", category: "Custom Category")
        Log.debug("extra info test 2", category: .dev)

        Log.isPrivateDataLogEnabled = true
        Log.debug("Private data test 1: \(123, privacy: .private)")
        Log.isPrivateDataLogEnabled = false
        Log.debug("Private data test 2: \(123, privacy: .private)")

        let dummy = DummyClass()
        Log.debug("Private data test 3: \(dummy)")
    }
}
