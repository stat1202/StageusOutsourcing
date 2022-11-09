function idfindClick(){
    var name = input[0].value
    var hp = input[1].value

    var reg_hp = /^[0-9]*$/
    var reg_name = /^[가-힣]{1,20}$/

    if(name==""){
        alert("이름을 입력해주십시오.")
        event.preventDefault()
    }
    else if(hp==""){
        alert("전화번호를 입력해주십시오.")
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

var input = document.getElementsByClassName('input')

input[2].addEventListener('click', idfindClick)