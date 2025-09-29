<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("resetPasswordTitle", realm.displayName)}</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css" />
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <header class="login-header">
                <img src="${url.resourcesPath}/img/logo.jpeg" alt="Logo" class="logo" />
                <h1>${msg("resetPasswordTitle", realm.displayName)}</h1>
            </header>

            <div class="login-content">
                <#if message?has_content>
                    <div class="alert ${message.type}">
                        ${kcSanitize(message.summary)?no_esc}
                    </div>
                </#if>

                <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
                    <div class="form-group">
                        <label for="username">${msg("usernameOrEmail")}</label>
                        <input type="text" id="username" name="username" value="${(username!'')}" autofocus placeholder="${msg('usernameOrEmail')}" required />
                        <p class="instructions">${msg("resetPasswordInstructions")}</p>
                    </div>

                    <button type="submit" id="kc-submit">${msg("doSubmit")}</button>
                </form>

                <div class="back-to-login">
                    <p><a href="${url.loginUrl}">Voltar ao Login</a></p>
                </div>
            </div>

            <footer class="login-footer">
                <p>© 2025 - ESCOLA DE SABERES PÚBLICOS DO AMAPÁ</p>
            </footer>
        </div>
    </div>
</body>
</html>
