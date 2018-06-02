function changehei(){
    //底层共用
    var heig = document.getElementById('nav');
    var clear = document.getElementById('clear');
    clear.style.height=heig.offsetHeight;
    
    }setInterval(changehei,200);
