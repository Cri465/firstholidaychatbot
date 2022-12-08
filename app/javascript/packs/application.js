// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "@doabit/semantic-ui-sass";

$(document).on("turbolinks:load", function () {
  $(".ui.dropdown").dropdown();
  $('.selection.dropdown').dropdown();
  $('.ui.checkbox').checkbox();
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  const $chatWindow = $('#chat-window');
  const target = $('#message-container');
  const loading = '<div class="column" id="loading"><div class="right floated center aligned ui right pointing label"id="right-chat"><div class="spinner"><div class="rect1"></div><div class="rect2"></div><div class="rect3"></div><div class="rect4"></div><div class="rect5"></div></div></div></div>'

  target.on('DOMNodeInserted', function(event) {
    document.getElementById('msg').value = '';
    $chatWindow.scrollTop($chatWindow[0].scrollHeight);
    var insertedElement = event.target;
    setTimeout(function() {
      if ($(insertedElement).hasClass('left')) {
        console.log("what")
        target.append(loading)
      }
      if ($(insertedElement).hasClass('right')) {
        console.log("what")
        $(function(){
          $("#loading").remove();
        });
      }
      }, 50); // Wait 50 milliseconds before checking the class
  });
});
