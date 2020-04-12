$(function(){
  
    function buildHTML(task){
      var html = 
       `<div class="contents_content" data-task-id="${task.id}">
          <div class="contents_content_task">
            ${task.content}  
          </div>  
          <div class="contents_content_user">  
            ${task.user_name}
          </div>
          <div class="contents_content_time">
            ${task.created_at} 
          </div>
          <a class="fa fa-trash" rel="nofollow" data-method="delete" href="tasks/${task.id}"></a>
        </div>`  
      return html; 
    }
  


  $('#new_task').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
      
        var html = buildHTML(data);
        $('.contents').append(html);  
        $('.contents').animate({scrollTop: $('.contents')[0].scrollHeight});       
        $('form')[0].reset();
        
      })

      .fail(function(){
        alert('error');
      })
      return false;
  })

  var reloadTasks = function() {
    var last_task_id = $('.contents_content:last').data("task-id");
    $.ajax({
      url: "api/tasks",
      type: 'get',
      dataType: 'json',
      data: {id: last_task_id}
    })
    .done(function(tasks) {
      if (tasks.length !==0){
        var insertHTML = '';
        $.each(tasks, function(i, task){   
          insertHTML += buildHTML(task)
        })
          $(".contents").append(insertHTML);
          $('.contents').animate({scrollTop: $('.contents')[0].scrollHeight}, 'fast');
      }      
    })

    .fail(function() {
      alert('error');
    })
  }

  if (document.location.href.match(/\/groups\/\d+\/tasks/)) {
    setInterval(reloadTasks, 7000);
  }
});

