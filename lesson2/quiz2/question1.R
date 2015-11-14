library(httr)

#get from github API the repos info from jtleek
#get the created_at for datasharing repo

oauth_endpoints("github")

authApp <- oauth_app("github",  key = "b019a13d74ad3ed33744", secret = "8e14e927d6f50548e1092e8c8f20b2cc2eb5fb89")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), authApp)

# 4. Use API
gtoken <- config(token = github_token)
jtleek_repos <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(jtleek_repos)
content(jtleek_repos)
