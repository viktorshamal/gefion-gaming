jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: '#{window.location.protocol}//connect.facebook.net/en_US/sdk.js'
    dataType: 'script'
    cache: true

window.fbAsyncInit = ->

  FB.init(
    appId:'280813985423323',
    xfbml: false,
    cookie: true,
    status: true,
    version: 'v2.0'
  )

  FB.getLoginStatus((response) ->
    console.log response
  )

  ###$('input[name=radio-attendance]').on "change", ->
    rsvp_status = $("input[name=radio-attendance]:checked").val();
    FB.api "/" + gon.eventid + "/" + rsvp_status, "POST", ((response) ->
      console.log response if response and not response.error)###

  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login ((response) ->
      window.location = '/auth/facebook/callback' if response.authResponse), scope: 'rsvp_event, user_events'

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true

  setButtonState = (check) ->
    $('#attend-button').prop('checked', check)
    console.log "set " + check

  ###$('#attend-button').on "change", ->
    rsvp_bool = false
    FB.api "/me/events/?since=1396692070", "GET", ((response) ->
      if response and not response.error
        for k,v of response["data"]
          if v["id"] == gon.eventid
            rsvp_bool = true
        if rsvp_bool == true
          setButtonState(false)
          rsvp_status = "declined"
        else
          setButtonState(true)
          rsvp_status = "attending"
        FB.api "/" + gon.eventid + "/" + rsvp_status, "POST", ((response) ->
          console.log response if response and not response.error
        )
    )###

