function signupClick(){

    var email = input[0].value
    var pw = input[1].value
    var name = input[2].value
    var hp = input[3].value
    var dept = input[4].value
// 정규식 검사
    var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
    var reg_pw = /^[A-Za-z0-9]{4,20}$/
    var reg_name = /^[가-힣]{1,20}$/
    var reg_hp = /^[0-9]*$/

    if(email ==''){
        alert("이메일을 입력해주십시오.")
        event.preventDefault()
    }
    else if(pw==''){
        alert("비밀번호를 입력해주십시오")
        event.preventDefault()
    }
    else if(name==''){
        alert("이름을 입력해주십시오")
        event.preventDefault()
    }
    else if(hp==''){
        alert("전화번호를 입력해주십시오")
        event.preventDefault()
    }
    else if(dept=="Department"){
        alert("부서를 선택해 주십시오")
        event.preventDefault()
    }
    // 정규식
    else if( !reg_email.test(email) ){
        alert('형식에 맞게 작성해 주세요. ex) a123@naver.com')
        console.log(reg_email.test)
        event.preventDefault()
    }
    else if( !reg_pw.test(pw)){
        alert('4~20자의 영어와 숫자만 입력해 주세요.')
        event.preventDefault()
    }
    else if( !reg_name.test(name)){
        alert('올바른 이름 형식이 아닙니다.')
        event.preventDefault()
    }
    else if( !reg_hp.test(hp) || hp.length != 11){
        alert("숫자만 입력해 주세요.")
        event.preventDefault()
    }
}


var input = document.getElementsByClassName("input")

input[5].addEventListener("click", signupClick)
