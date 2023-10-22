# DNS

# Основные понятия

DNS(Domain Name System, Служба доменных имён) -  это распределенная система, для получения информации о доменах. DNS используется для сопоставления IP-адресов и доменных имён.

Зона — это любая часть дерева системы доменных имён, размещаемая как единое целое на некотором DNS-сервере. 

Домен – определенный узел, включающий в себя все подчинённые узлы.

FQDN (Fully Qualified Domain Name) - полностью указанное доменное имя, т.е. от корневого домена. Ключевой идентификатор FQDN - точка в конце имени. Максимальный размер FQDN — 255 байт, с ограничением в 63 байта на каждое имя домена.

Split DNS (split-horizon или split-brain) — это конфигурация, позволяющая отдавать разные записи зон DNS в зависимости от подсети источника запроса.

# Реализация
Для развертывания стенда со всеми настройками client & client2 нужно выполнить следующие:
1. vagrant up


# Результат:
client:

![](https://github.com/Gilfoyle3301/otus/blob/dns/image/dns_cl1.png)

client2:

![](https://github.com/Gilfoyle3301/otus/blob/dns/image/dns_cl2.png)
