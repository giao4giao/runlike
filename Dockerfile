# 使用轻量 Python 镜像
FROM python:3.12-alpine

# 设置工作目录
WORKDIR /app

# 复制本地源码到镜像
# 假设你 fork 的 runlike 仓库和 Dockerfile 在同一级目录
COPY . /app

# 安装依赖并安装本地 runlike
RUN pip install --no-cache-dir .

# 设置入口
ENTRYPOINT ["runlike"]