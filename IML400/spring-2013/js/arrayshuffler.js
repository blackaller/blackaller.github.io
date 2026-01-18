
        var gradient = new Array;
        var gradientLength = 16; // only powers of 2 for now :D
        var cellWidth = 80;
        var counter = gradientLength; // for the animation

        function fillGradient(array, size, id){
            var colorNum = 0;
            if (size > 16) size = 16;

            for (var i = 0; i < size; i++) {
                colorNum = ((16/size)*i%16).toString(16);
                array[i] = "#" + colorNum + colorNum + colorNum + colorNum + colorNum + colorNum;
            }

            $(id).css( 'width', size * cellWidth + "px" );
        };    

        function printGradient(id, array){
            $(id).empty();
            
            $(id).append("<div class='printed-array'></div>");          
            for (var i = 0; i < array.length; i++) {
                $(id).append("<div class='array-cell' id='cell-" + i + "'></div>");
                $("#cell-" + i).css("background", array[i]);
                $(".array-cell").css( 'width', cellWidth + "px");
            }
            $(id).append("<div id='counter'></div>");  
        };

        function shuffleStep(int, array){
            var p = parseInt(Math.random()*array.length);
            var t = array[int];
            array[int] = array[p];
            array[p] = t;
        };

        function animatedArrayShuffle(theArray, theID, withAlert) {
            var len = theArray.length;
            var i = len - 1;

            var timerId = setTimeout(function(){

                console.log('Begin step ' + ( 1 + len - counter));
                if (withAlert) alert("Do step " + ( 1 + len - counter) + "?");
                console.log(theArray);

                printGradient(theID, theArray);
                $("#counter").append(( 1 + len - counter) + '');
                counter = counter-1;
                shuffleStep(counter, theArray);
                if (counter > 0 ) console.log('Preparing step ' + ( 1 + len - counter));
                else console.log('Done shuffling');
                animatedArrayShuffle(theArray, theID, withAlert);
            }, 666);

            if ((counter<=0) || (counter>20)) clearTimeout(timerId);
        };

        $(function(wantAlert) {
            fillGradient(gradient, gradientLength, "#wrapper");
            printGradient("#wrapper", gradient);

            wantAlert = prompt("Want alerts? Answer yes/no");
            console.log(wantAlert);

            if (wantAlert == "true" || wantAlert == "yes")
                wantAlert = true;
            else
                wantAlert = false;

            animatedArrayShuffle(gradient, "#wrapper", wantAlert);
        });