require('jquery')
import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'
import * as ActiveStorage from '@rails/activestorage'
import 'channels'
require('./iconify.min')
require('./scripts')
import "bootstrap"
import Chart from 'chart.js/auto'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
global.toastr = require('toastr')
