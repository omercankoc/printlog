import XCTest
@testable import printlog

final class printlogTests: XCTestCase {
    func testExample() throws {
        Printlog.trace("Appropriate for messages that contain information only when debugging a program.")
        Printlog.debug("Appropriate for messages that contain information normally of use only when debugging a program.")
        Printlog.information("Appropriate for informational messages.")
        Printlog.notice("Appropriate for conditions that are not error conditions, but that may require special handling.")
        Printlog.warning("Appropriate for messages that are not error conditions, but more severe than .notice")
        Printlog.error("Appropriate for error conditions.")
        Printlog.critical("Appropriate for critical error conditions that usually require immediate attention.")
    }
}
