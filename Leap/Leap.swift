//
//  Leap.swift
//  Leap
//
//  Created by Christian Otkjær on 08/09/2018.
//  Copyright © 2018, Silverback IT. All rights reserved.
//

import Foundation
/** Checks if the (gregorian) year is a leap year
 - parameter year: the gregorian year to check
 - returns: true if it is a leap yeear, false if not
 */
public func isLeapYear(_ year: Int) -> Bool
{
    guard year > 0 else { return false }
    
    if year % 400 == 0 { return true }
    
    if year % 100 == 0 { return false }
    
    return year % 4 == 0
}

// MARK: - Leap

let PrivateGregorianCalendar = Calendar(identifier: .gregorian)

extension Date
{
    var gregorianYear: Int {
        return PrivateGregorianCalendar.component(.year, from: self)
    }
    
    var gregorianMonth: Int {
        return PrivateGregorianCalendar.component(.month, from: self)
    }
    
    var gregorianDayOfMonth: Int {
        return PrivateGregorianCalendar.component(.day, from: self)
    }
    
    /** ture if the date is in a gregorian leap day, false otherwise */
    public var isInLeapYear : Bool
    {
        return isLeapYear(gregorianYear)
    }
    
    /** ture if the date is in a gregorian leap day, false otherwise */
    public var isInLeapDay : Bool
    {
        guard isInLeapYear else { return false }
        
        guard gregorianMonth == 2 else { return false }
        
        return gregorianDayOfMonth == 29
    }
}
