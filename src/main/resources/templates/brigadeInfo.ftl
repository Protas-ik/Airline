<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <h1>List of brigade employers</h1>

    <table class="table mt-3">
    <thead class="thead-dark">
    <tr>
        <th scope="col">#</th>
        <th scope="col">Name</th>
        <th scope="col">Surname</th>
        <th scope="col">Profession</th>
        <th scope="col">Brigade id</th>
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
                <td><strong>${employer.brigadeId}</strong></td>
            </tr>
        </div>
    <#else>

    </#list>

</@c.page>