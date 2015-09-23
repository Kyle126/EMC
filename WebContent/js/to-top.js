(function(win, doc){

 var compatMode = doc.compatMode,
  isChrome = win.navigator.userAgent.indexOf("Chrome") === -1 ? false : true,
  scrollEle = compatMode === "BackCompat" || isChrome ? doc.body : doc.documentElement,
  clientEle = compatMode === "BackCompat" ? doc.body : doc.documentElement,
  toTopImg = doc.getElementById("toTop"),
  rate = 0.6,
  timeGap = 10;

 toTopImg.onclick = function(){
  var moveInterval = setInterval(moveScroll, timeGap);
  function moveScroll(){
   var scrollTop = scrollEle.scrollTop;
   if(scrollTop === 0){
    clearInterval(moveInterval);
    return ;
   }
   scrollEle.scrollTop = scrollTop * rate;
  }
 };
 
 win.onscroll = function(){
  var display = toTopImg.style.display;
  if(scrollEle.scrollTop > clientEle.clientHeight){
   if(display !== "block"){
    toTopImg.style.display = "block";
   }
  }else{
   if(display !== "none"){
    toTopImg.style.display = "none";
   }
  }
 };
})(window, document);