require('jquery')
import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
import 'bootstrap'
require("packs/preview-img")
require('./iconify.min')
require('cocoon')
require('jquery')
import "bootstrap"
require('cocoon')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
global.toastr = require('toastr')

$(document).on('ready turbolinks:load', function(){
  $(document).on('change', '.upload-image', function(){
    var preview = $(this).siblings('.preview')[0];
    var files   = $(this)[0].files;

    function readAndPreview(file) {

      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        var reader = new FileReader();

        reader.addEventListener("load", function () {
          var image = new Image();
          image.height = 250;
          image.width = 250;
          image.title = file.name;
          image.src = this.result;
          preview.appendChild( image );
        }, false);

        reader.readAsDataURL(file);
      }

    }

    if (files) {
      [].forEach.call(files, readAndPreview);
    }
  })
})
