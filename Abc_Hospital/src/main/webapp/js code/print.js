function prints(paravalue){
            var backup=document.body.innerHTML;
            var divcontent=document.getElementById(paravalue).innerHTML;
            document.body.innerHTML =divcontent;
            window.print();
            document.body.innerHTML=backup;
    }