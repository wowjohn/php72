# php72

### docker build -t php72 ./


docker login --username=1055441929@qq.com registry.cn-hangzhou.aliyuncs.com

sudo docker login --username=1055441929@qq.com registry.cn-hangzhou.aliyuncs.com
sudo docker tag [ImageId] registry.cn-hangzhou.aliyuncs.com/jimu/php:[镜像版本号]
sudo docker push registry.cn-hangzhou.aliyuncs.com/jimu/php:[镜像版本号]

registry.cn-hangzhou.aliyuncs.com/jimu/php:1.0