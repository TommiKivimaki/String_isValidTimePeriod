import Foundation

extension String {
  enum ValidTimePeriodType { case dayMonth, dayMonthYear }
  
  /// Checks if the format of a time period is "day.month - day.month"
  /// Does not check is dates exist in a calendar
  /// Valid periods with any number of whitespace between dates:
  /// * "1.1 - 2.2"
  /// * "1.1. - 2.2."
  /// * "1.1.2020 - 31.12.2020"
  /// - Throws: Invalid regex error
  /// - Returns: True if time period is valid else false
  func isValidTimePeriod(_ type: ValidTimePeriodType = .dayMonth) -> Bool {
    
    // Default to .dayMonth
    var pattern = #"[0-9]{1,2}\.[0-9]{1,2}\.? *- *[0-9]{1,2}\.[0-9]{1,2}\.?$"#
    
    if type == .dayMonthYear {
      pattern = #"[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4} *- *[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{4}$"#
    }
    
    let range = NSRange(location: 0, length: self.utf8.count)
    
    let regex = try! NSRegularExpression(pattern: pattern)
    return regex.firstMatch(in: self, options: [], range: range) != nil
  }
}
