<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>

    <h1>List of Flights</h1>
    <#if isAdmin>
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">
            Add new Flight
        </a>

        <div class="collapse" id="collapseExample">
            <div class="form-group mt-3">
                <form action="/flight" method="post">
                    <div class="form-group">
                        <input type="text" name="fromPort" placeholder="FromPort" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="toPort" placeholder="ToPort" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type="date" name="date" placeholder="DateFlight" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type="time" name="time" placeholder="TimeFlight" class="form-control"/>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" class="form-control"/>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
                </form>
            </div>
        </div>
    </#if>

    <table class="table mt-3">
    <thead class="thead-dark">
    <tr>
        <th scope="col">#</th>
        <th scope="col">From</th>
        <th scope="col">To</th>
        <th scope="col">Date</th>
        <th scope="col">Time</th>
        <th scope="col">Brigade id</th>
        <th scope="col">Status</th>
        <#if isAdmin>
            <th scope="col">Edit</th>
            <th scope="col">Remove</th>
        </#if>

    </tr>
    </thead>
    <tbody>
    <#list flights as flight>
        <div>
            <tr>
                <th scope="row"><b>${flight.id}</b></th>
                <td><strong>${flight.fromPort}</strong></td>
                <td><strong>${flight.toPort}</strong></td>
                <td><strong>${flight.dateFlight}</strong></td>
                <td><strong>${flight.timeFlight}</strong></td>
                <#if flight.brigadeId??>
                    <td><strong>${flight.brigadeId}</strong></td>
                <#else>
                    <td><strong>not selected</strong></td>
                </#if>
                <td><strong>${flight.flightStatus}</strong></td>
                <#if isAdmin>
                    <td><a href="/flight/${flight.id}">edit</a></td>
                    <td><a href="/flight/delete/${flight.id}">remove</a></td>
                </#if>
            </tr>
        </div>
    <#else>

    </#list>

</@c.page>