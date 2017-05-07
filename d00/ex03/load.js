var progress = document.querySelectorAll("progress[value='60']")[0];
var p = document.querySelectorAll("p[data-value='60']")[0];

function start() {
    var i = 0;
    var interval = setInterval(function() {
        progress.value = i
        p.style.width = i + "%";
        p.setAttribute("data-value", i);
        if (i == 100) {
            p.style.color = "SpringGreen";
            clearInterval(interval);
        }
        i++;
    }, 10);
}
