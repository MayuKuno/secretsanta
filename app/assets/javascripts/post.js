
$(function() {
  function readURL(input) {
      if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
  $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
      }
  }
  $(".postsnew__containers__container__form__images__image__file").change(function(){
      readURL(this);
  });


//   function addCategory(category) {
//     let html = `
//     <div class="chat-post-category clearfix">
//       <p class="chat-post-category__name">${category.name}</p>
//       <div class="category-search-add chat-post-category__btn chat-post-category__btn--add" data-category-id="${category.id}" data-category-name="${category.name}">追加</div>
//     </div>
//   `;
//   $("#category-search-result").append(html);
//   }

//   function addNoCategory() {
//     let html = `
//     <div class="chat-post-category clearfix">
//       <p class="chat-post-category__name">ユーザーが見つかりません</p>
//     </div>
//   `;
//   $("#category-search-result").append(html);
//   }

//   function addDeleteCategory(name, id) {
//     let html = `
//     <div class="chat-post-category clearfix" id="${id}">
//       <p class="chat-post-category__name">${name}</p>
//       <div class="category-search-remove chat-post-category__btn chat-post-category__btn--remove js-remove-btn" data-category-id="${id}" data-category-name="${name}">削除</div>
//     </div>`;
//     $(".js-add-category").append(html);
//   }


//   $("#category-search-field").on("keyup", function() {
//     let input = $("#category-search-field").val();
//     $.ajax({
//     type: "GET",
//     url: '/categories',
//     data: { keyword: input },
//     dataType: "json"
//     })
//     .done(function(categories) {
//         $("#category-search-result").empty();
//         if (categories.length !== 0) {
//             categories.forEach(function(category) {
//             addCategory(category);
//             });
//         } else if (input.length == 0) {
//             return false;
//         } else {
//             addNoCategory();
//         }
//         })
//     .fail(function() {
//         alert("通信エラーです。ユーザーが表示できません。");
//     });
//     $(document).on("click", ".chat-post-category__btn--add", function() {
//       const categoryName = $(this).attr("data-category-name");
//       const categoryId = $(this).attr("data-category-id");
//       $(this)
//         .parent()
//         .remove();
//       addDeleteCategory(categoryName, categoryId);
//       addaaa(categoryId);
//     });
//     $(document).on("click", ".chat-post-category__btn--remove", function() {
//       $(this)
//         .parent()
//         .remove();
//     });
// });


});





