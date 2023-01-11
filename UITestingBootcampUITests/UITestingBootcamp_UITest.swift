    //
    //  UITestingBootcamp_UITest.swift
    //  UITestingBootcampUITests
    //
    //  Created by Jiten Patel on 10/01/23.
    //

import XCTest

final class UITestingBootcamp_UITest: XCTestCase {
    
    let app = XCUIApplication()
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testContentViewSignUpButtonShouldNotSignIn(){
        
        // Given
        let addYourNameTextField = app.textFields["SignUpTextField"]
        
        // When
        addYourNameTextField.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["SignUpButton"].tap()
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertFalse(navBar.exists)
    }
    
    func testContentViewSignUpButtonShouldSignIn(){
        
        // Given
        let addYourNameTextField = app.textFields["SignUpTextField"]
        
        // When
        addYourNameTextField.tap()
        
        let jKey = app/*@START_MENU_TOKEN@*/.keys["J"]/*[[".keyboards.keys[\"J\"]",".keys[\"J\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jKey.tap()
        let keyj = app.keys["j"]
        keyj.tap()
        keyj.tap()
        keyj.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["SignUpButton"].tap()
        
        let navBar = app.navigationBars["Welcome"]
        
        // Then
        XCTAssertTrue(navBar.exists)
        
        
    }
    
    func testSignedInHomeViewShowAlertButtonShouldDisplayAlert(){
        // Given
        let addYourNameTextField = app.textFields["SignUpTextField"]
        
        // When
        addYourNameTextField.tap()
        
        let jKey = app/*@START_MENU_TOKEN@*/.keys["J"]/*[[".keyboards.keys[\"J\"]",".keys[\"J\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jKey.tap()
        let keyj = app.keys["j"]
        keyj.tap()
        keyj.tap()
        keyj.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["SignUpButton"].tap()
        
        let navBar = app.navigationBars["Welcome"]
        
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["showAlertButton"]
        showAlertButton.tap()
        
        let alert = app.alerts.firstMatch
        // XCTAssertTrue(alert.exists)

        // Then
        XCTAssertTrue(alert.exists)
        
    }
    
    func testSignedInHomeViewShowAlertButtonShouldDisplayAndDismissAlert(){
        
        // Given
        let addYourNameTextField = app.textFields["SignUpTextField"]
        
        // When
        addYourNameTextField.tap()
        
        let jKey = app/*@START_MENU_TOKEN@*/.keys["J"]/*[[".keyboards.keys[\"J\"]",".keys[\"J\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        jKey.tap()
        let keyj = app.keys["j"]
        keyj.tap()
        keyj.tap()
        keyj.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.buttons["SignUpButton"].tap()
        
        let navBar = app.navigationBars["Welcome"]
    
        XCTAssertTrue(navBar.exists)
        
        let showAlertButton = app.buttons["showAlertButton"]
        showAlertButton.tap()
        
    
        let alert = app.alerts.firstMatch
//        XCTAssertTrue(alert.exists)
        
        let alertOkButton = alert.buttons["OK"]
        XCTAssertTrue(alertOkButton.exists)
//        sleep(1)
        let alertOkButtonexists = alertOkButton.waitForExistence(timeout: 5)
        XCTAssertTrue(alertOkButtonexists)
        alertOkButton.tap()
//        sleep(1)
        let alertExists = alert.waitForExistence(timeout: 5)
        
        
        // Then
        XCTAssertFalse(alertExists)
        XCTAssertFalse(alert.exists)
                
    }
    
    
}
