<#import "parts/common.ftl" as c>

<@c.page>
    <h5>Book Viewer</h5>
    <a href="/book" type="submit" class="btn btn-outline-primary">Back to book list</a>
    <form action="/book" method="post">

        <div class="card text-white bg-secondary mb-3">
            <div class="card-body">
                <h5 class="card-title">${book.bookname}</h5>
                <p class="card-text">${book.description}</p>
            <div class="card text-white bg-dark mb-3">
            <ul class="list-group list-group-flush">
                <p class="text-center">Genre: ${book.genre}</p>
                <p class="text-center">Tags: ${book.tag}</p>
                <p class="text-left">${book.text}</p>
            </ul>
            </div>
            </div>
        </div>
</form>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <select name="filter" autofocus class="form-control input-lg mt-2" type="text" id="tag">
                    <option>question</option>
                    <option>answer</option>
                    <option>point of view</option>
                </select>
                <button type="submit" class="btn btn-primary mt-2 ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-warning" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new Comment
    </a>
    <div class="collapse <#if comment??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if comment??>${comment.text}</#if>" name="text" placeholder="Insert comment" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">

                    <label>Tag</label>
                    <select name="tag" autofocus class="form-control input-lg" id="tag">
                        <option>question</option>
                        <option>answer</option>
                        <option>point of view</option>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card mt-3">
        <#list comments as comment>
            <div class="m-2">
                <span>${comment.text}</span>
                <i>${comment.tag}</i>
            </div>
            <div class="card-footer text-muted">
                ${comment.authorName}
            </div>
        <#else>
            No comments
        </#list>
    </div>

</@c.page>