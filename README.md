# OAuth2-Get-Token

OAuth2で、アクセストークンを得るためだけのアプリケーション。

## 目的

OAuth2のアクセストークンがあれば、認証を成立させてAPIを利用できる。

### アクセストークン

OAuth 2.0 のアクセストークンには有効期限がある。
有効期限を経過すると無効になる。

無効になった場合には、リフレッシュトークンを使用して新しいアクセストークンを取得することができる。

### リフレッシュトークン

リフレッシュトークンを使用して新しいアクセストークンを取得することができる。
一度発行されたリフレッシュトークンは、基本的に無期限で使える。

リフレッシュトークンが無効になることもあるが、一定期間内に利用することで無効になることを防ぐことができる。
