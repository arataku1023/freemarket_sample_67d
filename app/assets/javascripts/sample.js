var time = new Date();
var year = time.getFullYear();
for (var i = year; i >= 1900; i--) {
  createOptionElements(i,‘year’);
}
for (var i = 1; i <= 12; i++) {
  createOptionElements(i,‘month’);
}
for (var i = 1; i <= 31; i++) {
  createOptionElements(i,‘day’);
}
function createOptionElements(num,parentId){
    var doc = document.createElement(‘option’);
    doc.value = doc.innerHTML = num;
    document.getElementById(parentId).appendChild(doc);
}