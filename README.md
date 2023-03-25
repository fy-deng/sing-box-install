## [XTLS Vision](https://github.com/XTLS/Xray-core/discussions/1295) 使用 [sing-box](https://github.com/SagerNet/sing-box) 安装指南

1. 下载程序（**linux-amd64**）

```
curl -Lo /root/sb https://github.com/SagerNet/sing-box/releases/download/v1.2.0/sing-box-1.2.0-linux-amd64.tar.gz && tar -xzf /root/sb && cp -f /root/sing-box-*/sing-box /root && rm -r /root/sb /root/sing-box-* && chown root:root /root/sing-box && chmod +x /root/sing-box
```

2. 下载配置

```
curl -Lo /root/sing-box_config.json https://raw.githubusercontent.com/chika0801/sing-box-examples/main/VLESS-XTLS-Vision/config_server.json
```

3. 下载systemctl配置

```
curl -Lo /etc/systemd/system/sing-box.service https://raw.githubusercontent.com/chika0801/sing-box-install/main/sing-box.service && systemctl daemon-reload
```

4. 上传证书和私钥

- 将证书文件改名为 **fullchain.cer**，将私钥文件改名为 **private.key**，将它们上传到 **/root** 目录。

5. 启动程序

```
systemctl enable --now sing-box && sleep 0.2 && systemctl status sing-box
```

| 项目 | |
| :--- | :--- |
| 程序 | **/root/sing-box** |
| 配置 | **/root/sing-box_config.json** |
| 检查 | `/root/sing-box check -c sing-box_config.json` |
| 查看日志 | `journalctl -u sing-box --output cat -e` |
| 实时日志 | `journalctl -u sing-box --output cat -f` |

## Shadowrocket 配置示例

<details><summary>点击查看</summary><br>

| 选项 | 值 |
| :--- | :--- |
| 类型 | Hysteria |
| 地址 | VPS的IP |
| 端口 | 16384 |
| 密码 | chika |
| 混淆 | 留空 |
| 协议 | UDP |
| 允许不安全 | 不选 |
| UDP 转发 | 选上 |
| 快速打开 | 选上 |
| SNI | 证书中包含的域名 |
| ALPN | h3 |
| 上行速度 | 20 |
| 下行速度 | 100 |

</details>

## ShadowSocksR Plus+ 配置示例

<details><summary>点击查看</summary><br>

| 选项 | 值 | 对应参数 |
| :--- | :--- | :--- |
| 服务器节点类型 | Hysteria |
| 服务器地址 | VPS的IP | "server" |
| 端口 | 16384 | "server" |
| 协议 | udp | "protocol" |
| 验证类型 | string |  |
| 验证载荷 | chika | "auth_str" |
| QUIC 连接接收窗口 | 16777216 | "recv_window" |
| QUIC 流接收窗口 | 6710886 | "recv_window_conn" |
| 禁用 MTU 探测 | 不勾 | "disable_mtu_discovery" |
| 延迟启动 | 不勾 | "lazy_start" |
| 上行链路容量 | 50 | "up_mbps" |
| 下行链路容量 | 150 | "down_mbps" |
| 混淆密码（可选） | 留空 | "obfs" |
| TLS 主机名 | 证书中包含的域名 | "server_name" |
| QUIC TLS ALPN | h3 | "alpn" |
| 允许不安全连接 | 不勾 | "insecure" |
| 自签证书 | 不勾 |  |
| TCP 快速打开 | 勾上 | "fast_open" |
| 启用自动切换 | 不勾 |  |
| 本地端口 | 1234 |  |

</details>

## PassWall 配置示例

<details><summary>点击查看</summary><br>

| 选项 | 值 | 对应参数 |
| :--- | :--- | :--- |
| 类型 | Hysteria |  |
| 地址（支持域名） | VPS的IP | "server" |
| 端口 | 16384 | "server" |
| 端口跳跃额外端口 | 留空 | "server" |
| 协议 | UDP | "protocol" |
| 混淆密码 | 留空 | "obfs" |
| 认证类型 | STRING |  |
| 认证密码 | chika | "auth_str" |
| QUIC TLS ALPN | h3 | "alpn" |
| 快速打开 | 勾上 | "fast_open" |
| 域名 | 证书中包含的域名 | "server_name" |
| 允许不安全连接 | 不勾 | "insecure" |
| 最大上行(Mbps) | 50 | "up_mbps" |
| 最大下行(Mbps) | 150 | "down_mbps" |
| QUIC 流接收窗口 | 6710886 | "recv_window_conn" |
| QUIC 连接接收窗口 | 16777216 | "recv_window" |
| 握手超时 | 留空 | "handshake_timeout" |
| 空闲超时 | 留空 | "idle_timeout" |
| 端口跳跃时间 | 留空 | "hop_interval" |
| 禁用 MTU 检测 | 不勾 | "disable_mtu_discovery" |

</details>
