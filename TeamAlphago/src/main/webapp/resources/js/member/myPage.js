//get방식 요청
function fetchGet(url,callback){
	console.log(url);
	console.log(callback);
	
	try {
	//url 요청
	fetch(url)
		//요청 결과json 문자열을 javascript 객체로 반환
		.then(response => response.json())
		//매개로 받은 콜백함수 실행
		.then(map => callback(map));
		
	} catch (e) {
		console.log(e);
	}
	
	
}

//post방식 요청
function fetchPost(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'post'
					,headers : {'Content-Type' : 'application/json'} 
					,body  : JSON.stringify(obj)
			  })
			//요청 결과json 문자열을 javascript 객체로 반환
			.then(response => response.json())
			//매개로 받은 콜백함수 실행
			.then(map => callback(map))
			
		} catch (e) {
			console.log(e);

		}
	
}

//put방식 요청
function fetchPut(url,obj,callback){
	console.log(url);
	console.log(callback);
	
	try {
		//url 요청
		fetch(url,{method : 'put'
			,headers : {'Content-Type' : 'application/json'} 
		,body  : JSON.stringify(obj)
		})
		//요청 결과json 문자열을 javascript 객체로 반환
		.then(response => response.json())
		//매개로 받은 콜백함수 실행
		.then(map => callback(map))
		
	} catch (e) {
		console.log(e);
		
	}
	
}
//DELETE 방식 요청
function fetchDelete(url, callback) {
    console.log(url);
    console.log(callback);

    try {
        // URL 요청
        fetch(url, {
            method: "DELETE"
        })
        // 요청 결과 JSON 문자열을 JavaScript 객체로 반환
        .then(response => response.json())
        // 매개로 받은 콜백 함수 실행
        .then(data => callback(data));
    } catch (e) {
        console.log(e);
    }
}

function getGroup() {
	console.log("Get")
    const userConfirmation = confirm('정보를 수정하시겠습니까?');
    if (userConfirmation) {
        // 사용자가 "확인"을 선택한 경우
    	fetchGet('/member/list', resultList)
    } else {
        // 사용자가 "취소"를 선택한 경우
        // 아무 작업도 수행하지 않음
    }
    
}


function resultList(map){
		let vo = map.vo;

		// 배열에서 최댓값을 추출

		submain.innerHTML += ''
			+'            <div id="titleBox" style="padding: 60px 0px 50px">'
			+'                <h2 class="t_title">내 정보 수정</h2>'
			+'            </div>'
			+'            <form class="content" id="content">'
    		+'             <input type="text" class="input-default" id="c_no" style="width: 97%" maxlength="100" name="c_no" value="'+vo.c_no+'">'
			+'                <div class="writeForm1">'
			+'			       <div id="titleInfo">'
    		+'             <table class="table table-bordered table-form">'
    		+'                 <caption>글쓰기</caption>'
    		+'                 <colgroup>'
    		+'                     <col width="25%">'
    		+'                     <col width="75%">'
    		+'                 </colgroup>'
    		+'                 <tbody>'
    		+'                     <tr>'
    		+'                         <th scope="row">패키지명</th>'
    		+'                         <td>'
    		+'                         <div id="signCname" style="color:red"></div>'
    		+'                         <input type="text" class="input-default" id="c_name" style="width: 97%" maxlength="100" name="title" value="'+vo.c_name+'">'
    		+'                         </td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">학습난이도</th>'
    		+'                         <td>'
    		+'                               <select title="검색 분류" name="c_level" id="c_level" value="" }>'
    		+'                                                <option value="1" '+ (vo.c_level == 1 ? "selected" : "") + '> 초급 </option>'
    		+'                                                <option value="2" '+ (vo.c_level == 2 ? "selected" : "") + '> 중급 </option>'
    		+'                                                <option value="3"'+ (vo.c_level == 3 ? "selected" : "") + '> 고급 </option>'
    		+'                               </select> '
    		+'							</td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">학습가능인원</th>'
    		+'                         <td>'
    		+'		                        <select name="selAmount" data-index="index" id="c_able" value="'+maxC_able+'">'
    		+'		                        </select>'
    		+'                         </td>'
    		+'                         '
    		+'                     </tr>'
    		+'			            <tr>'
    		+'			            <th scope="row">수강인원</th>'
    		+'			            <td id="p_ableTd" >'
    		+'			            <div id="p_able"></div>'
    		+'			            <input type="hidden" class="input-default" id="poss_able" style="width: 97%" maxlength="100" name="poss_able" value="'+c_ableArray+'">'
    		+'			            </td>'
    		+'			       		 </tr>'
    		+'                     <tr>'
    		+'                         <th scope="row">정가</th>'
    		+'                         <td><input type="text" class="input-default" id="c_price" style="width: 97%" maxlength="100" name="c_price" value="'+vo.c_price+'"></td>'
    		+'                     </tr>'
    		
    		+'                         <th scope="row">콘텐츠 내용</th>'
    		+'                         <td>'
    		+'							<div id="signContent"  style="color:red"></div>'
    		+'							<textarea id="c_content" placeholder="10자 이상 입력하세요" style="width:100%; height:450px; border: solid #ccc 1px;">'+vo.c_content+'</textarea></td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                     <th scope="row">첨부파일</th>'
    		+'                     <td>'
    		+						vo.filename
    		+'						<span onclick="deletefile(this)">삭제</span>'		
    		+'                     </td>'
    		+'                     </tr>'
    		+'                     <tr>'
    		+'                     <th scope="row">파일 업로드</th>'
    		+'                     <td>'
    		+'                     <input type="file" id="files" name="files">'
    		+'                     </td>'
    		+'                     </tr>'
    		
    		+'                 </tbody>'
    		+'             </table>'
    		+'</div>'
    		+'                    <div class="btnArea-center" style="margin-top:0" id="submitBtns">'
    		+'                                                    <span class="btn btn-point btn-lg"><button type="button" id="editBtn" data-route="one/add/user/">수정</button></span>'
    		+'                                                                            <span class="btn btn-grayline btn-lg"><button type="button" onclick="history.back(-1);">취소</button></span>'
    		+'                    </div>'
    		+'                </div>'
    		+'            </form>'
}
