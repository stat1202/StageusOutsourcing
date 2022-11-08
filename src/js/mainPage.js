
function menuClick(){
    var nav = document.getElementsByTagName("nav")
    if(menu_click==0){
        nav[0].style.display="flex"
        menu_click = 1
    }
    else{
        nav[0].style.display="none"
        menu_click = 0
    }
}

function mobilebtnClick(){
    var mobile = document.getElementById("mobile_input")

    if(mobile_click == 0){
        mobile.style.display = 'flex'
        mobile_click = 1
    }
    else{
        mobile.style.display = 'none'
        mobile_click = 0
    }
}
function bodyClick(){
    var nav = document.getElementsByTagName("nav")
    if(event.target.id != "menu_icon"){
        nav[0].style.display="none"
        menu_click = 0
    }
}

function delete_scheduleClick(){
    var bool = confirm("정말 삭제하시겠습니까?")
    if(bool==1){

    }
    else{

    }

}

function update_scheduleClick(){
    event.target.parentElement.style.display= 'none'
    var hidden = event.target.parentElement.parentElement.children[0].children
    hidden[1].style.display = 'flex'
}

function ok_scheduleClick(){
    event.target.parentElement.style.display='none'
    var promise_right = event.target.parentElement.parentElement.parentElement.children[1]
    promise_right.style.display = 'flex'
}

// 달력 만들기
var today = new Date()

var year = today.getFullYear()
var month = today.getMonth()

var month_names = ['Jan', 'Feb', "Mar", "Apr", "May","June", "July", "Aug", "Sep","Oct","Nov","Dec"]

var num_day = new Date( year, month, 0).getDate()

var monthName = document.getElementById("month")

monthName.innerHTML = month_names[month -1]

var schedule_div = document.getElementById("schedule_div")
for(var i = 0; i < num_day; i++){
    var tmpdate = document.createElement('div')
    tmpdate.setAttribute('class','day')

    tmpdate.innerHTML = (i+1) + "일"

    var tmpday = new Date(year, month, i).getDay()
    if(tmpday== '6'){
        tmpdate.style.color = 'blue'
    }
    if(tmpday=='0'){
        tmpdate.style.color = 'red'
    }
    
    var tmpform = document.createElement('form')
    tmpform.setAttribute("class", "schedule_form")

    tmpform.appendChild(tmpdate)

    schedule_div.appendChild(tmpform)
}


// 사이드바 열고 닫힘
var menu_click = 0
var menu_icon = document.getElementById("menu_icon")


menu_icon.addEventListener("click",menuClick)

var body = document.getElementsByTagName("body")

// 삭제 알림 추가
var delete_btns = document.getElementsByClassName("delete_btn")
var update_btns = document.getElementsByClassName("update_btn")
var ok_btns = document.getElementsByClassName("ok_btn")

var body_click = document.body

body_click.addEventListener("click", bodyClick)

for(var i=0 ;i<delete_btns.length; i++){
    delete_btns[i].addEventListener("click",delete_scheduleClick)
    update_btns[i].addEventListener("click",update_scheduleClick)
    ok_btns[i].addEventListener("click", ok_scheduleClick)    
}

// 모바일 일정 입력창
var mobile_click = 0
var mobile_btn = document.getElementById("mobile_middle_btn")

mobile_btn.addEventListener("click", mobilebtnClick)