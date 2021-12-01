// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require_tree ./channels
import { initSweetalert } from '../plugins/init_sweetalert';

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import {initChatroomCable} from "../channels/chatroom_channel"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "controllers"
import "channels"
import "bootstrap"

document.addEventListener('turbolinks:load', () => {
  initSweetalert('#emergency-popup', {
    title: "URGENT HELP NEEDED",
    text: "Flooding in Paddington - volunteers needed urgently TODAY.",
    icon: "warning",
    buttons: ["I'm too busy", "I'll help!"],
    dangerMode: true
  },
    (value) => {
      if (value) {
        swal("Type your email address and we'll be in touch ASAP with more detail.", {
        content: "input",
        button: "Send",
        dangerMode: true
      })
    }
  });
  initChatroomCable();
});
