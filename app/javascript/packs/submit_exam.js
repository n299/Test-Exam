$(document).on('turbolinks:load', function() {
  let checkAfterSubmit = true;
  let firstTime = true;
  const userExamPath = $('#user_exam').data('user-exam-path');
  let timeEnd = $('#time_end').data('time-end')*1000;

  if(!isNaN(timeEnd)){
    setTimeout(function(){ sendAnswerAfterTimeLimited()}, timeEnd);
  }
 

  $('#submit_exam').on('click', function(){
    let answersId = getAnswer();
    if (answersId.length == 0 && checkAfterSubmit){
      alert('You must choose an answer!');
      return false;
    }

    if(!firstTime){
      alert('You have already submitted this form!');
      return false;
    }
    sendAnswer(answersId);
  })

  function sendAnswer(answersId){
    return $.ajax({
              type: "PUT",
              data: { list_answer: answersId },
              url: userExamPath,
              dataType: "json",
              success: function (data) {
                if (data.status ){
                  $('#total_score').html(data.score);
                  firstTime = false;
                  checkAfterSubmit = false;
                  showMessagesAfterSubmit(data.score, data.user_exam_path)
                }
              },
              error: function (error) {
                console.log(error);
              }
          });
  }

  const sendAnswerAfterTimeLimited = ()=>{
    const answers = getAnswer();
    checkAfterSubmit = false;
    sendAnswer(answers);
  };

  const getAnswer = ()=>{
    let answersId = [];
    $('input:radio:checked').each((i, value)=>{ answersId.push( $(value).val())});
    return answersId;
  };

  let timerId = setInterval(()=>{
    timeEnd -= 1000;
    let min = Math.floor(timeEnd / (60 * 1000));
    let sec = Math.floor((timeEnd - (min * 60 * 1000)) / 1000);
    min = (min < 10) ? "0" + min : min;
    sec = (sec < 10) ? "0" + sec : sec;

    if(checkAfterSubmit){
      $("#countTime").html(min + " : " + sec);
    }else{
      clearInterval(timerId);
    }
  }, 1000);

  const showMessagesAfterSubmit = (score, path)=>{
    alert("You get " + score + " point!");
    document.location.href = path; 
  }
});
