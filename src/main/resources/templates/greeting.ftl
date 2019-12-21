<#include "parts/security.ftl">
<#import "login.ftl" as l>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/">Bookreader</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/">Home</a>
                </li>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" href="/main">Comments</a>
                    </li>
                </#if>
                <li class="nav-item">
                    <a class="nav-link" href="/book">Books</a>
                </li>
                <#if isAdmin>
                    <li class="nav-item">
                        <a class="nav-link" href="/user">User list</a>
                    </li>
                </#if>
                <#if user??>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/profile">Profile</a>
                    </li>
                </#if>
            </ul>
            <div class="navbar-text mr-3">${name}</div>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary" type="submit">Sign Out</button>
            </form>
        </div>
    </nav>

    <h5>Hello, guest, Welcome to your bookreader </h5>

    <a href="/book" type="submit" class="btn btn-outline-primary">Book list</a>
    <p>Have a nice day!</p>

<script type="text/javascript" src="http://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>

<div class="container"><div class="row">

        <div class="col-lg-4">
            <div class="center-block"><canvas id="tagcanvas1" width="400" height="300"></canvas></div>
        </div>

        <form method="post" action="/filter" class="form-inline">

        <div name="filter" id="ptTags" >
            <a href="/book">Action and Adventure</a>
            <a href="/book">Anthology</a>
            <a href="/book">Classic</a>
            <a href="/book">Crime and Detective</a>
            <a href="/book">Drama</a>
            <a href="/book">Fantasy</a>
            <a href="/book">Horror</a>
            <a href="/book">Mystery</a>
            <a href="/book">Romance</a>
            <a href="/book">Science</a>
        </div>

        </form>
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
<div class="card-columns">
        <#list books as book>
        <div class="card bg-light mb-3">
            <ul class="list-group list-group-flush">
                <div class="card-body">
                    <h5 class="list-group-item">Book name: ${book.bookname}</h5>
                    <li class="list-group-item">Description: ${book.description}</li>
                    <li class="list-group-item">Tags: ${book.tag}</li>
                    <li class="list-group-item">Genre: ${book.genre}</li>
                    <a href="/book/${book.id}" class="btn btn-info">View book</a>
                    <a href="/book/${book.id}" class="btn btn-dark">Edit book</a>
            </ul>
        </div>
    <#else>
        No books
    </#list>
    </div>

<#--<#import "parts/common.ftl" as c>

<@c.page>

    <h5>Hello, guest</h5>

    <p>Welcome to your bookreader</p>

    <a href="/book" type="submit" class="btn btn-outline-primary">Book list</a>
    <p>Have a nice day!</p>
    <#include "parts/cloudTags.ftl">
    <#list books as book>
        <div class="card">
            <ul class="list-group list-group-flush">
                <div class="card-body">
                    <h5 class="list-group-item">Book name: ${book.bookname}</h5>
                    <li class="list-group-item">Description: ${book.description}</li>
                    <li class="list-group-item">Tags: ${book.tag}</li>
                    <li class="list-group-item">Genre: ${book.genre}</li>
                    <a href="/book/${book.id}" class="btn btn-info">View book</a>
                    <a href="/book/${book.id}" class="btn btn-dark">Edit book</a>
            </ul>
        </div>
    <#else>
        No books
    </#list>
    </div>
</@c.page>-->




