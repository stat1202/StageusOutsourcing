function pwfindClick(){
    var email = input[0].value
    var hp = input[1].value

    var reg_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i
    var reg_hp = /^[0-9]*$/
    if(email==""){
        alert("이메일을 입력해주십시오.")
        event.preventDefault()
    }
    else if(hp==""){
        alert("전화번호를 입력해주십시오.")
        event.preventDefault()
    }
    else if( !reg_email.test(email) ){
        alert('형식에 맞게 작성해 주세요. ex) a123@naver.com')
        event.preventDefault()
    }
    else if( !reg_hp.test(hp) || hp.length != 11){
        alert("숫자만 입력해 주세요.")
        event.preventDefault()
    }
    else{

    }
}

var input = document.getElementsByClassName('input')

input[2].addEventListener('click', pwfindClick)