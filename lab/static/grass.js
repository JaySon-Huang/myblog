//
// origin version url: http://codepen.io/tholman/pen/Apvxe
// Click to clear the canvas.
// restructed by JaySon. Jun 1st, 2015.
//
function get_magnitude(x, y){
    return Math.sqrt((x * x) + (y * y));
}
var Point = {
    init: function(x, y){
        var point = {};
        point.x = x;point.y = y;
        return point;
    },
    copy: function(rhs){
        point = {};
        point.x=rhs.x;point.y=rhs.y;
        return point;
    }
};
var Straw = {
    init: function(mtx, len){
        var straw = {};

        var angle = Math.random() * (Math.PI/6 - Math.PI/64) + Math.PI/64;
        if(Math.random() > 0.5){
            angle *= -1;
        }
        var tmt = new Matrix2D();
        tmt.scale(0.95, 0.95);
        // tmt.rotate(angle);
        tmt.translate(12, 0);
        
        var w = 0.5;// QUESTION:
        straw.c1 = Point.init(-w * mtx.c + mtx.tx, -w * mtx.d + mtx.ty);
        straw.p1 = Point.init(-w * mtx.c + mtx.tx, -w * mtx.d + mtx.ty);
        straw.c2 = Point.init(w * mtx.c + mtx.tx, w * mtx.d + mtx.ty);
        straw.p2 = Point.init(w * mtx.c + mtx.tx, w * mtx.d + mtx.ty);
        straw.vmt = mtx;
        straw.tmt = tmt;
        straw.r = angle;
        straw.w = len/20;
        straw.grow_count = 0;

        straw.paint_grow = function(context){
            if (Math.random() > 0.9){
                straw.tmt.rotate(-straw.r * 2);
                straw.r *= -1;
            }
            straw.vmt.prependMatrix(straw.tmt);
            var cc1 = Point.init(-straw.w*straw.vmt.c+straw.vmt.tx, -straw.w * straw.vmt.d + straw.vmt.ty);
            var pp1 = Point.init((straw.c1.x + cc1.x) / 2, (straw.c1.y + cc1.y) / 2);
            var cc2 = Point.init(straw.w * straw.vmt.c + straw.vmt.tx, straw.w * straw.vmt.d + straw.vmt.ty);
            var pp2 = Point.init((straw.c2.x + cc2.x) / 2, (straw.c2.y + cc2.y) / 2);
            
            // QUESTION:
            context.fillStyle = '#000000';
            context.strokeStyle = '#000000';
            context.beginPath();
            context.moveTo(straw.p1.x , straw.p1.y);
            context.quadraticCurveTo(straw.c1.x, straw.c1.y, pp1.x, pp1.y);
            context.lineTo(pp2.x, pp2.y);
            context.quadraticCurveTo(straw.c2.x, straw.c2.y, straw.p2.x, straw.p2.y);
            context.closePath();
            context.fill();
            
            straw.c1 = cc1;straw.p1 = pp1;straw.c2 = cc2;straw.p2 = pp2;
        };
        return straw;
    }
};
var StrawPainter = {
    init: function(canvas) {
        var painter = {};
        painter.straw_queue = [];  // straws to be painted
        painter.QUEUE_MAX_LEN = 100;  // max queue length
        painter.N = 80;

        painter.canvas = canvas;
        painter.context = canvas.getContext('2d');

        painter.width = canvas.clientWidth;
        painter.height = canvas.clientHeight;
        canvas.width = painter.width;// resize the canvas
        canvas.height = painter.height;

        painter.new_point = Point.init(0, painter.height-20);
        painter.last_point = Point.init(500, 500);

        painter.on_mouseMove = function(e){
            painter.new_point.x = e.layerX;
            painter.new_point.y = e.layerY;
        };
        painter.on_mouseDown = function(e){
            e.preventDefault();
            painter.canvas.width = painter.canvas.width; // QUESTION:why this ?
            painter.straw_queue = [];
        };
        painter.paint = function(){
            var new_point = painter.new_point;
            var last_point = painter.last_point;
            var detal = Point.init(new_point.x - last_point.x, new_point.y - last_point.y);

            var len = Math.min(get_magnitude(detal.x, detal.y), 50) + 8;
            if (len < 10){
                return;
            }// return if the mouse "don't move"

            var matrix = new Matrix2D();// QUESTION:
            matrix.rotate(-(Math.atan2(detal.x, detal.y)));
            matrix.translate(new_point.x, new_point.y);

            straw = Straw.init(matrix, len);
            painter.straw_queue.push(straw);
            if (painter.straw_queue.length > painter.QUEUE_MAX_LEN){
                painter.straw_queue.shift();
            }

            painter.context.beginPath();// QUESTION:
            painter.context.strokeStyle = '#000000';
            painter.context.moveTo(last_point.x, last_point.y);
            painter.context.lineTo(new_point.x, new_point.y);
            painter.context.stroke();
            painter.context.closePath();

            painter.last_point = Point.copy(new_point);
        };
        painter.update_context = function(){
            var len = painter.straw_queue.length;
            for (var i = 0; i < len; i++) {
                var straw = painter.straw_queue[i];
                if (straw.grow_count < painter.N){
                    straw.paint_grow(painter.context);// grow up and paint out
                    straw.grow_count++;
                }else{
                    painter.straw_queue.splice(i,1);// delete this straw
                    i--;len--;
                }
            }
            painter.paint();
        };
        painter.interval = setInterval(painter.update_context, 20);
        canvas.addEventListener('mousemove', painter.on_mouseMove, false);
        canvas.addEventListener('click', painter.on_mouseDown, false);
        return painter;
    }
};

var painter, interval;
$(document).ready(
    setTimeout(function(){
        painter = StrawPainter.init(document.getElementById("canvas"));
        interval = setInterval(function(){// draw the first line
            painter.new_point.x += 20;
            if (painter.new_point.x >= painter.width){
                window.clearInterval(interval);
            }
        }, 24);
    }, 100 )// begin to draw after 100ms
);

