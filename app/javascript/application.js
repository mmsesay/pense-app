// import "@hotwired/turbo-rails"

import "controllers"
const btn_category_trash_icon = document.querySelector('.btn-open-cate-popup');
const popup_for_transaction = document.querySelector('.confirm-transaction-delete');
const popup_for_category = document.querySelector('.confirm-category-delete');
const notice_card = document.querySelector('.notice-card');

if (btn_category_trash_icon) {
  btn_category_trash_icon.addEventListener('click', () => {
    popup_for_category.classList.remove('hidden');
    document.body.style.overflow = 'hidden';
  });
}

document.querySelectorAll('.btn-open-trans-popup').forEach((element) => {
  element.addEventListener('click', () => {
    popup_for_transaction.classList.remove('hidden');
    document.body.style.overflow = 'hidden';

    document.querySelectorAll('.delete-button').forEach((delete_button) => {
      delete_button.id = element.id;
      delete_button.addEventListener('click', (e) => {
        fetch(`/transactions/${e.target.id}/delete`)
          .then(() => { window.location.reload(); });
      });
    });
  });
});

document.querySelectorAll('.btn-close-popup').forEach((element) => {
  element.addEventListener('click', () => {
    popup_for_category.classList.add('hidden');
    popup_for_transaction.classList.add('hidden');
    document.body.style.overflow = 'scroll';
    window.location.reload();
  });
});


// hide notice card when new notice enters
if (typeof(notice_card) != 'undefined' && notice_card != null) {
  setTimeout(() => { notice_card.classList.add('hidden') }, 4000)
}