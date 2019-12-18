<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/book" class="form-inline">
                <select name="filterBook" autofocus class="form-control input-lg" id="tagBook">
                    <option>Action and Adventure</option>
                    <option>Anthology</option>
                    <option>Classic</option>
                    <option>Crime and Detective</option>
                    <option>Drama</option>
                    <option>Fantasy</option>
                    <option>Horror</option>
                    <option>Mystery</option>
                    <option>Romance</option>
                    <option>Science</option>
                </select>
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new Book
    </a>
    <div class="collapse show" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="bookname" class="form-control ${(textError??)?string('is-invalid', '')}"
                           placeholder="Enter the title" />
                    <div class="form-group mt-3">
                        <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                               name="description" placeholder="Enter a summary of the book" />
                    </div>
                    <div class="form-group mt-3">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           name="text" placeholder="Enter book" />
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                               name="genre" placeholder="Enter genre" />
                    </div>
                    <div class="form-group mt-3">
                        <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                               name="tag" placeholder="Enter tag" />
                    </div>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <label>Genre</label>
                    <select name="genre" autofocus class="form-control input-lg" id="genre">
                        <option>Action and Adventure</option>
                        <option>Anthology</option>
                        <option>Classic</option>
                        <option>Crime and Detective</option>
                        <option>Drama</option>
                        <option>Fantasy</option>
                        <option>Horror</option>
                        <option>Mystery</option>
                        <option>Romance</option>
                        <option>Science</option>
                    </select>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Add Book</button>
                </div>
            </form>
        </div>
    </div>

        <#list books as book>
            <div class="card">
                <ul class="list-group list-group-flush">
                    <div class="card-body">
                    <h5 class="list-group-item">Book name: ${book.bookname}</h5>
                    <li class="list-group-item">Description: ${book.description}</li>
                    <li class="list-group-item">Tags: ${book.tag}</li>
                    <li class="list-group-item">Genre: ${book.genre}</li>
                    <a href="/book/${book.id}" class="btn btn-info">View book</a>
                    <a href="/book/edit/${book.id}" class="btn btn-dark">Edit book</a>
                </ul>
            </div>
        <#else>
            No books
        </#list>
    </div>
</@c.page>
