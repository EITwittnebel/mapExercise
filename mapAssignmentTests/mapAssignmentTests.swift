//
//  mapAssignmentTests.swift
//  mapAssignmentTests
//
//  Created by Field Employee on 4/29/20.
//  Copyright © 2020 Field Employee. All rights reserved.
//

import XCTest
import MapKit
@testable import mapAssignment

class mapAssignmentTests: XCTestCase {

  var mapController: MapViewController = MapViewController()
  let myMap = MKMapView()
  
  func testNumPins() {
    mapController.mapView = myMap
    mapController.setupAnnos()
    XCTAssert(mapController.mapView.annotations.count == locations.count)
  }
  
  func testLocationData() {
    mapController.mapView = myMap
    mapController.setupAnnos()
    var foundAll: Bool = false
    var foundCurr: Bool = false
    for i in 0..<locations.count {
      for j in 0..<mapController.mapView.annotations.count {
        if mapController.mapView.annotations[j].title == locations[i].name {
          foundCurr = true
        }
      }
      if !foundCurr {
        break
      }
      if i == locations.count - 1 {
        foundAll = true
      }
    }
    XCTAssert(foundAll)
  }

  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
