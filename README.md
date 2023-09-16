# OSPF

### Схема стенда
![](https://github.com/Gilfoyle3301/otus/blob/ospf/image/schema.png)

# Реализация
Разворачиваем стенд: \
`vagrant up`

При деплое router3 запустится ansible-playbook, которая сконфигурирует роутеры.

# Ассиметричный роутинг 
После увеличения стоимости интерфейса enp0s8:

![](https://github.com/Gilfoyle3301/otus/blob/ospf/image/pingask.png)

Результат traceroute:
![](https://github.com/Gilfoyle3301/otus/blob/ospf/image/traceroute.png)


# Cиметричный роутинг 
Результат traceroute после увеличения стоимости интерфеса на соседне роутере:
![](https://github.com/Gilfoyle3301/otus/blob/ospf/image/simtr.png)