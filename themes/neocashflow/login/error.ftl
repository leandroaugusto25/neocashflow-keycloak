<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("errorTitle", realm.displayName)}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <header class="login-header">
                <img src="${url.resourcesPath}/img/levirtus.png" alt="Logo" class="logo" />
                <h1>${msg("errorTitle", realm.displayName)}</h1>
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

                <div class="alert error">
                    <span class="alert-icon">⚠</span> ${kcSanitize(message.summary)?no_esc}
                </div>

                <div class="form-options">
                    <p><a href="${url.loginUrl}" class="primary-button">Voltar ao Login</a></p>
                </div>
            </div>

            <footer class="login-footer">
                <p>© 2025 - ESCOLA DE SABERES PÚBLICOS DO AMAPÁ</p>
            </footer>
        </div>
    </div>
</body>
</html>
