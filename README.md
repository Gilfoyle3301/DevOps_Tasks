# VLAN
```
System Requirements:
MIN: 
    CPU: 7
    RAM: 4GB
NORMAL:
    CPU: 14
    RAM: 8GB
```

# Основные понятия

VLAN (Virtual Local Area Network, виртуальная локальная компьютерная сеть) -  это виртуальные сети, которые работают на втором уровне модели OSI. Протокол VLAN разделяет хосты на подсети, путём добавления тэга к каждоум кадру (Протокол 802.1Q).

1. Принцип работы VLAN:
2. Группа устройств в сети VLAN взаимодействует так, будто устройства подключены с помощью одного кабеля…
3. Преимущества использования VLAN:
4. Безопасность
5. Снижение издержек
6. Повышение производительности (уменьшение лишнего трафика)
7. Сокращение количества доменов широковещательной рассылки
8. Повышение производительности ИТ-отдела

Пакеты между VLAN могут передаваться только через маршрутизатор или коммутатор 3-го уровня. 

Если через один порт требуется передавать сразу несколько VLAN`ов, то используются Trunk-порты.

Помимо VLAN иногда требуется объединить несколько линков, это делается для увеличения отказоустойчивости. 
Агрегирование каналов (англ. link aggregation) — технологии объединения нескольких параллельных каналов передачи данных в сетях Ethernet в один логический, позволяющие увеличить пропускную способность и повысить надёжность. В различных конкретных реализациях агрегирования используются альтернативные наименования: транкинг портов (англ. port trunking), связывание каналов (link bundling), склейка адаптеров (NIC bonding), сопряжение адаптеров (NIC teaming).

LACP (англ. link aggregation control protocol) — открытый стандартный протокол агрегирования каналов, описанный в документах IEEE 802.3ad и IEEE 802.1aq.
Главное преимущество агрегирования каналов в том, что потенциально повышается полоса пропускания: в идеальных условиях полоса может достичь суммы полос пропускания объединённых каналов. Другое преимущество — «горячее» резервирование линий связи: в случае отказа одного из агрегируемых каналов трафик без прерывания сервиса посылается через оставшиеся, а после восстановления отказавшего канала он автоматически включается в работу


# Реализация

Для развертывания:

1. vagrant up ``` Поднимет стенд```

2. ansible-playbook -i inventory/hosts inventory/playbook.yaml ```развернет настройки```


# Промежуточные езультаты:
Router bound:

![](https://github.com/Gilfoyle3301/otus/blob/vlan/image/bond0.png)

vlan1:

![](https://github.com/Gilfoyle3301/otus/blob/vlan/image/vlan1_ipa.png)

![](https://github.com/Gilfoyle3301/otus/blob/vlan/image/vlan_s_c.png)


vlan2:

![](https://github.com/Gilfoyle3301/otus/blob/vlan/image/vlan2_ipa.png)

![](https://github.com/Gilfoyle3301/otus/blob/vlan/image/vlan2_s_c.png)