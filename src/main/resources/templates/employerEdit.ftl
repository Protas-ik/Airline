<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/employer/employersave" method="post">

        <div class="form-group mt-3">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Employer surname : </label>
                <div>
                    <input type="text" name="surname" value="${employer.surname}" class="form-control" />
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Employer brigade : </label>
                <div>
                    <#if employer.brigadeId??>
                            <select class="custom-select mb-3" type="text" id="inputGroupSelect01" name="brigade_id" placeholder=${employer.id}>
                                <#list brigades as brigade>
                                    <option value=${brigade.id}>${brigade.id}</option>
                                </#list>
                            </select>
                    <#else>
                        <select class="custom-select mb-3" type="text" id="inputGroupSelect01" name="brigade_id" >
                            <option value="null">not selected</option>
                            <#list brigades as brigade>
                                <option value=${brigade.id}>${brigade.id}</option>
                            </#list>
                        </select>
                    </#if>
                </div>
            </div>
        </div>

        <input type="hidden" value="${employer.id}" name="employerId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>