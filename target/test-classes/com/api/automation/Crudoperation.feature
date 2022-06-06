Feature: Validate the Crud Operation

  Background:
    * url baseUrl

    * def random_string =
  """
  function(s){
  var text = "";
  var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  for(var i=0; i<s;i++)
      text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
      return text;
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
    * set requestPayload.email = RandomString + "@gmail.com"
    * print requestPayload

  Scenario: Update  user with CRUD Operation
    #post call
    Given path '/public/v2/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenId
    When method post
    Then status 201
    * print response
    * def jsondata = response
    * match jsondata.id == '#present'
    * def userid = jsondata.id

    #get call
    Given path '/public/v2/users/'+userid
    And header Authorization = 'Bearer ' + tokenId
    When method get
    Then status 200

    * print response
    * def jsonresponse = response
    * print jsonresponse
    * match jsonresponse.id == userid

# put call for update
    * def requestputPayload =
  """
{
    "gender": "female",
    "status": "active"
}
  """
    Given path '/public/v2/users/'+userid
    And request requestputPayload
    And header Authorization = 'Bearer ' + tokenId
    When method put
    Then status 200
    * print response
    * def jsondata = response
    * match jsondata.id == userid
    * match jsondata.name == '#present'
    * match jsondata.email == requestPayload.email


    # delete operation
    Given path '/public/v2/users/'+userid
    And header Authorization = 'Bearer ' + tokenId
    When method delete
    Then status 204

