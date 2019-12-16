<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <select name="filterBook" autofocus class="form-control input-lg" type="text" id="tagBook">
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
    <div class="collapse <#if comment??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if comment??>${comment.text}</#if>" name="text" placeholder="Введите комментарий" />
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">

                    <label>Tag</label>
                    <select name="tagBook" autofocus class="form-control input-lg" id="tagBook">
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
                    <button type="submit" class="btn btn-primary">Добавить</button>
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
