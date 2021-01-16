function push(){
    var form = document.querySelector('form');
    var data = new FormData(form);
    var req = new XMLHttpRequest();
    alert(data) // how to serialize?
    req.send(data);

// var serialized =
//'<head>' +
//   document.getElementsByTagName('head')[0].innerHTML +
//'</head><body>' +
//   document.body.innerHTML +
//'</body>';
// var str2 = "Updating"
// var str3 = str2.concat(serialized)

    alert(str3)
// return serialized
// return "the how is going to find a motherkind..."
// var serialized = document.documentElement.innerHTML
}
