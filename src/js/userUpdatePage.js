function update(){

    var email = input[0].value
    var pw = input[1].value
    var name = input[2].value
    var hp = input[3].value
    var dept = input[4].value

    if(email ==''){
        alert("이메일을 입력해주십시오.")
    }
    if(name==''){
        alert("이름을 입력해주십시오")
    }
    if(hp==''){
        alert("전화번호를 입력해주십시오")
    }
    if(dept=="Department"){
        alert("부서를 선택해 주십시오")
    }
}


var input = document.getElementsByClassName("input")

input[5].addEventListener("click", update)
