<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/brigade/brigadesave" method="post">

        <div class="form-group mt-3">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Brigade name : </label>
                <div>
                    <input type="text" name="name" value="${brigade.name}" class="form-control" />
                </div>
            </div>

        </div>

        <input type="hidden" value="${brigade.id}" name="brigadeId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>