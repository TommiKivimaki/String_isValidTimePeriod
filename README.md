# String_isValidTimePeriod

Extension on String. Uses regex to check if a string matches time period formats. 

* "1.1 - 31.12"
* "1.1. - 31.12."
* "1.1.2020 - 31.12.2020"
 
Extra white space between the dates is ignored. 

There's a enum to select if years are included in the time period.

## Usage

```swift
"1.1. - 4.5.".isValidTimePeriod(.dayMonth)
```
