<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <h1>List of Employers</h1>
    <#if isAdmin>
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            Add new employer
        </a>

        <div class="collapse" id="collapseExample">
            <div class="form-group mt-3">
                <form action="/employer" method="post">
                    <div class="form-group">
                        <input type="text" name="name" placeholder="Name" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="surname" placeholder="Surname" class="form-control"/>
                    </div>
                    <select class="custom-select mb-3" type="text" id="inputGroupSelect01" name="profession"
                            placeholder="Profession">
                        <option value="PILOT">PILOT</option>
                        <option value="NAVIGATOR">NAVIGATOR</option>
                        <option value="RADIOOP">RADIOOP</option>
                        <option value="STEWARDESS">STEWARDESS</option>
                    </select>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" class="form-control"/>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Добавить</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>

    <table class="table mt-3">
    <thead class="thead-dark">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Surname</th>
        <th scope="col">Profession</th>
        <th scope="col">Brigade id</th>
        <#if isDispatcher>
            <th scope="col">Edit</th>
        </#if>
        <#if isAdmin>
            <th scope="col">Remove</th>
        </#if>
    </tr>
    </thead>
    <tbody>
    <#list employers as employer>
        <div>
            <tr>
                <th scope="row"><b>${employer.id}</b></th>
                <td><span>${employer.name}</span></td>
                <td><i>${employer.surname}</i></td>
                <td><strong>${employer.profession}</strong></td>
                <#if employer.brigadeId??>
                    <td><strong>${employer.brigadeId}</strong></td>
                <#else>
                    <td><strong>not selected</strong></td>
                </#if>
                <#if isDispatcher>
                    <td><a href="/employer/${employer.id}">edit</a></td>
                </#if>
                <#if isAdmin>
                    <td><a href="/employer/delete/${employer.id}">remove</a></td>
                </#if>
            </tr>
        </div>
    <#else>

    </#list>

</@c.page>