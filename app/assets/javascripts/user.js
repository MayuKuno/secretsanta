$(function(){
  $('.usershow__containers__container__bottom__tab-contents>div').hide();
  $('.usershow__containers__container__bottom__tab-contents>div').first().slideDown();
    $('.usershow__containers__container__bottom__tabs__tab-buttons span').click(function(){
      var thisclass=$(this).attr('class');
      $('#lamp').removeClass().addClass('#lamp').addClass(thisclass);
      $('.usershow__containers__container__bottom__tab-contents>div').each(function(){
        if($(this).hasClass(thisclass)){
          $(this).fadeIn(800);
        }
        else{
          $(this).hide();
        }
      });
    });
  });
  
  

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
    $(".signup__top__main__contents__images__image__file").change(function(){
        readURL(this);
    });
  
// ========

    function addparticipants(user) {
      let html = `
        <div class="chat-group-user clearfix">
          <p class="chat-group-user__name">${user.name}</p>
          <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
        </div>
      `;
      $("#participantssearchresult").append(html);
    }
  
    function addNoparticipants() {
      let html = `
        <div class="chat-group-user clearfix">
          <p class="chat-group-user__name">ユーザーが見つかりません</p>
        </div>
      `;
      $("#participantssearchresult").append(html);
    }
    function addDeleteUser(name, id) {
      let html = `
      <div class="chat-group-user clearfix" id="${id}">
        <p class="chat-group-user__name">${name}</p>
        <div class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
      </div>`;
      $(".js-add-participant").append(html);
    }
    function addMember(userId) {
      let html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" />`;
      $(`#${userId}`).append(html);
    }

    $("#participantssearch").on("keyup", function() {
      let input = $("#participantssearch").val();
      $.ajax({
        type: "GET",
        url: "/users",
        data: { keyword: input },
        dataType: "json"
      })
      .done(function(users) {
        $("#participantssearchresult").empty();

        if (users.length !== 0) {
          users.forEach(function(user) {
            addparticipants(user);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoparticipants();
        }
      })
      .fail(function() {
        alert("通信エラーです。ユーザーが表示できません。");
      });
    });
    $(document).on("click", ".chat-group-user__btn--add", function() {
      const userName = $(this).attr("data-user-name");
      const userId = $(this).attr("data-user-id");
      $(this)
        .parent()
        .remove();
      addDeleteUser(userName, userId);
      addMember(userId);
    });
    $(document).on("click", ".chat-group-user__btn--remove", function() {
      $(this)
        .parent()
        .remove();
    });
  });


  

