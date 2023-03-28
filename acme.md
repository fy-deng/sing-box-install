- 安装acme

```
apt install -y socat
curl https://get.acme.sh | sh
```

- 设置acme的别名

```
alias acme.sh=~/.acme.sh/acme.sh
```

- 设置acme自动更新

```
acme.sh --upgrade --auto-upgrade
```

- 将默认 CA 更改为 Let's Encrypt

```
acme.sh --set-default-ca --server letsencrypt
```

- 使用 Standalone 模式给 chika.example.com 申请 EEC 证书

```
acme.sh --issue -d chika.example.com --standalone --keylength ec-256
```

- 将 chika.example.com 的证书安装到 /etc/ssl/private

```
acme.sh --install-cert -d chika.example.com --ecc \
```

```
--fullchain-file /etc/ssl/private/fullchain.cer \
```

```
--key-file /etc/ssl/private/private.key
```

-

```
chown -R nobody:nogroup /etc/ssl/private
```
