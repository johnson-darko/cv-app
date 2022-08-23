// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

//= require jquery
//= require jquery_ujs
//= require moment
//= require bootstrap-datetimepicker
//= require bootstrap-sprockets
//= require bootstrap-colorpicker
//= require cocoon

//= require_tree .

$(document).ready(function(){
    $('.skillbar').each(function(){
        $(this).find('.skillbar-bar').animate({
            width:$(this).attr('data-percent')
        },2000);
    });
    $('.my-form-group input').on('focus blur', function (e) {
        $(this).parents('.my-form-group').toggleClass('my-active', (e.type === 'focus' || this.value.length > 0));
    }).trigger('blur');
});