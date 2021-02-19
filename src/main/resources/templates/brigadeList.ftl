<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <h1>List of Brigades</h1>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new brigade
    </a>

    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form action="/brigade" method="post">
                <div class="form-group">
                    <input type="text" name="name" placeholder="Name" class="form-control"/>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" class="form-control"/>
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
        <th scope="col">Name</th>
        <th scope="col">Info</th>
        <th scope="col">Edit</th>
        <th scope="col">Remove</th>
    </tr>
    </thead>
    <tbody>
    <#list brigades as brigade>
        <div>
            <tr>
                <th scope="row"><b>${brigade.id}</b></th>
                <td><span>${brigade.name}</span></td>
                <td><a href="/brigade/${brigade.id}">info</a></td>
                <td><a href="/brigade/edit/${brigade.id}">edit</a></td>
                <td><a href="/brigade/delete/${brigade.id}">remove</a></td>
            </tr>
        </div>
    <#else>

    </#list>

</@c.page>