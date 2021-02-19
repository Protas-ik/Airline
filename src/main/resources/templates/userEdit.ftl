<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/user" method="post">

        <div class="form-group mt-3">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> User Name : </label>
                <div>
                    <input type="text" name="username" value="${user.username}" class="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group mt-3">
            <#list roles as role>
                <div>
                    <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked","")}> - ${role} </label>
                </div>
            </#list>
        </div>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>