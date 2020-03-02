$(function(){
    function buildHTML(task){
      var html = 
       `<div class="contents_content">
          <div class="contents_content_task">
            ${task.content}  
            <a class="fa fa-trash" rel="nofollow" data-method="delete" href="tasks/${task.id}"></a>
          </div>  
          <div class="contents_content_user">  
            ${task.user_name}
          </div>
          <div class="contents_content_time">
            ${task.created_at} 
          </div>
        </div>`  
      return html;

      
    }
  


  $('#new_task').on('submit', function(e){
    console.log('hoge');
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
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
        $('.tasks').animate({scrollTop: $('.tasks')[0].scrollHeight});       
        $('form')[0].reset();

      })

      .fail(function(){
        alert('error');
      });
      return false;
      
  })

  
});

