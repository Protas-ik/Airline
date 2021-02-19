<#import "parts/common.ftl" as c>

<@c.page>

    <h1>List of Flights</h1>

    <table class="table mt-3">
    <thead class="thead-dark">
    <tr>
        <th scope="col">#</th>
        <th scope="col">From</th>
        <th scope="col">To</th>
        <th scope="col">Date</th>
        <th scope="col">Time</th>
        <th scope="col">Brigade id</th>
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
                <td><strong>${flight.brigadeId}</strong></td>
            </tr>
        </div>
    <#else>

    </#list>

</@c.page>