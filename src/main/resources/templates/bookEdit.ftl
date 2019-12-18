<#import "parts/common.ftl" as c>

<@c.page>
    <h5>Book Editor</h5>
    <a href="/book" type="submit" class="btn btn-outline-primary">Back to book list</a>
    <form action="/book/edit/{book}" method="post">
        <div class="card">
            <div class="card-header">
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">Name</span>
                    </div>
                    <input type="text" name="bookname" value="${book.bookname}">
                </div>
            </div>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Description</span>
                        </div>
                        <input type="text" name="description" value="${book.description}">
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Book</span>
                        </div>
                        <textarea name="book" class="form-control" aria-label="With textarea">
                        ${book.text}
                    </textarea>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1">Tags</span>
                    </div>

                    <div class="form-check form-check">
                        <input class="form-check-input" type="checkbox" id="Checkbox1" value="option1">
                        <label class="form-check-label" for="Checkbox1">Antology</label>
                    </div>
                    <div class="form-check form-check">
                        <input class="form-check-input" type="checkbox" id="Checkbox2" value="option2">
                        <label class="form-check-label" for="Checkbox2">Classic</label>
                    </div>
                    <div class="form-check form-check">
                        <input class="form-check-input" type="checkbox" id="Checkbox2" value="option2">
                        <label class="form-check-label" for="Checkbox2">Drama</label>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">Genre</span>
                        </div>
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
                </li>
                <input type="hidden" value="${_csrf.token}" name="_csrf">
                <button type="submit">Save</button>
            </ul>
        </div>
    </form>
</@c.page>


