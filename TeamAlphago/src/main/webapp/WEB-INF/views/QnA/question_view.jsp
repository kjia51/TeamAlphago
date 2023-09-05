<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/a2debf6ac3.js" crossorigin="anonymous"></script>
</head>
<body>

<%@ include file="../common/header.jsp" %>

<div id="container">
            <div class="wrap">
                <div class="content_wrap">
                	<input type="text" name="q_no" value=${QnAVO.q_no }>
                	<input type="text" name="m_id" value="${memberVO.m_id }">
                    <div class="titleBox">
                        <h2 class="t_title">Q&A</h2>
                    </div>
                    <div class="entry">
                        <div class="viewForm1">
			            
                            <div class="titleInfo">
                                <div class="tit">
                                    <h3>${QnAVO.q_title }</h3>
                                </div>
                                <div class="post">
                                    <span class="name">${QnAVO.q_m_id }</span>
                                    <span class="date" title="작성일">${QnAVO.q_regdate }</span>
                                </div>
                        <c:if test="${memberVO.m_id == QnAVO.q_m_id}">        
                        <div class="btnArea btnArea-right">
                            <span class="btn btn-grayline btn-mg"><a href="#" id="editBtn">수정</a></span>
                            <span class="btn btn-grayline btn-mg"><a href="javascript:;" id="delBtn" data-idx="275">삭제</a></span>
                        </div>
                        </c:if>
                            </div>
                            <!-- // titleInfo -->
                            <div class="boardView">
                                <p class="0" style="background:#ffffff;mso-pagination:none;text-autospace:none;mso-padding-alt:0pt 0pt 0pt 0pt;">
                                    ${QnAVO.q_content }
                                </p>
                            </div>
                            <!-- // contentView -->
                            <div class="btnArea-center">
                                <span class="btn btn-primary btn-lg">
                                    <a href="/alpha/QnA/question">목록</a>
                                </span>
                            </div>
                        </div>
                        <!-- // viewForm1 -->
                     
                  <div class="commentArea" id="replyLayout">
                    <form class="comment-form comment-bb" data-process="add">
                    	<input type="hidden" name="a_m_id" value="${memberVO.m_id}">
                        <textarea class="comment-bb" maxlength="500" title="댓글입력" name="a_content"></textarea>
                        <button type="button" class="eve-comment-submit" id="answerInsertBtn"> 등록 </button>
                    </form>
                    <ul class="comment-list" id="replyList">
                    	<div id="comment-list">
	                    	<li class="comment-list-dept comment-dept0">
	                    		<div class="comment-list-info" class="comment-list-info-${index}">
	                    			<strong>관리자</strong>
	                    			<span>2023-06-07 09:22</span>
	                    		</div>
	                    		<div class="comment-list-content" class="comment-list-content-${index}">
	                    			댓글 내용
	                    		</div>
	                    	</li>
	                    </div>
                    </ul>
                </div>
                <!-- //commentArea -->
                      
                    </div>
                </div>
            </div>
        </div>
	<script type="text/javascript">
	window.onload = function () {
	    showAnswer();
	};
	
   function fetchGet(url, callback){
   	try{
   		fetch(url)
   		// 컨트롤러로부터 JSON 타입의 객체가 반환
   		// 객체를 변수명 response에 받아 와서 json() 메소드를 호출
   		// json() : JSON 형식의 문자열을 Promise 객체로 반환
   		// Promise 객체는 then() 메소드를 사용하여 
   		// 비동기 작업의 성공 또는 실패와 관련된 결과를 나타내는 대리자 역할을 수행
   		.then(response => response.json())
   		// 반환 받은 객체를 매개 변수로 받는 콜백 함수를 호출
   		.then(map => callback(map));		
   	} catch(e){
   		console.log('fetchGet', e)
   	}
   }
   
   
   $('#delBtn').on('click', function() {
       var q_no = $('input[name="q_no"]').val(); // 삭제할 항목의 q_no

       fetch('/alpha/QnA/question_delete/' + q_no, {
           method: 'DELETE', // DELETE 메서드를 사용합니다.
       })
       .then(function(response) {
           if (response.ok) {
               alert('문의가 삭제되었습니다.');
               // 삭제 후 목록 페이지로 이동
               location.href = "/alpha/QnA/question";
           } else {
               throw new Error('문의 삭제 중 오류가 발생했습니다.');
           }
       })
       .catch(function(error) {
           // 에러 처리
           alert(error.message);
       });
       return false;
   });
           
    
   $('#editBtn').on('click', function(){
        location.href = "/alpha/QnA/question_edit?q_no=${QnAVO.q_no}";
    });

   
   function showAnswer() {
	   var q_no = $('input[name="q_no"]').val();
		fetchGet("/alpha/QnA/answer?a_q_no=" + q_no, getAnswer)
	}
        
   function getAnswer(map) {
	   var m_id = $('input[name="m_id"]').val();
	   var commentListDiv = document.querySelector('#comment-list');
	    commentListDiv.innerHTML = ''; // 기존 내용 초기화

	    map.answerList.forEach((answerVO, index) => {
	        var li = document.createElement('li');
	        li.className = 'comment-list-dept comment-dept0';

	        var commentInfoDiv = document.createElement('div');
	        commentInfoDiv.className = 'comment-list-info comment-list-info-' + index;

	        var commentContentDiv = document.createElement('div');
	        commentContentDiv.className = 'comment-list-content comment-list-content-' + index;

	        li.appendChild(commentInfoDiv);
	        li.appendChild(commentContentDiv);

	        commentListDiv.appendChild(li);

	        var commentInfo = '<strong>' + answerVO.a_m_id + '</strong>'
	            + '<span>' + answerVO.a_regdate + '</span>';
	            
	         // 만약 memberVO.m_id와 a_m_id가 같을 때만 아이콘을 추가
	        if (m_id === answerVO.a_m_id) {
	        	commentInfo += '<a style="cursor:pointer" class="answer-edit-link" data-index="' + index + '"><i class="fa-regular fa-pen-to-square"></i></a> '
	                + '<a style="cursor:pointer" onclick="answerDelete(' + index + ')"><i class="fa-regular fa-trash-can"></i></a>';
	        }

	        var commentContent = answerVO.a_content
	                            + '<form class="comment-form comment-bb" data-process="edit">'
	                            + '<textarea style="display:none" class="comment-bb" maxlength="500" title="댓글수정" data-index="${index}" name="new_a_content">' + answerVO.a_content + '</textarea>'
	                            + '<button style="display:none" class="eve-comment-submit answer-edit-btn" data-index="${index}" data-a_no="' + answerVO.a_no + '"> 댓글수정 </button>'
	                            + '<input type="hidden" name="a_no" value="' + answerVO.a_no + '"'
	                            + '</form>';

	        document.querySelector('.comment-list-info-' + index).innerHTML = commentInfo;
	        document.querySelector('.comment-list-content-' + index).innerHTML = commentContent;
	        
	        $('.answer-edit-btn').on('click', function (e) {
	           e.preventDefault();
	        	var index = $(this).data('index'); // data-index 값을 가져옴
	        	var a_no = $(this).data('a_no');
	        	var q_no = $('input[name="q_no"]').val();
	            var formData = new FormData(); // 폼 데이터 생성

	            // 폼 데이터에 필요한 데이터 추가
	            formData.append('q_no', q_no);
	            formData.append('a_no', a_no);
	            formData.append('a_content', $('textarea[name="new_a_content"]').eq(index).val()); // 해당 인덱스의 텍스트 에어리어 값 가져옴

	            fetch('/alpha/QnA/answer_edit?a_no=' + a_no, {
	                method: 'POST',
	                body: formData // 폼 데이터를 전송
	            })
	            .then(function (response) {
	                if (response.ok) {
	                    return response.json(); // 응답 데이터를 JSON으로 파싱
	                } else {
	                    throw new Error('답변 수정 중 오류가 발생했습니다.');
	                }
	            })
	            .then(function (data) {
	                // 성공적으로 처리된 경우
	                alert('답변이 수정되었습니다.');

	                location.reload();
	            })
	            .catch(function (error) {
	                // 에러 처리
	                console.error(error); // 콘솔에 에러 메시지 출력
	                alert('답변 수정 중 오류가 발생했습니다.');
	            });
	            return false;
	        });
	           
	        
	    });
	    
	    
	    var editLinks = document.querySelectorAll('.answer-edit-link');

	 // 각 링크에 클릭 이벤트 리스너 추가
	 editLinks.forEach(function (link) {
	     link.addEventListener('click', function (e) {
	         e.preventDefault(); // 기본 동작 방지

	         var clickedIndex = link.getAttribute('data-index');
	        
	      // 해당 댓글 수정 입력 폼 보이거나 숨기도록 스타일 토글
	         var commentForm = $('textarea[name="new_a_content"]').eq(clickedIndex);
	         var editButton = $('.answer-edit-btn').eq(clickedIndex);

	         if (commentForm.css('display') === 'none') {
	             commentForm.css('display', 'block');
	             editButton.css('display', 'block');
	         } else {
	             commentForm.css('display', 'none');
	             editButton.css('display', 'none');
	         }
	     });
	 });
	}


   $('#answerInsertBtn').on('click', function(e){
	   e.preventDefault();
	    var q_no = $('input[name="q_no"]').val();
	    var a_m_id = $('input[name="a_m_id"]').val();
	    var formData = new FormData(); // 폼 데이터 생성

	    // 폼 데이터에 필요한 데이터 추가
	    formData.append('q_no', q_no);
	    formData.append('a_m_id', a_m_id);
	    formData.append('a_content', $('textarea[name="a_content"]').val());

	    fetch('/alpha/QnA/answer_write', {
	        method: 'POST',
	        body: formData // 폼 데이터를 전송
	    })
	    .then(function(response) {
	        if (response.ok) {
	            alert('답변이 등록되었습니다.');
	            // 등록 후 목록 페이지로 이동
	            location.href = "/alpha/QnA/question_view?q_no=" + q_no;
	        } else {
	            throw new Error('답변 등록 중 오류가 발생했습니다.');
	        }
	    })
	    .catch(function(error) {
	        // 에러 처리
	        alert(error.message);
	    });
	    return false;
	})
   
   
