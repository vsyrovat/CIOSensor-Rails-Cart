// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import * as bootstrap from 'bootstrap'
import 'jquery'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.addEventListener('turbolinks:load', () => {
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl)
    })
})


//----

$(function(){
    $('.js-get-button').on('click', function(){
        var context = $(this).closest('.js-context')
        $.getJSON($(this).data('url'), function(data){
            context.find('.js-get-result').text(JSON.stringify(data, null, 3))
        })
    })

    $('.js-put-cart-item-button').on('click', function(){
        var context = $(this).closest('.js-context')
        var good_id = context.find('.js-input-good-id').first().val()
        var unit_id = context.find('.js-input-unit-id').first().val()
        var count = context.find('.js-input-count').first().val()
        $.ajax({
            type: 'PUT',
            url: $(this).data('url'),
            data: JSON.stringify({good_id: good_id, unit_id: unit_id, count: count}),
            contentType: 'application/json',
            dataType: 'json',
            success: function(data) {
                context.find('.js-put-result').text(JSON.stringify(data))
            },
            error: function(xhr, status, error) {
                context.find('.js-put-result').text(JSON.stringify(xhr.responseJSON))
            }
        })
    })
})
