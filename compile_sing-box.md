CGO环境
```
apt install -y build-essential
go env -w CGO_ENABLED=1
```

GO环境
```
curl -sLo go.tar.gz https://go.dev/dl/go1.20.1.linux-amd64.tar.gz
tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
echo -e 'export PATH=$PATH:/usr/local/go/bin' > /etc/profile.d/go.sh
source /etc/profile.d/go.sh
go version
```

**linux-amd64**

```
go install -v -tags with_quic,with_wireguard,with_grpc,with_utls,with_reality_server github.com/sagernet/sing-box/cmd/sing-box@dev-next
```

**windows-amd64**

```
GOOS=windows GOARCH=amd64 go install -v -tags with_gvisor,with_grpc,with_utls,with_reality_server github.com/sagernet/sing-box/cmd/sing-box@dev-next
```
