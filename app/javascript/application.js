// import "@hotwired/turbo-rails"

import "controllers"

// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

const btn_open_popup = document.getElementById('btn-open-popup');
const btn_close_popup = document.getElementById('btn-close-popup');
const popup_modal = document.querySelector('.popup-modal');
const notice_card = document.querySelector('.notice-card');


if (btn_open_popup) {
  btn_open_popup.addEventListener('click', () => {
    document.body.style.overflow = 'hidden';
    popup_modal.classList.remove('hidden');
  });
}

if (btn_close_popup) {
  btn_close_popup.addEventListener('click', () => {
    document.body.style.overflow = 'scroll';
    popup_modal.classList.add('hidden');
  });
}

// hide notice card when new notice enters
if (typeof(notice_card) != 'undefined' && notice_card != null) {
  setTimeout(() => { notice_card.style.display = 'none' }, 4000)
}