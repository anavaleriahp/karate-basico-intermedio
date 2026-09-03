Feature: Validar Artistas de Spotify

  Background:
    * url baseUrlSpotify
    * call read('classpath:bdd/api_spotify/tokenSpotify.feature@gettokenspotify')
    * header Authorization = 'Bearer ' + accessToken

  @spotifyArtista
  Scenario Outline: Se obtiene un artista de spotify
    Given path 'v1/artists/<idArtista>'
    When method GET
    Then status 200
    * match response.name == '<descripcion>'
    Examples:
      | idArtista              | descripcion   |
      | 4Z8W4fKeB5YxbusRsdQVPb | Radiohead     |
      | 3TVXtAsR1Inumwj472S9r4 | Drake         |
      | 66CXWjxzNUsdJxJ2JdwvnR | Ariana Grande |

  @spotifyArtista @ignore
  Scenario Outline: Se obtienen los albums del artista
    Given path 'v1/artists/<idArtista>/albums'
    When method GET
    Then status 200
    * print 'Albums de '+ '<descripcion>' + response.items[0].name
    Examples:
      | idArtista              | descripcion   |
      | 66CXWjxzNUsdJxJ2JdwvnR | Ariana Grande |