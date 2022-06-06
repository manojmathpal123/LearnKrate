Feature: Verify the post request.
Background:
  * url baseUrl

  * def random_string =
  """
  function(s){
  var text = "";
  var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  for(var i=0; i<s;i++)
  {
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;
  }

  }
  """

  * def RandomString = random_string(10);
  * print RandomString


  * def requestPayload =
  """
{
    "name": "Satyen Namboothiri122",
    "gender": "female",
    "status": "inactive"
}
  """
  * requestPayload.email = RandomString + "@gmail.com"
  * print requestPayload

  Scenario: Create new user
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenId
    When method post
    Then status 201
    * print response
    * def jsondata = response
    * match jsondata.id == '#present'
    