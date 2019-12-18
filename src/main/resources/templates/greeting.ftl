
<#import "parts/common.ftl" as c>

<@c.page>
    <h5>Hello, guest</h5>
    <div>Mordor - a man-made civilization defamed by the winners</div>

    <p>Welcome to your bookreader</p>

    <p>Here you can read Books</p>

    <a href="/book" type="submit" class="btn btn-outline-primary" value="Books">Book list</a>
    <p>Have a nice day!</p>
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
</@c.page>
