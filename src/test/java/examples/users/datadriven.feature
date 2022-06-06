Feature: Validate the Scenario outline.
  Background:
    * url baseUrl
    * def testdata = read("testdata.csv")
    * print testdata

  Scenario Outline: Create new user
    Given path '/public/v2/users'
    And request {"name": '#(name)',"gender": '#(gender)',"status": '#(status)',"email":'#(email)'}
    And header Authorization = 'Bearer ' + tokenId
    When method post
    Then status <status1>
    Examples:
      |testdata|


