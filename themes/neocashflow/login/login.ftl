<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">
    <title>${msg("loginTitle", realm.displayName)}</title>
    
    <!-- Fonte moderna -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Estilos customizados (sobrescrevem ou complementam o styles.css padrão) -->
    <style>
        * {
            box-sizing: border-box;
        }
        
        body {
            margin: 0;
            font-family: 'Poppins', system-ui, -apple-system, sans-serif;
            background: linear-gradient(135deg, #7c3aed 0%, #3b82f6 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 16px;
        }
        
        .login-wrapper {
            width: 100%;
            max-width: 480px;
        }
        
        .login-container {
            background: rgba(255, 255, 255, 0.96);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            overflow: hidden;
        }
        
        .login-header {
            background: linear-gradient(135deg, #7c3aed, #3b82f6);
            color: white;
            text-align: center;
            padding: 40px 20px 30px;
        }
        
        .logo {
            max-height: 90px;
            margin-bottom: 16px;
        }
        
        .login-header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 600;
        }
        
        .login-content {
            padding: 32px;
        }
        
        .locale-selector {
            text-align: right;
            margin-bottom: 20px;
        }
        
        .locale-selector select {
            padding: 10px 14px;
            border-radius: 8px;
            border: 1px solid #ddd;
            font-size: 15px;
        }
        
        .alert {
            padding: 14px 18px;
            border-radius: 10px;
            margin-bottom: 24px;
            font-weight: 500;
        }
        
        .alert.error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fecaca;
        }
        
        .alert.success {
            background: #d1fae5;
            color: #065f46;
            border: 1px solid #a7f3d0;
        }
        
        .alert.info {
            background: #dbeafe;
            color: #1e40af;
            border: 1px solid #bfdbfe;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #374151;
        }
        
        .form-group input {
            width: 100%;
            padding: 14px 16px;
            font-size: 16px;
            border: 1px solid #d1d5db;
            border-radius: 10px;
            transition: all 0.2s ease;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #7c3aed;
            box-shadow: 0 0 0 4px rgba(124, 58, 237, 0.15);
        }
        
        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 28px;
            flex-wrap: wrap;
            gap: 12px;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            font-size: 15px;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        .forgot-password {
            color: #7c3aed;
            text-decoration: none;
            font-weight: 500;
        }
        
        .forgot-password:hover {
            text-decoration: underline;
        }
        
        button#kc-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #7c3aed, #3b82f6);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: opacity 0.2s;
        }
        
        button#kc-login:hover {
            opacity: 0.9;
        }
        
        .social-login {
            margin-top: 32px;
            text-align: center;
        }
        
        .social-login p {
            margin-bottom: 16px;
            color: #6b7280;
            font-weight: 500;
        }
        
        .social-providers {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        
        .social-button {
            padding: 14px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 500;
            color: #374151;
            background: #f3f4f6;
            transition: background 0.2s;
        }
        
        .social-button:hover {
            background: #e5e7eb;
        }
        
        .register {
            text-align: center;
            margin-top: 28px;
            color: #6b7280;
        }
        
        .register a {
            color: #7c3aed;
            text-decoration: none;
            font-weight: 600;
        }
        
        .register a:hover {
            text-decoration: underline;
        }
        
        .login-footer {
            text-align: center;
            padding: 20px;
            background: #f9fafb;
            color: #6b7280;
            font-size: 14px;
        }
        
        /* Responsividade extra para mobile */
        @media (max-width: 480px) {
            .login-header {
                padding: 32px 16px 24px;
            }
            
            .login-header h1 {
                font-size: 24px;
            }
            
            .login-content {
                padding: 24px 20px;
            }
            
            .form-options {
                flex-direction: column;
                align-items: flex-start;
            }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <header class="login-header">
                <img src="${url.resourcesPath}/img/levirtus.png" alt="Logo" class="logo" />
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