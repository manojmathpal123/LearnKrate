Feature: Verify the put request.
  Background:
    * url baseUrl



    * def requestPayload =
  """
{
    "status": "active"
}
  """


  Scenario: update new user
    Given path '/public/v2/users/8944'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenId
    When method put
    Then status 200
    * print response
    * def jsondata = response
    * match jsondata.id == '#present'
    * match jsondata.email == 'namboothiri1_satyen@cruickshank.org'
