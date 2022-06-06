Feature: GET api Feature

  Scenario: get user details
    Given url baseUrl+'/public/v2/users'
    And path '2924'
    When method get
    Then status 200

    * print response
    * match response ==
    """
  {
    "id": '#number',
    "name": '#string',
    "email": '#string',
    "gender": '#string',
    "status": '#string',
}
    """





