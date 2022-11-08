function idfindEvent(){
    var name = input[0].value
    var hp = input[1].value

    if(name==""){
        alert("이름을 입력해주십시오.")
    }
    if(hp==""){
        alert("전화번호를 입력해주십시오.")
    }
    else{
        alert("회원님의 이메일은 asdf123@naver.com 입니다.")
    }

}

var input = document.getElementsByClassName('input')

input[2].addEventListener('click', idfindEvent)