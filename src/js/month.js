
var date = new Date() // 현재 날짜 가져오기

var year = date.getFullYear()
var month = date.getMonth()
var day = date.getDay()

var de = new Date(2022, 13, 1).getMonth()

console.log(de)

for(i=0; i < de; i++){
    var tmpdate = new Date(2022, 10, i+1).getDate()
    var tmpday = new Date(2022,10,i+1).getDay()

}
