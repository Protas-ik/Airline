<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>

    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post">
                <div class="form-group">
                    <input type="text" name="text" placeholder="Введите сообщение" class="form-control" />
                </div>
                <div class="form-group">
                    <input type="text" name="tag" placeholder="Тэг" class="form-control" />
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" class="form-control" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <table class="table mt-3">
    <thead class="thead-dark">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Text</th>
        <th scope="col">Tag</th>
        <th scope="col">Author name</th>
    </tr>
    </thead>
    <tbody>
    <#list messages as message>
        <div>
            <tr>
                <th scope="row"><b>${message.id}</b></th>
                <td><span>${message.text}</span></td>
                <td><i>${message.tag}</i></td>
                <td><strong>${message.authorName}</strong></td>
            </tr>
        </div>
    <#else>
        No message
    </#list>
</@c.page>