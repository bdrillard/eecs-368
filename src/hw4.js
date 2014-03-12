// Function for calculating factorial
factorial = function(num) {
    if(num == 0)
        return 1;
    else
        return num * factorial(num - 1);
}

// Provides callback for gathering and parsing input
getFactorial = function() {
    var input = $("#input");
    input.focus();
    // Event on all keypresses
    input.on("keyup", function(e) {
        var value = input.val();
        // Receive  integer
        if(parseInt(value) || value == 0) {
            var result = factorial(parseInt(value));
            $("#output").css("color", "black");
            $("#output").text(result);
            return getFactorial;
        // Receive string
        } else {
            $("#output").css("color", "red");
            $("#output").text("?");
            return getFactorial;
        }
    })      
}

main = function() {
    getFactorial();
}

$(function() {
    $("#input").css("float", "left");
    $("#output").css("display", "inline");
    main();
});
