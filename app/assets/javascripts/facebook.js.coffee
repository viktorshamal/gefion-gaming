jQuery ->
  $('body').prepend('<div id="fb-root"></div>')

  $.ajax
    url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
    dataType: 'script'
    cache: true



window.fbAsyncInit = ->
  FB.init(appId:'280813985423323', cookie: true)


  FB.api
      method: 'fql.query',
      query: 'select rsvp_status from event_member where eid = 1434130086837285 and uid=me()'
  ,
      (response)->
        console.log(response);


  $('input[name=radio-attendance]').on "change", ->
    rsvp_status = $("input[name=radio-attendance]:checked").val();
    FB.api "/" + gon.eventid + "/" + rsvp_status, "POST", ((response) ->
      console.log response if response and not response.error)


  $('#sign_in').click (e) ->
    e.preventDefault()
    FB.login ((response) ->
      window.location = '/auth/facebook/callback' if response.authResponse), scope: 'rsvp_event', display: 'popup'

  $('#sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true