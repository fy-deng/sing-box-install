```
curl -sLo go.tar.gz https://go.dev/dl/go1.20.3.linux-amd64.tar.gz
#curl -sLo go.tar.gz https://go.dev/dl/go1.20.3.linux-arm64.tar.gz
tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
echo -e "export PATH=$PATH:/usr/local/go/bin" > /etc/profile.d/go.sh
source /etc/profile.d/go.sh
go version
```

```
apt install -y build-essential
```

```
go env
go env -w CGO_ENABLED=1
```

**linux-amd64**

```
GOOS=linux GOARCH=amd64 go install -v -tags with_wireguard,with_quic,with_utls,with_reality_server github.com/sagernet/sing-box/cmd/sing-box@dev-next
```

**linux-arm6464**

```
GOOS=linux GOARCH=arm64 go install -v -tags with_wireguard,with_quic,with_utls,with_reality_server github.com/sagernet/sing-box/cmd/sing-box@dev-next
```

**windows-amd64**

```
GOOS=windows GOARCH=amd64 GOAMD64=v3 go install -v -tags with_quic,with_utls,with_reality_server github.com/sagernet/sing-box/cmd/sing-box@dev-next
```
