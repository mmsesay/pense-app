// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
import "controllers"

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
