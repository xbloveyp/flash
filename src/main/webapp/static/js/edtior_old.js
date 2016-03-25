/**
 * Created by Administrator on 2015/6/27.
 */
window.onload=function(){
    var canvas = new fabric.Canvas('c',{
        backgroundColor: '#CCCCCC',
        //selection:false,
        cornerSize: 6,
        transparentCorners: false
    });
    $("#rect").click(function(){
        isdraw = true;
        draw("rect");
    })
    $("#circle").click(function(){
        isdraw = true;
        draw("ellipse");
    })
    $("#mouse").click(function(){
        isdraw = false;
    })

    var _mouseX;
    var _mouseY;
    var canvasX;
    var canvasY;
    var obj;
    var isdraw = false;
    canvasX = 260;
    canvasY = 10;
    var shape;
    function draw(shape) {
        canvas.on('mouse:down', function (options) {
            if(options.target) {
                isdraw = false;
            }
            if (isdraw){
                console.log(options.target)
                _mouseX = options.e.clientX - canvasX;
                _mouseY = options.e.clientY - canvasY;
                if(shape=="rect") {
                    obj = new fabric.Rect({
                        left: _mouseX,
                        top: _mouseY,
                        fill: 'red'
                    });
                }
                if(shape=="ellipse"){
                    obj = new fabric.Ellipse({
                        cx: _mouseX,
                        cy: _mouseY,
                        fill: 'red'
                    });
                }
                canvas.add(obj);
                isdraw = true
            }
        })
        canvas.on('mouse:move', function (options) {
            console.log(isdraw)
            if (isdraw) {
                if(shape=="rect") {
                    obj.set({
                        width: options.e.clientX - canvasX - _mouseX,
                        height: options.e.clientY - canvasY - _mouseY
                    });
                }
                if(shape=="ellipse") {
                    obj.set({
                        rx: (options.e.clientX - canvasX - _mouseX)/2,
                        ry: (options.e.clientY - canvasY - _mouseY)/2
                    });
                }
                canvas.renderAll();
            }
        })
        canvas.on('mouse:up', function (options) {
            if (isdraw) {
                obj = null;
                _mouseX = null;
                _mouseY = null;
            }
        })
    }
    //canvas.on({'mouse:down': function(options) {
    //    console.log(options.e.clientX-canvas.width, options.e.clientY-canvas.height);
    //}});
};
