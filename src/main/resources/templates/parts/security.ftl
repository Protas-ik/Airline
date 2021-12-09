<#assign
    know = Session.SPRING_SECURITY_CONTEXT??
>

<#if know>
    <#assign
        user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
        name = user.getUsername()
        isUser = user.isRoleUser()
        isAdmin = user.isRoleAdmin()
        isDispatcher = user.isRoleDispatcher()
        isGod = user.isRoleGod()
    >
<#else>
    <#assign
        name = "guest"
        isUser = false
        isAdmin = false
        isDispatcher = false
        isGod = false
    >
</#if>