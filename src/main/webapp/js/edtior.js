/**
 * Created by Administrator on 2015/6/27.
 */
window.onload=function(){
    var canvas = new fabric.Canvas('c',{
        backgroundColor: '#ffffff',
        //selection:false,
        cornerSize: 6,
        transparentCorners: false
    });
    var rect;
    var _cornerSize = 6;
    var selected = null;
    var lookForm = document.getElementById('look-and-transform');
    var attrForm = document.getElementById('shape-attrs');
    var createForm = document.getElementById('pan');

    //加载用户保存的flash
    var init = function(){
        var url = "/loadCanvas"
        $.ajax({
            type: 'POST',
            url: url,
            success: function (result) {
                if (result.code == 200) {
                    canvas.loadFromJSON(result.data.content);
                }
            }
        });
    }
    init();

    $("#mouse").click(function(){
        isdraw = false;
        selected = null;
    })
    //记录图形个数
    var num_Rect=0,num_Circle=0,num_Triangle= 0,num_Text= 0,num_Line= 0,num_Polygon= 0,num_Freedraw=0;
    var moduleList = new Array();
    function addToModule(_shape,name){
        if(name=="rect"){
            num_Rect++;
            var innerhtml  = document.getElementById("module").innerHTML;
            innerhtml+="<p><a>Rect"+num_Rect+"</a></p>"
            document.getElementById("module").innerHTML = innerhtml;
            _shape.name = "Rect"+num_Rect;
            moduleList.push(_shape);
        }else if(name=="circle"){
            num_Circle++;
            var innerhtml  = document.getElementById("module").innerHTML;
            innerhtml+="<p><a>Cricle"+num_Circle+"</a></p>"
            document.getElementById("module").innerHTML = innerhtml;
            _shape.name = "Cricle"+num_Circle;
            moduleList.push(_shape);
        }else if(name=="triangle"){
            num_Triangle++;
            var innerhtml  = document.getElementById("module").innerHTML;
            innerhtml+="<p><a>Triangle"+num_Triangle+"</a></p>"
            document.getElementById("module").innerHTML = innerhtml;
            _shape.name = "Triangle"+num_Triangle;
            moduleList.push(_shape);
        }else if(name=="text"){
            num_Text++;
            var innerhtml  = document.getElementById("module").innerHTML;
            innerhtml+="<p><a>Text"+num_Text+"</a></p>"
            document.getElementById("module").innerHTML = innerhtml;
            _shape.name = "Text"+num_Text;
            moduleList.push(_shape);
        } else if(name=="line"){
            num_Line++;
            var innerhtml  = document.getElementById("module").innerHTML;
            innerhtml+="<p><a>Line"+num_Line+"</a></p>"
            document.getElementById("module").innerHTML = innerhtml;
            _shape.name = "Line"+num_Line;
            moduleList.push(_shape);
        }else if(name=="polygon"){
            num_Polygon++;
            var innerhtml  = document.getElementById("module").innerHTML;
            innerhtml+="<p><a>Polygon"+num_Polygon+"</a></p>"
            document.getElementById("module").innerHTML = innerhtml;
            _shape.name = "Polygon"+num_Polygon;
            moduleList.push(_shape);
        }else if (name = "freedraw"){
            num_Freedraw++;
            var innerhtml  = document.getElementById("module").innerHTML;
            innerhtml+="<p><a>Freedraw"+num_Freedraw+"</a></p>"
            document.getElementById("module").innerHTML = innerhtml;
            _shape.name = "Freedraw"+num_Freedraw;
            moduleList.push(_shape);
        }


    }

    //默认图形参数
    var shapeInfo = {
        rect: {left:10,top:10,width:200,height:100,rx:0,ry:0},
        circle: {left:20,top:20,radius:50},
        triangle: {left:50,top:50,width:80,height:100,rx:0,ry:0},
        line: {x1:10,y1:10,x2:100,y2:100},
        text:{left:20,top:50,fontSize:20,text:'hello'},
        //polygon:[{x: 170, y: 210},{x: 217.023, y: 234.721},{x: 208.042, y: 182.361},{x: 246.085, y: 145.279},{x: 193.511, y: 137.639},{x: 170, y: 90},{x: 146.489, y: 137.639},{x: 93.915, y: 145.279},{x: 131.958, y: 182.361},{x: 122.977, y: 234.721},{x: 170, y: 210}],{left: 250,top: 160,width: 200,height: 200}
    };
    //var pp = [{x: 170, y: 210},{x: 217.023, y: 234.721},{x: 208.042, y: 182.361},{x: 246.085, y: 145.279},{x: 193.511, y: 137.639},{x: 170, y: 90},{x: 146.489, y: 137.639},{x: 93.915, y: 145.279},{x: 131.958, y: 182.361},{x: 122.977, y: 234.721},{x: 170, y: 210}],{left: 250,top: 160,width: 200,height: 200};

    //默认图形参数
    var shapeAttribute = {
        rect: "left:10,top:10,width:200,height:100",
        circle: "left:20,top:20,radius:50",
        triangle: "left:50,top:50,width:80,height:100",
        line: "x1:10,y1:10,x2:100,y2:100",
        text:"left:20,top:50,fontSize:20,text:hello",
        polygon:"left: 250,top: 160,width: 200,height: 200"
    };
    //默认属性参数
    var defaultAttrs = {
        fill: '#00D5FF',
        stroke: '#FFFFFF',
        strokeWidth: 0
    };
    //点击图形面板，创建图形
    createForm.addEventListener('click', function(e) {
        if (e.target.tagName.toLowerCase() == 'button') {
            create(e.target.getAttribute('create'));
        }
    });
    //点击属性面板，更改属性
    attrForm.addEventListener('input', function(e) {
        if (e.target.tagName.toLowerCase() != 'input') return;
        var handle = e.target;
        selected.set(handle.name,handle.value);
        canvas.renderAll();
    });
    //点击属性面板，更改属性
    lookForm.addEventListener('input', function(e) {
        if (e.target.tagName.toLowerCase() != 'input') return;
        if (!selected) return;
        selected.set('fill', fill.value);
        defaultAttrs.fill = fill.value;
        selected.set('stroke', stroke.value);
        selected.set('stroke-width', strokeWidth.value);
        canvas.renderAll();
    });
    //创建图形
    function create(name) {
        if(name=="rect"){
            canvas.isDrawingMode = false;
            shape = new fabric.Rect();
            addToModule(shape,"rect");
        }else if(name=="circle"){
            canvas.isDrawingMode = false;
            shape = new fabric.Circle();
            addToModule(shape,"circle");
        }else if(name=="triangle"){
            canvas.isDrawingMode = false;
            shape = new fabric.Triangle();
            addToModule(shape,"triangle");
        } else if(name=="line"){
            canvas.isDrawingMode = false;
            shape = new fabric.Line();
            addToModule(shape,"line");
        }else if(name=="text"){
            canvas.isDrawingMode = false;
            shape = new fabric.Text("hello");
            addToModule(shape,"text");
        }else if (name=="mouse"){
            canvas.isDrawingMode = true;
            canvas.freeDrawingBrush = Circle;
            addToModule(shape,"freedraw");
        }else if (name=="polygon"){
            canvas.isDrawingMode = false;
            //shape = new fabric.Polygon(pp);
            shape = new fabric.Polygon([
                {x: 170, y: 210},
                {x: 217.023, y: 234.721},
                {x: 208.042, y: 182.361},
                {x: 246.085, y: 145.279},
                {x: 193.511, y: 137.639},
                {x: 170, y: 90},
                {x: 146.489, y: 137.639},
                {x: 93.915, y: 145.279},
                {x: 131.958, y: 182.361},
                {x: 122.977, y: 234.721},
                {x: 170, y: 210}], {
                left: 250,
                top: 160,
                width: 200,
                height: 200,
                fill: 'green'
            });
            addToModule(shape,"polygon");
        }
        shape.name = name;
        shape.set(shapeInfo[shape.name]);
        if(name=="line"){
            shape.set({fill: '#00D5FF',
                stroke: '#00D5FF',
                strokeWidth: 1})
        }
        else if (name="polygon"){
        }
        else {
            shape.set(defaultAttrs);
        }
        canvas.add(shape).setActiveObject(shape);
        select(shape);
    }
    //选中图形，用于属性栏更改属性用的
    function select(shape) {
        if (shape.name) {
            var attrs = shapeAttribute[shape.name].split(',');
            var attr, _name, value;
            attrForm.innerHTML = "";
            while (attrs.length) {
                attr = attrs.shift().split(':');
                _name = attr[0];
                value = shape._name || attr[1];
                createHandle(shape, _name, value);
            }
            selected = shape;
            updateLookHandle();
        }else {
            selected = shape;
        }
    }

    //将属性加到图形上
    function createHandle(shape, name, value) {
        var label = document.createElement('label');
        label.textContent = name;

        var handle = document.createElement('input');
        if(name=='text'){
            handle.setAttribute('name', name);
            handle.setAttribute('type', 'text');
            handle.setAttribute('value', value);
        }else {
            handle.setAttribute('name', name);
            handle.setAttribute('type', 'range');
            handle.setAttribute('value', value);
            handle.setAttribute('min', 0);
            handle.setAttribute('max', 50);
        }
        attrForm.appendChild(label);
        attrForm.appendChild(handle);
    }

    //更新属性参数 颜色，线条粗细，位置，旋转角度
    function updateLookHandle() {
        fill.value = selected.fill;
        stroke.value = selected.stroke;
        //left.value = selected ? selected.left : 0;
        //top.value = selected ? selected.top : 0;
        //rotate.value = selected ? selected.rotate : 0;
    }
    //禁止表单回车键
    document.onkeydown = function(event) {
        var target, code, tag;
        if (!event) {
            event = window.event; //针对ie浏览器
            target = event.srcElement;
            code = event.keyCode;
            if (code == 13) {
                tag = target.tagName;
                if (tag == "text") { return true; }
                else { return false; }
            }
        }
        else {
            target = event.target; //针对遵循w3c标准的浏览器，如Firefox
            code = event.keyCode;
            if (code == 13) {
                tag = target.tagName;
                if (tag == "INPUT") { return false; }
                else { return true; }
            }
        }
    };
    //保存用户的flash
    $("#save").click(function(){
        var canvasJson = JSON.stringify(canvas);
        var url = "/saveCanvas";
        $.ajax({
            type: 'POST',
            url: url,
            data:{canvasJson:canvasJson},
            success: function (result) {
                if (result.code == 200) {
                    alert("保存成功")
                }
            }
        });
    })
    //删除图形
    $("#delete").click(function(){
        canvas.remove(selected);
        console.log(selected);
        canvas.renderAll();
    })
    //清空画布
    $("#deleteAll").click(function(){
        canvas.clear();
        canvas.renderAll();
    })
    //复制图形
    $("#clone").click(function(){
        var clone = fabric.util.object.clone(selected);
        clone.set({left: 150,top: 150});
        canvas.add(clone);
        canvas.renderAll();
    })
    //上移一层
    $("#upOne").click(function(){
        canvas.bringForward(selected);
        canvas.renderAll();
    })
    //置于顶层
    $("#upTop").click(function(){
        canvas.bringToFront(selected);
        canvas.renderAll();
    })
    //下移一层
    $("#downOne").click(function(){
        canvas.sendBackwards(selected);
        canvas.renderAll();
    })
    //置于底层
    $("#downBottom").click(function(){
        canvas.sendToBack(selected);
        canvas.renderAll();
    })
    //导出图片
    $("#importImage").click(function(){
        var image = canvas.toDataURL();
        console.log(image);
    })
    //吧选中图形赋值给selected
    canvas.on('mouse:down', function(options) {
        activeObject = canvas.getActiveObject();
        if (activeObject){
            selected = activeObject;
            updateLookHandle();
        }
    });
    $("#load").click(function(){
        canvas.add( new fabric.Polygon(
            [
                {x: 50, y: 0},
                {x: 100, y: 100},
                {x: 50, y: 200},
                {x: 0, y: 100}
            ],{
                fill: 'red',
                left:100,
                top:100
            }));
    })
    //组合图形
    $("#groups").click(function(){
        var activeGroup = canvas.getActiveGroup()._objects;
        //var fristObject = activeGroup[0];
        //var group = new fabric.Group([fristObject],{left:fristObject.left,top:fristObject.top,originX:fristObject.originX,originY:fristObject.originY});
        //canvas.remove(fristObject);
        for (var i= 0;i<activeGroup.length;i++){
            console.log(activeGroup[i])
            group.add(activeGroup[i]);
            canvas.remove(activeGroup[i]);
            //canvas.renderAll();
        }
        group.selectable = true;
        canvas.add(group);
        canvas.renderAll();
        //console.log(activeGroup);
        //canvas.remove(activeGroup);
        //console.log(group);
        //canvas.add(group);
    })

    $(".importShape").click(function(){
        var url = "/getShape";
        var shapeName = $(this).attr("id");
        $.ajax({
            type: 'POST',
            url: url,
            data:{name: shapeName},
            success: function (result) {
                if (result.code==200){
                    var json = JSON.parse(JSON.stringify(canvas));
                    var ob = json.objects;
                    var library = result.data;
                    var shape = JSON.parse(library).objects;
                    for(var i=0;i<shape.length;i++){
                        ob.push(shape[i]);
                    }
                    json.objects=ob;
                    canvas.loadFromJSON(JSON.stringify(json));
                }
            }
        });
    });
};
