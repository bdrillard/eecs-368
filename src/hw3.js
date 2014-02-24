// Prints a square of a given dimension 
square = function() {
    chalk.print("Input the size of a square you'd like:");
    return {
        entrybox: function(str) {
            var dim = parseInt(str);
            // Check dimensions, apply insults if incorrect
            if (dim > 20) {
                chalk.println("Ever heard of moderation? How about a smaller dimension.");
                return square();
            } else if (dim < 4) {
                chalk.println("You insult my processing power with a paltry dimension! Greater, man!");
                return square();
            } else {
                // Because we said squares
                document.getElementById("chalk").style.lineHeight="50%";
                // Print a square
                for (var i = 0; i < dim; i++) {
                    for (var j = 0; j < dim; j++) {
                        chalk.print("*");
                    }
                    chalk.println("");
                }
            }
        }
    }
}

main = function() {
    return square();
}
