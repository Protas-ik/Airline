<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/flight/flightsave" method="post">

        <div class="form-group mt-3">

            <div class="form-group row">
                <label class="col-sm-2 col-form-label"> Аlight brigade : </label>
                <div>
                    <#if flight.brigadeId??>
                        <select class="custom-select mb-3" type="text" id="inputGroupSelect01" name="brigade_id" placeholder=${flight.id}>
                            <#list brigades as brigade>
                                <#if brigade.getStatus()==true || brigade.id == flight.brigadeId>
                                    <option value=${brigade.id}>${brigade.id}</option>
                                </#if>
                            </#list>
                        </select>
                    <#else>
                        <select class="custom-select mb-3" type="text" id="inputGroupSelect01" name="brigade_id" >
                            <option value="null">not selected</option>
                            <#list brigades as brigade>
                                <#if brigade.getStatus()==true>
                                    <option value=${brigade.id}>${brigade.id}</option>
                                </#if>
                            </#list>
                        </select>
                    </#if>
                </div>
            </div>
        </div>

        <input type="hidden" value="${flight.id}" name="flightId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>