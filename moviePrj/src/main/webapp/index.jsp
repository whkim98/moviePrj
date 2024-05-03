<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>영화 예매 Prj</title>
</head>
<link rel="stylesheet" href="css/home.css" />
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v2.1.9/css/unicons.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<body>

	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3">
							<span>로그인</span><span>회원가입</span>
						</h6>
						
						<input class="checkbox" type="checkbox" id="reg-log"
							name="reg-log" /> <label for="reg-log"></label>
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">

								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">로그인</h4>
											<form action="./logincheck.jsp" method="post" name="logincheck">
												<div class="form-group">
													<input type="text" name="user_id" class="form-style"
														placeholder="아이디" id="user_id" autocomplete="off">
													<i class="input-icon uil uil-user"></i>
												</div>

												<div class="form-group mt-2">
													<input type="password" name="user_password"
														class="form-style" placeholder="비밀번호" id="user_password"
														autocomplete="off"> <i
														class="input-icon uil uil-lock-alt"></i>
												</div>
												<a onclick="login(this.form)">
													<div class="erplog">LOGIN</div>
												</a>
											</form>
										</div>
									</div>
								</div>

								<div class="card-back">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">회원가입</h4>
											<form action="./signUpCheck.jsp" method="post" name="signUp2">
												<div class="form-group">
													<input type="text" name="user_id" class="form-style"
														placeholder="아이디" id="user_id2" autocomplete="off">
												</div>
												<div class="form-group">
													<input type="password" name="user_password"
														class="form-style" placeholder="비밀번호" id="user_password2"
														autocomplete="off">
												</div>
												<div class="form-group">
													<input type="text" name="user_name" class="form-style"
														placeholder="이름" id="user_name" autocomplete="off">
												</div>
												<div class="form-group">
													<input type="text" name="user_addr1" class="form-style"
														placeholder="주소" id="user_addr1" autocomplete="off">
												</div>

												<script>
													// input 요소를 찾습니다.
													var userInput = document
															.getElementById("user_addr1");

													// input 요소를 클릭했을 때 searchAddr() 함수를 호출하도록 이벤트 리스너를 추가합니다.
													userInput.addEventListener(
															"click",
															function() {
																searchAddr();
															});

													function searchAddr() {
														new daum.Postcode(
																{
																	oncomplete : function(
																			data) {
																		// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

																		// 각 주소의 노출 규칙에 따라 주소를 조합한다.
																		// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
																		var addr = ''; // 주소 변수
																		var extraAddr = ''; // 참고항목 변수

																		// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
																		if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																			addr = data.roadAddress;
																		} else { // 사용자가 지번 주소를 선택했을 경우(J)
																			addr = data.jibunAddress;
																		}

																		// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
																		if (data.userSelectedType === 'R') {
																			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																			if (data.bname !== ''
																					&& /[동|로|가]$/g
																							.test(data.bname)) {
																				extraAddr += data.bname;
																			}
																			// 건물명이 있고, 공동주택일 경우 추가한다.
																			if (data.buildingName !== ''
																					&& data.apartment === 'Y') {
																				extraAddr += (extraAddr !== '' ? ', '
																						+ data.buildingName
																						: data.buildingName);
																			}
																			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																			if (extraAddr !== '') {
																				extraAddr = ' ('
																						+ extraAddr
																						+ ')';
																			}
																			// 조합된 참고항목을 해당 필드에 넣는다.
																			document
																					.getElementById("extraAddr").value = extraAddr;

																		} else {
																			document
																					.getElementById("user_addr2").value = '';
																		}

																		// 우편번호와 주소 정보를 해당 필드에 넣는다.
																		document
																				.getElementById('user_postal').value = data.zonecode;
																		document
																				.getElementById("user_addr1").value = addr;
																		// 커서를 상세주소 필드로 이동한다.
																		document
																				.getElementById(
																						"user_addr2")
																				.focus();
																	}
																}).open();
														customInput.style.display = "none";
													}
												</script>

												<div class="form-group">
													<input type="text" name="user_addr2" class="form-style"
														placeholder="상세주소" id="user_addr2" autocomplete="off">
												</div>
												<div class="form-group">
													<input type="text" name="user_postal" class="form-style"
														placeholder="우편번호" id="user_postal" autocomplete="off">
												</div>
												<input type="hidden" id="extraAddr" placeholder="참고항목">
												<div class="form-group">
													<input type="text" name="user_residentno"
														class="form-style" placeholder="주민등록번호(-를 제외하고 적어주세요)"
														id="user_residentno" autocomplete="off">
												</div>
												<div class="form-group">
													<input type="text" name="user_phone" class="form-style"
														placeholder="전화번호(-를 제외하고 적어주세요)" id="user_phone" autocomplete="off">
												</div>
												<a onclick="signUpp(this.form)">
													<div class="erplog">회원가입</div>
												</a>
											</form>

										</div>

									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
	function login(f) {
		var user_id = document.getElementById("user_id");
		var user_password = document.getElementById("user_password");

		if (user_id.value == "") {
			alert("아이디를 입력해주세요!")
			user_id.focus();
		} else if (user_password.value == "") {
			alert("비밀번호를 입력해주세요!");
			user_password.focus();
		} else {
			document.logincheck.submit();
		}
	}

	function signUpp(f) {
		var user_id = document.getElementById("user_id2");
		var user_password = document.getElementById("user_password2");
		var user_name = document.getElementById("user_name");
		var user_addr1 = document.getElementById("user_addr1");
		var user_addr2 = document.getElementById("user_addr2");
		var user_postal = document.getElementById("user_postal");
		var user_residentno = document.getElementById("user_residentno");
		var user_phone = document.getElementById("user_phone");

		console.log(user_id.value);
		
		if (user_id.value == "") {
			alert("아이디를 입력해주세요!");
			user_id.focus();
		} else if (user_password.value == "") {
			alert("비밀번호를 입력해주세요!");
			user_password.focus();
		} else if (user_name.value == "") {
			alert("이름을 입력해주세요!");
			user_name.focus();
		} else if(user_addr1.value == ""){
			alert("주소를 입력해 주세요");
			user_addr1.focus();
		} else if(user_residentno.value == ""){
			alert("주민등록번호를 입력해 주세요");
			user_residentno.focus();
		} else if(user_phone.value == ""){
			alert("전화번호를 입력해 주세요");
			user_phone.focus();
		}else {
			alert("회원가입이 완료됐습니다.");
			document.signUp2.submit();
		}
	}
</script>
</html>