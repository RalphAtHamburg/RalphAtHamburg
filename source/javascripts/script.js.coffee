# See http://coffeescript.org/

# ----- Load tweets for user --------------------

jQuery ($) ->
  $(".tweet").tweet
    username: "ralphathamburg"
    join_text: "auto"
    auto_join_text_default: ""
    auto_join_text_ed: ""
    auto_join_text_ing: ""
    auto_join_text_reply: ""
    auto_join_text_url: ""
    count: 8
    loading_text: "Lade Tweets ..."
    
# ----- Form handling --------------------

$ ->
  $("#contact").submit ->
    str = $(this).serialize()
    
    if $("#_name").val() is "" or $("#_mail").val() is "" or $("#_anfrage").val() is ""
      $("#note").css('color', 'red');
      $("#note").html "Bitte füllen Sie alle Felder aus."
      return true
    
    $.ajax
      type: "POST"
      url: "sendmail.php"
      data: str
      success: (msg) ->
        $("#note").ajaxComplete (event, request, settings) ->
          $("#note").css('color', 'black');
          $(this).html msg
          $("#_name").val ""
          $("#_mail").val ""
          $("#_anfrage").val ""















