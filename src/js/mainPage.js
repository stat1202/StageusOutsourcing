
function menuClick(){
    var nav = document.getElementsByTagName("nav")
    var main = document.getElementsByTagName("main")
    if(menu_click==0){
        nav[0].style.display="flex"
        main[0].style.paddingLeft = "150px"
        menu_click = 1
    }
    else{
        nav[0].style.display="none"
        main[0].style.paddingLeft = "0px"
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
    var main = document.getElementsByTagName("main")
    if(event.target.id != "menu_icon"){
        nav[0].style.display="none"
        menu_click = 0
        main[0].style.paddingLeft = "0px"
    }
}

function add_scheduleClick(){
    var input = document.getElementsByClassName("input")
    if(input[0].value ==""){
        alert("내용을 채워주세요")
        event.preventDefault()
    }
    else if(input[0].value.length >20){
        alert("20자 이내로 적어주세요")
        event.preventDefault()
    }
    else if(input[1].value ==""){
        alert("날짜를 정해주세요")
        event.preventDefault()
    }
    else if(input[2].value ==""){
        alert("시간을 정해주세요.")
        event.preventDefault()
    }
}

function add_mobilesceduleClick(){
    var input = document.getElementsByClassName("input")
    if(input[3].value ==""){
        alert("내용을 채워주세요")
        event.preventDefault()
    }
    else if(input[3].value.length >20){
        alert("20자 이내로 적어주세요")
        event.preventDefault()
    }
    else if(input[4].value ==""){
        alert("날짜를 정해주세요")
        event.preventDefault()
    }
    else if(input[5].value ==""){
        alert("시간을 정해주세요.")
        event.preventDefault()
    }
}

function delete_scheduleClick(){
    var bool = confirm("정말 삭제하시겠습니까?")

    var cur_scheduleform = event.target.parentElement.parentElement.parentElement
    if(bool==1){
        cur_scheduleform.action = "../jsp/scheduleDeleteAction.jsp"
    }
    else{
        event.preventDefault()
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

    var cur_scheduleform = event.target.parentElement.parentElement.parentElement.parentElement.parentElement
    console.log(cur_scheduleform)
    cur_scheduleform.action = "../jsp/scheduleUpdateAction.jsp"
    promise_right.style.display = 'flex'

}

//달력 출력
// function printCalendar(){
//     monthName.innerHTML = month_names[month]
//     monthValue.value = month+1
//     var schedule_div = document.getElementById("schedule_div")
//     for(var i = 0; i < num_day; i++){
//         var tmpdate = document.createElement('p')
//         tmpdate.setAttribute('class','day')
    
//         tmpdate.innerHTML = (i+1) + "일"
    
//         var tmpday = new Date(year, month, i+1).getDay()
//         if(tmpday== '6'){
//             tmpdate.style.color = 'blue'
//         }
//         if(tmpday=='0'){
//             tmpdate.style.color = 'red'
//         }
        
//         var tmpdiv = document.createElement("div")
//         tmpdiv.className = "schedule_all"


//         var tmpform = document.createElement('form')
//         tmpform.setAttribute("class", "schedule_form")
//         if( i < 10){
//             tmpform.id = "0" + (i+1)
//         }else{
//             tmpform.id= i+1
//         }
        
//         tmpdiv.appendChild(tmpdate)
//         tmpdiv.appendChild(tmpform)
    
//         schedule_div.appendChild(tmpdiv)
//     }
    
// }

// function rightArrowClick(){
//     var schedule_div = document.getElementById("schedule_div")
//     if(month < 11 ){
//         month += 1
//     }
//     else if( month >= 11){
//         month = month - 12 + 1
//         year += 1
//     }
//     num_day = new Date( year, month+1, 0).getDate()
//     console.log(month)
//     while(schedule_div.hasChildNodes()){
//         schedule_div.removeChild(schedule_div.firstChild)
//     }
//     printCalendar()
// }

// function leftArrowClick(){
//     var schedule_div = document.getElementById("schedule_div")
//     if(month <= 11 && month > 0){
//         month -=1
//     }
//     else if(month <= 0){
//         month = month + 12 - 1
//         year -= 1
//     }
    
//     console.log(month)
//     num_day = new Date( year, month-1, 0).getDate()

//     while(schedule_div.hasChildNodes()){
//         schedule_div.removeChild(schedule_div.firstChild)
//     }
//     printCalendar()
// }

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

//일정 추가 기능
var add_btn = document.getElementById("schedule_add")
add_btn.addEventListener("click", add_scheduleClick)

var madd_btn = document.getElementById("mschedule_add")

madd_btn.addEventListener("click", add_mobilesceduleClick)

// // 달력 만들기
// var today = new Date()

// var year = today.getFullYear()
// var month = today.getMonth()
// //0 - 1월 11 - 12월

// var month_names = ['Jan', 'Feb', "Mar", "Apr", "May","June", "July", "Aug", "Sep","Oct","Nov","Dec"]

// var num_day = new Date( year, month+1, 0).getDate()

// var monthName = document.getElementById("month")
// var monthValue = document.getElementById("month_value")
// //달력 버튼  기능 추가
// var arrow = document.getElementsByClassName("arrow")

// arrow[1].addEventListener("click", rightArrowClick)
// arrow[0].addEventListener("click", leftArrowClick)

