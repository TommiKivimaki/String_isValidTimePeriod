import XCTest
@testable import String_isValidTimePeriod

final class String_isValidTimePeriodTests: XCTestCase {
    func testIsValidTimePeriod() {
      // Valid strings .dayMonth
      XCTAssertTrue("1.1 - 31.12".isValidTimePeriod())
      XCTAssertTrue("1.2. - 3.11.".isValidTimePeriod())
      XCTAssertTrue("11.11. - 4.5.".isValidTimePeriod(.dayMonth))
      XCTAssertTrue("9.3   -      2.1".isValidTimePeriod(.dayMonth))
      XCTAssertTrue("9.3.   -      2.1.".isValidTimePeriod(.dayMonth))
      
      // Valid strings .dayMonthYear
      XCTAssertTrue("1.1.2020 - 31.12.2020".isValidTimePeriod(.dayMonthYear))
      
      
      // Invalid strings .dayMonth
      XCTAssertFalse("".isValidTimePeriod())
      XCTAssertFalse(" - ".isValidTimePeriod())
      XCTAssertFalse("a.b - c.d".isValidTimePeriod(.dayMonth))
      XCTAssertFalse("1.1. - 31.12.  ".isValidTimePeriod(.dayMonth))
      
      // Invalid strings .dayMonthYear
      XCTAssertFalse("1.1. -31.12.".isValidTimePeriod(.dayMonthYear))
      XCTAssertFalse("1.1.2020. - 31.12.2020.".isValidTimePeriod(.dayMonthYear))
    }

    static var allTests = [
        ("testIsValidTimePeriod", testIsValidTimePeriod),
    ]
}
