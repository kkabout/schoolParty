function active(evt){
	var tab = document.getElementsByClassName("tab");
    for (i = 0; i < tab.length; i++) {
        tab[i].className = tab[i].className.replace(" nabactive", "");
    }
    evt.currentTarget.className +=" nabactive";



}