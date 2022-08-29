import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'bootstrap'
require("packs/preview-img")
require('./iconify.min')
require('cocoon')
require('jquery')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
global.toastr = require('toastr')

var myModal = document.getElementById('myModal')
var myInput = document.getElementById('myInput')

myModal.addEventListener('shown.bs.modal', function () {
  myInput.focus()
})