function answerEdit(index) {
    // 해당 댓글 수정 입력 폼 보이도록 스타일 변경
    var commentForm = $('.comment-form.comment-bb[data-process="edit"][data-index="' + index + '"]');
    var editButton = $('.answer-edit-btn[data-index="' + index + '"]');
    
    console.log(commentForm);
    console.log(editButton);
    console.log(index);
    
    
    if (commentForm.length > 0 && editButton.length > 0) {
    	commentForm.find('textarea').css('display', 'block');
    	editButton.css('display', 'block');
    }
}
   

   function answerDelete(index) {
	    if (confirm('정말로 이 댓글을 삭제하시겠습니까?')) {
	        // 서버로 삭제 요청을 보내는 부분
	        var a_no = $('input[name="a_no"]').eq(index).val(); // 댓글의 고유 번호

	        fetch('/alpha/QnA/answer_delete/' + a_no, {
	            method: 'DELETE'
	        })
	        .then(function(response) {
	            if (response.ok) {
	                alert('댓글이 삭제되었습니다.');
	                // 페이지 새로고침 또는 다시 로드하여 댓글 목록을 갱신할 수 있습니다.
	                location.reload();
	            } else {
	                throw new Error('댓글 삭제 중 오류가 발생했습니다.');
	            }
	        })
	        .catch(function(error) {
	            // 에러 처리
	            alert(error.message);
	        });
	    }
	}
   </script>

	<%@ include file="../common/footer.jsp" %>

</body>
</html>