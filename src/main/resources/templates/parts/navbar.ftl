<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="/">Airline</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/flight/readyflight">Flights</a>
            </li>
            <#if isDispatcher||isAdmin>
            <li class="nav-item">
                <a class="nav-link" href="/flight">Flight Control</a>
            </li>
            </#if>
            <#if isGod>
            <li class="nav-item">
                <a class="nav-link" href="/user">User List</a>
            </li>
            </#if>
            <#if isDispatcher || isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/employer">Employers</a>
                </li>
            </#if>
            <#if isDispatcher>
                <li class="nav-item">
                    <a class="nav-link" href="/brigade">Brigade List</a>
                </li>
            </#if>
            <#if isUser>
                <li class="nav-item">
                    <a class="nav-link" href="/user/profile">Profile</a>
                </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3">${name}</div>
        <#if isDispatcher || isAdmin || isUser || isGod>
            <@l.logout />

        <#else>
            <form action="/login" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary">Sign In</button>
            </form>
        </#if>

    </div>
</nav>