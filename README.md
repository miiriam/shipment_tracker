# README

### Rastreador de envíos
Servicio para el rastreo de envíos
_________________
Necesitaras tener instalado Ruby 2.6.5

#### Para poder iniciar necesitarás:
Clona el repositorio

Instala redis
```
 $ brew install redis
```
Instala las gemas 
```
$ bundle install
```
Crea y migra la base de datos 
```
$ rake db:create
$ rake db:migrate
```
Para utilizar el servicio de Fedex necesitaras las credenciales, crea un archivo dentro de la carpeta *config/application.yml*
```
#fedex
FEDEX_KEY: 'O21wEWKhdDn2SYyb'
FEDEX_PASSWORD: 'db0SYxXWWh0bgRSN7Ikg9Vunz'
FEDEX_ACCOUNT_NUMBER: '510087780'
FEDEX_METER: '119009727'
FEDEX_MODE: 'test'
```
_________________

Abre tu terminal y en diferentes ventanas corre los siguientes comandos
*Para Redis*
```
$ redis-server
```
*Para Sidekiq*
```
$ bundle exec sidekiq
```
*Inicia el servidor de rails*
```
$ rails s
```
_________________
#### Endpoints

##### Tracking Status
Manda los números de rastreo al servicio de paquetería.
```
POST "/api/v1/tracking_statuses/send_tracking_numbers"
```

Request de ejemplo:

```
[
    {
        "tracking_number": "<NUMERO DE RASTREO>",
        "carrier": "<SERVICIO DE PAQUETERIA>"
    },
    {
        "tracking_number": "<NUMERO DE RASTREO>",
        "carrier": "<SERVICIO DE PAQUETERIA>"
    }
]
```

Response de ejemplo:
```
[
    {
        "carrier": "FEDEX",
        "tracking_number": "449044304137821",
        "job_status": "queued"
    },
    {
        "carrier": "FEDEX",
        "tracking_number": "920241085725456",
        "job_status": "queued"
    }
]
```
Para obtener el estado de los paquetes
```
# GET "/api/v1/tracking_statuses/get_tracking_status"
```
Response de ejemplo: 
```
[
    {
        "carrier": "FEDEX",
        "tracking_number": "039813852990618",
        "status": "ON_TRANSIT"
    },
    {
        "carrier": "FEDEX",
        "tracking_number": "568838414941",
        "status": "CREATED"
    }
]
```
