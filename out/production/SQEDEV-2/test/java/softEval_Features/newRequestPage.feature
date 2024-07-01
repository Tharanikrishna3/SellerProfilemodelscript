Feature: New Request page verification

  Background:
    Given Seller is navigated to login page and logged in with valid credentials
    Then Seller is on New Request page

@Submit
  Scenario: verify new request submit
    Given Seller will enter all valid data
    When seller clicks on Submit button
    Then Seller should be navigated to RequestDetails page
    And verify request number, stage, status in the request details tab

  @SaveAsDraft
  Scenario: verify new request Save as Draft
    Given Seller will enter all valid data
    When seller clicks on Save as Draft button
    Then Seller should be navigated to RequestDetails page
    And verify request number, stage, status in the request details tab

