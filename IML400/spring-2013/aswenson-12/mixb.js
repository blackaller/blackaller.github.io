window.onload = function(){
    var paper = new Raphael('canvas', 400, 400);
    //center of svg.


    var inner = Raphael.animation({
        transform: 'r360,200,200r360'
    }, 30000)

    //inner(animation.repeat(2));

    var outer = Raphael.animation({
        transform: 'r-360,200,200r-360'
    }, 80000)
    //190, 166, 15
    var orbbl = paper.circle(230, 179, 15).attr({
        fill: '#66f'
    });
    var orbgr = paper.circle(190, 166, 15).attr({
        fill: '#5b5'
    });
    var orbre = paper.circle(189, 233, 15).attr({
        fill: '#d55', href: 'http://www.somethingawful.com/'
    });
    var orbpu = paper.circle(230, 221, 15).attr({
        fill: "#a5e" 
    });
    var orbor = paper.circle(165, 199, 15).attr({
        fill: '#da5'
    });

    var s1 = paper.circle(200, 100, 10);
    var s2 = paper.circle(105, 230, 10);
    var s3 = paper.circle(105, 170, 10);
    var s4 = paper.circle(200, 300, 10);
    var s5 = paper.circle(140, 280, 10);
    var s6 = paper.circle(260, 280, 10);
    var s7 = paper.circle(140, 120, 10);
    var s8 = paper.circle(260, 120, 10);
    var s9 = paper.circle(295, 170, 10);
    var sx = paper.circle(295, 230, 10);
    var t1 = paper.circle(250, 250, 10);
    var t2 = paper.circle(150, 150, 10);
    var t3 = paper.circle(150, 250, 10);
    var t4 = paper.circle(250, 150, 10);

    var tset = paper.set();
    tset.push(t1,t2,t3,t4,s1,s2,s3,s4,s5,s6,s7,s8,s9,sx);
    tset.attr({fill: "#a5e", "fill-opacity": .0}).mouseover(function () {
                                this.animate({"fill-opacity": 1}, 500);
    //    this.glow({color: "#FFF"});
                            }).mouseout(function () {
                                this.animate({"fill-opacity": .5}, 500);
                            });

    var o1 = paper.circle(200, 100, 10).data("orbname", "o1");
    var o2 = paper.circle(105, 230, 10).data("orbname", "o2");
    var o3 = paper.circle(105, 170, 10).data("orbname", "o3");
    var o4 = paper.circle(200, 300, 10).data("orbname", "o4");
    var o5 = paper.circle(140, 280, 10).data("orbname", "o5");
    var o6 = paper.circle(260, 280, 10).data("orbname", "o6");
    var o7 = paper.circle(140, 120, 10).data("orbname", "o7");
    var o8 = paper.circle(260, 120, 10).data("orbname", "o8");
    var o9 = paper.circle(295, 170, 10).data("orbname", "o9");
    var ox = paper.circle(295, 230, 10).data("orbname", "ox");
    var ox1 = paper.circle(250, 250, 10).data("orbname", "ox1");
    var ox2 = paper.circle(150, 150, 10).data("orbname", "ox2");
    var ox3 = paper.circle(150, 250, 10).data("orbname", "ox3");
    var ox4 = paper.circle(250, 150, 10).data("orbname", "ox4");

    var oset = paper.set();
    oset.push(ox1,ox2,ox3,ox4,o1,o2,o3,o4,o5,o6,o7,o8,o9,ox);

    oset.attr({fill: "#da5", "fill-opacity": .0}).mouseover(function (){ this.animate({"fill-opacity": 1}, 500); }).mouseout(function () { this.animate({"fill-opacity": .5}, 500);});

    oset.click(function () {alert(this.data("orbname"))} );


    /*

    oset.click(function () {functionThatScrollsAndOpensCard(this.data("orbname"))} );

    functionThatScrollsAndOpensCard(orbID){
        generateHTMLForCard(orbID);

        callParallaxAndScrollDown();
        showHTMLForCard(orbID, "fade");
    }
    

    */


    //.animate(animation.repeat(Infinity));
    var orbset = paper.set();
    orbset.push(orbor,orbbl,orbgr,orbre,orbpu);
    orbset.attr({"fill-opacity": .5}).mouseover(function () {
                                this.animate({"fill-opacity": 1}, 500);
                            }).mouseout(function () {
                                this.animate({"fill-opacity": .5}, 500);
    });

    var miniset = paper.set();
    miniset.push(oset,tset);
    miniset.hide();

    orbre.animate(inner.repeat(Infinity));
    orbgr.animate(inner.repeat(Infinity));
    orbbl.animate(inner.repeat(Infinity));
    orbpu.animate(inner.repeat(Infinity)).click(function(){
        miniset.animate({
            "10%": {"fill-opacity": .0},
            "80%": miniset.hide(),
            "90%": tset.show()
        }, 1000);
        tset.animate(outer.repeat(Infinity));
        tset.animate({"fill-opacity": .5}, 700);
    });

    orbor.animate(inner.repeat(Infinity)).click(function(){
        miniset.animate({"fill-opacity": .0}, 700);
        miniset.hide();
        oset.show();
        oset.animate(outer.repeat(Infinity));
        oset.animate({"fill-opacity": .5}, 700);
    });
};