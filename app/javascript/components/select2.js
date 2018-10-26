import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.min.css'

function initSelect2() {
  $('.select2').select2();
}

export { initSelect2 };