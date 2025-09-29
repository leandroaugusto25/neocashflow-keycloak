<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("updatePasswordTitle", realm.displayName)}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <header class="login-header">
                <img src="${url.resourcesPath}/img/logo.jpeg" alt="Logo" class="logo" />
                <h1>${msg("updatePasswordTitle", realm.displayName)}</h1>
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
                        <span class="alert-icon">⚠</span> ${kcSanitize(message.summary)?no_esc}
                    </div>
                </#if>

                <form id="kc-form-update-password" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="password-new">${msg("passwordNew")}</label>
                        <input type="password" id="password-new" name="password-new" placeholder="${msg('passwordNew')}" required />
                    </div>

                    <div class="form-group">
                        <label for="password-confirm">${msg("passwordConfirm")}</label>
                        <input type="password" id="password-confirm" name="password-confirm" placeholder="${msg('passwordConfirm')}" required />
                    </div>

                    <div class="form-options">
                        <div class="checkbox-wrapper">
                            <label class="remember-me">
                                <input type="checkbox" id="logout-other-devices" name="logoutOtherDevices" value="true" />
                                ${msg("logoutOtherDevices")}
                            </label>
                        </div>
                    </div>

                    <button type="submit" id="kc-update-password" class="primary-button">${msg("doSubmit")}</button>
                </form>
            </div>

            <footer class="login-footer">
                <p>© 2025 - ESCOLA DE SABERES PÚBLICOS DO AMAPÁ</p>
            </footer>
        </div>
    </div>
</body>
</html>
