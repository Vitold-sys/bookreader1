<link rel="stylesheet" href="http://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css" />
<script type="text/javascript" src="http://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>

<div class="container"><div class="row">

        <div class="col-lg-4">
            <div class="center-block"><canvas id="tagcanvas1" width="300" height="300"></canvas></div>
        </div>

        <div id="ptTags">
            <a href="/book" onclick="return false">Action and Adventure</a>
            <a href="/book" onclick="return false">Anthology</a>
            <a href="/book" onclick="return false">Classic</a>
            <a href="/book" onclick="return false">Crime and Detective</a>
            <a href="/book" onclick="return false">Drama</a>
            <a href="/book" onclick="return false">Fantasy</a>
            <a href="/book" onclick="return false">Horror</a>
            <a href="/book" onclick="return false">Mystery</a>
            <a href="/book" onclick="return false">Romance</a>
            <a href="/book" onclick="return false">Science</a>

        </div>

    </div></div>

<script src="http://bootstraptema.ru/plugins/2015/tagcanvas/jquery.tagcanvas.min.js" type="text/javascript"></script>
<script type="text/javascript">

    window.onload = function() {
        TagCanvas.textFont = 'Impact,"Arial Black",sans-serif';
        TagCanvas.textColour = '#ffff4d';
        TagCanvas.textHeight = 25;
        TagCanvas.outlineColour = '#f6f';
        TagCanvas.outlineThickness = 3;
        TagCanvas.outlineOffset = 5;
        TagCanvas.outlineMethod = 'outline';
        TagCanvas.maxSpeed = 0.06;
        TagCanvas.minBrightness = 0.2;
        TagCanvas.depth = 0.95;
        TagCanvas.pulsateTo = 0.2;
        TagCanvas.pulsateTime = 0.75;
        TagCanvas.decel = 0.9;
        TagCanvas.reverse = true;
        TagCanvas.shadow = '#336';
        TagCanvas.shadowBlur = 3;
        TagCanvas.shadowOffset = [1,1];
        TagCanvas.wheelZoom = false;
        TagCanvas.fadeIn = 800;
        try {
            TagCanvas.Start('tagcanvas1','ptTags');
            TagCanvas.Start('tagcanvas2','ptTags', {shape:'vcylinder'});
            TagCanvas.Start('tagcanvas3','ptTags', {shape:'hcylinder', lock: 'x'});
            TagCanvas.Start('tagcanvas4','ptTags1', {shape:'hring', lock: 'x'});
            TagCanvas.Start('tagcanvas5','ptTags', {
                shape:'vring(0.5)',
                offsetY: -60,
                lock: 'y'
            });
            TagCanvas.Start('tagcanvas6','ptTags', {
                shape:'DblHelix',
                lock: 'y'
            });
        } catch(e) {
        }
    };
    function DblHelix(n, rx, ry, rz) {
        var a = Math.PI / n, i, j, p = [], z = rz * 2 / n;
        for(i = 0; i < n; ++i) {
            j = a * i;
            if(i % 2)
                j += Math.PI;
            p.push([rx * Math.cos(j), rz - z * i, ry * Math.sin(j)]);
        }
        return p;
    }

</script>
