function update_userClick(){
    var hidden = document.getElementsByClassName("hidden")
    var info = document.getElementsByClassName("info")
    var update_btn = document.getElementById("update")
    var delete_btn = document.getElementById("delete")
    var ok_btn = document.getElementById("ok")

    update_btn.style.display="none"
    delete_btn.style.display="none"
    ok_btn.style.display="flex"

    for(var i = 0 ; i < hidden.length; i ++){
        hidden[i].style.display = "flex"
        info[i].style.display = "none"
    }
}

function okClick(){
    var hidden = document.getElementsByClassName("hidden")
    var info = document.getElementsByClassName("info")
    var update_btn = document.getElementById("update")
    var delete_btn = document.getElementById("delete")
    var ok_btn = document.getElementById("ok")

    update_btn.style.display="flex"
    delete_btn.style.display="flex"
    ok_btn.style.display="none"

    for(var i = 0 ; i < hidden.length; i ++){
        hidden[i].style.display = "none"
        info[i].style.display = "flex"
    }
}

function delete_userClick(){
    var bool = confirm("정말 삭제하시겠습니까?")
    if(bool==1){

    }
    else{

    }

}


var update_btn = document.getElementById("update")
var delete_btn = document.getElementById("delete")
var ok_btn = document.getElementById("ok")

update_btn.addEventListener("click", update_userClick)
delete_btn.addEventListener("click", delete_userClick)
ok_btn.addEventListener("click", okClick)
