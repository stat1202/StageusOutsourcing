function update_user(){
    location.href="./userUpdatePage.jsp"
}

function delete_user(){
    var bool = confirm("정말 삭제하시겠습니까?")
    if(bool==1){

    }
    else{

    }

}

var update_btn = document.getElementById("update")
var delete_btn = document.getElementById("delete")

update_btn.addEventListener("click", update_user)
delete_btn.addEventListener("click", delete_user)
