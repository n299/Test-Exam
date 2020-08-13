$(document).on('turbolinks:load', function() {
  let checkAfterSubmit = true;
  let firstTime = true;
  const userExamPath = $('#user_exam').data('user-exams-path');
  const examId = $('#exam').data('exam-id');
  const time = 30 * 60 * 1000;
  let countdown = time

  setTimeout(function(){ 
    sendAnswerAfterTimeLimited()}, time);

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
    sendAnswer(answersId, examId);
  })

  function sendAnswer(answersId, examId){
    return $.ajax({
              type: "POST",
              data: {list_answer: answersId, exam_id: examId},
              url: userExamPath,
              dataType: "json",
              success: function (data) {
                if (data.status ){
                  $('#total_score').html(data.score);
                  firstTime = false;
                  checkAfterSubmit = false;
                  $('#dialog_exam').modal('show');
                  $('#redirect_btn').attr("href", data.user_exam_path);
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
    sendAnswer(answers, examId);
  };

  const getAnswer = ()=>{
    let answersId = [];
    $('input:radio:checked').each((i, value)=>{ answersId.push( $(value).val())});
    return answersId;
  };

  let timerId = setInterval(()=>{
    countdown -= 1000;
    let min = Math.floor(countdown / (60 * 1000));
    let sec = Math.floor((countdown - (min * 60 * 1000)) / 1000);
    if(min < 10 ){
      min = "0" + min
    }
    if(sec < 10 ){
      sec = "0" + sec
    }
    if(checkAfterSubmit){
      $("#countTime").html(min + " : " + sec);
    }else{
      clearInterval(timerId);
    }
  }, 1000);
});
