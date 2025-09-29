<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("loginTitle", realm.displayName)}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <header class="login-header">
                <img src="${url.resourcesPath}/img/logo.jpeg" alt="Logo" class="logo" />
                <h1>${msg("loginTitle", realm.displayName)}</h1>
            </header>

            <div class="login-content">
                <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                    <div class="locale-selector">
                        <select id="kc-locale" name="locale" onchange="document.getElementById('kc-locale-form').submit()">
                            <#list locale.supported as l>
                                <option value="${l.locale}"<#if locale.current == l.locale> selected="selected"</#if>>${l.label}</option>
                            </#list>
                        </select>
                        <form id="kc-locale-form" action="${url.loginRestartLoginUrl}" method="post">
                            <input type="hidden" name="locale" value="" />
                        </form>
                    </div>
                </#if>

                <#if message?has_content>
                    <div class="alert ${message.type}">
                        ${kcSanitize(message.summary)?no_esc}
                    </div>
                </#if>

                <form id="kc-form-login" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="username">${msg("usernameOrEmail")}</label>
                        <input type="text" id="username" name="username" value="${(login.username!'')}" autofocus placeholder="${msg('usernameOrEmail')}" required />
                    </div>

                    <div class="form-group">
                        <label for="password">${msg("password")}</label>
                        <input type="password" id="password" name="password" placeholder="${msg('password')}" required />
                    </div>

                    <div class="form-options">
                        <#if realm.rememberMe>
                            <label class="remember-me">
                                <input type="checkbox" id="rememberMe" name="rememberMe" ${(login.rememberMe!'')?has_content?then('checked', '')} />
                                ${msg("rememberMe")}
                            </label>
                        </#if>
                        <#if realm.resetPasswordAllowed>
                            <a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                        </#if>
                    </div>

                    <button type="submit" id="kc-login">${msg("doLogIn")}</button>
                </form>

                <#if realm.password && social.providers?has_content>
                    <div class="social-login">
                        <p>${msg("socialLoginTitle")}</p>
                        <div class="social-providers">
                            <#list social.providers as p>
                                <a href="${p.loginUrl}" class="social-button ${p.alias}">${p.displayName}</a>
                            </#list>
                        </div>
                    </div>
                </#if>

                <#if realm.password && realm.registrationAllowed>
                    <div class="register">
                        <p>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></p>
                    </div>
                </#if>
            </div>

            <footer class="login-footer">
                <p>© 2025 - ESCOLA DE SABERES PÚBLICOS DO AMAPÁ</p>
            </footer>
        </div>
    </div>
</body>
</html>
