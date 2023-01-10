function CloseUI() {
    $("#container").hide();
    $.post('http://natchkung-bodywrap/CloseUI', JSON.stringify({}));
}

function AgreeUI() {
    $("#container").hide();
    $.post('http://natchkung-bodywrap/AgreeUI', JSON.stringify({}));
}

$(document).ready(function(data) {
    $("#container").hide();

    $("#btn-unagree").click(function() {
        CloseUI();
    });

    $("#btn-agree").click(function() {
        AgreeUI();
    });

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $("#container").hide();
            $.post('http://natchkung-bodywrap/CloseUI', JSON.stringify({}));
            return
        }
    };

    window.addEventListener('message', function(event) {
        var data = event.data;
        var headername = event.data.headername;
        var timer = event.data.timer;

        if (data.showst) {
            $("#container").show();
            $("#headername").html(headername).show();
            $("#timer").html(timer).show();
        }
    });
});