//
//  LeapTests.swift
//  LeapTests
//
//  Created by Christian Otkjær on 08/09/2018.
//  Copyright © 2018, Silverback IT. All rights reserved.
//

import XCTest
@testable import Leap

let GregorianCalendar = Calendar(identifier: .gregorian)

class LeapTests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

let leapYearsFrom1800To2400 = [1804, 1808, 1812, 1816, 1820, 1824, 1828, 1832, 1836, 1840, 1844, 1848, 1852, 1856, 1860, 1864, 1868, 1872, 1876, 1880, 1884, 1888, 1892, 1896, 1904, 1908, 1912, 1916, 1920, 1924, 1928, 1932, 1936, 1940, 1944, 1948, 1952, 1956, 1960, 1964, 1968, 1972, 1976, 1980, 1984, 1988, 1992, 1996, 2000, 2004, 2008, 2012, 2016, 2020, 2024, 2028, 2032, 2036, 2040, 2044, 2048, 2052, 2056, 2060, 2064, 2068, 2072, 2076, 2080, 2084, 2088, 2092, 2096, 2104, 2108, 2112, 2116, 2120, 2124, 2128, 2132, 2136, 2140, 2144, 2148, 2152, 2156, 2160, 2164, 2168, 2172, 2176, 2180, 2184, 2188, 2192, 2196, 2204, 2208, 2212, 2216, 2220, 2224, 2228, 2232, 2236, 2240, 2244, 2248, 2252, 2256, 2260, 2264, 2268, 2272, 2276, 2280, 2284, 2288, 2292, 2296, 2304, 2308, 2312, 2316, 2320, 2324, 2328, 2332, 2336, 2340, 2344, 2348, 2352, 2356, 2360, 2364, 2368, 2372, 2376, 2380, 2384, 2388, 2392, 2396, 2400]
    
    func test_leap_years_from_1800_to_2400()
    {
        for year in 1800...2400
        {
            XCTAssertEqual(leapYearsFrom1800To2400.contains(year), isLeapYear(year))
        }
    }
    
    func test_finge_leap_years()
    {
        XCTAssertFalse(isLeapYear(-1))
        XCTAssertFalse(isLeapYear(1))
        XCTAssertTrue(isLeapYear(4))
        XCTAssertTrue(isLeapYear(400004))
        
    }
    
    func test_non_leap_day_in_non_leap_year_date() {
        
        let c1 = DateComponents(calendar: GregorianCalendar, year: 2331, month: 2, day: 28)
        guard let d1 = GregorianCalendar.date(from: c1) else { XCTFail("Could not make date"); return }
        
        XCTAssertFalse(d1.isInLeapDay)
        XCTAssertFalse(d1.isInLeapYear)
    }

    func test_non_leap_day_in_leap_year_date() {
        
        let c1 = DateComponents(calendar: GregorianCalendar, year: 1968, month: 2, day: 28)
        guard let d1 = GregorianCalendar.date(from: c1) else { XCTFail("Could not make date"); return }
        
        XCTAssertFalse(d1.isInLeapDay)
        XCTAssertTrue(d1.isInLeapYear)
    }
    
    func test_leap_day_date() {
        
        let c1 = DateComponents(calendar: GregorianCalendar, year: 1968, month: 2, day: 29)
        guard let d1 = GregorianCalendar.date(from: c1) else { XCTFail("Could not make date"); return }
        
        XCTAssertTrue(d1.isInLeapDay)
        XCTAssertTrue(d1.isInLeapYear)
    }
}
