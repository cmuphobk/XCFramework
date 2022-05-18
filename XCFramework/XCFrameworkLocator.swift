import Foundation
import XCFrameworkChild

public final class XCFrameworkLocator {
    private let child: XCFrameworkChildLocator
    public init() {
        print("XCFrameworkLocator initialized")
        child = XCFrameworkChildLocator()
    }
    public func doWork() {
        print("XCFrameworkLocator doWorked")
        child.doWork()
    }
    public static func doWork() {
        print("XCFrameworkLocator static doWorked")
        XCFrameworkChildLocator.doWork()
    }
}
