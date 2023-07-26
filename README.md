**README - Proyecto en Swift**

# WatchNotificationLocal

## Descripción

El proyecto WatchNotificationLocal es una aplicación móvil desarrollada en Swift que tiene como objetivo mostrar a manera de ejemplo, varias formas de cargar notificaciones a un Apple Watch de manera local.

## Características Principales

- Solicita permiso de recibir notificaciones.
- Carga de notificaciones desde PushNotificationPayLoad.
- Agrega notificaciones atraves de UNUserNotificationCenter.

## Capturas de Pantalla
<p align="row">
<img src= "https://github.com/kevinmarinsaavedra/WatchNotificationLocal/blob/main/Resources/WatchHomeNotificationSingle.gif" width="200" >
<img src= "https://github.com/kevinmarinsaavedra/WatchNotificationLocal/blob/main/Resources/WatchHomeNotification.gif" width="200" >
<img src= "https://github.com/kevinmarinsaavedra/WatchNotificationLocal/blob/main/Resources/WatchLockedNotification.gif" width="200" >
</p>

## Enviar notificaciones arrastrando los archivos APNS 

Para probar los push, simplemente arrastre un archivo APNS al simulador de destino. Este método requiere que el archivo payload contenga el key "Simulator Target Bundle".

https://github.com/kevinmarinsaavedra/WatchNotificationLocal/assets/68552758/1e5b0e45-f430-4c5c-88e7-23c585133757

## Enviar notificaciones desde consola 

(PASO 1) - el comando "xcrun simctl list" funciona para ver una lista de los dispositivos y copie el UUID del que desea enviar
```
xcrun simctl list
```
(PASO 2) - El siguiente comando "xcrun simctl push" en la terminal enviará notificaciones y, dado que el identificador del paquete está incluido en el comando, no es necesario que el "Paquete de destino del simulador" esté en el archivo APNS.
```
xcrun simctl push <device> <bundle-identifier> <path-to-apns-file>
```


## Referencias

- [Apple-Watch-App-Development-Series](https://github.com/LLLLLayer/Apple-Watch-App-Development-Series)
- [Notificaciones automáticas](https://juejin.cn/post/7155009976241487885)

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](https://github.com/kevinmarinsaavedra/WatchNotificationLocal/blob/main/LICENSE) para obtener más información.
