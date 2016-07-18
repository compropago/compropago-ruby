# ComproPago Ruby Gem v2.0.0

## Descripción

La librería de `ComproPago Ruby Gem` le permite interactuar con el API de ComproPago en su aplicación.
También cuenta con los métodos necesarios para facilitarle su desarrollo por medio de los servicios 
más utilizados (SDK).

Con ComproPago puede recibir pagos en OXXO, 7Eleven y muchas tiendas más en todo México.

[Registrarse en ComproPago](https://compropago.com)

## Índice de Contenidos

- [Ayuda y Soporte de ComproPago](#ayuda-y-soporte-de-compropago)
- [Requerimientos](#requerimientos)
- [Instalación ComproPago SDK](#instalación-compropago-sdk)
- [Documentación](#documentación)
- [Guía básica de Uso](#guía-básica-de-uso)
- [Guía de Versiones](#guía-de-versiones)


## Ayuda y Soporte de ComproPago

- [Centro de ayuda y soporte](https://compropago.com/ayuda-y-soporte)
- [Solicitar Integración](https://compropago.com/integracion)
- [Guía para Empezar a usar ComproPago](https://compropago.com/ayuda-y-soporte/como-comenzar-a-usar-compropago)
- [Información de Contacto](https://compropago.com/contacto)

## Requerimientos

* Ruby Gems


## Instalación ComproPago Ruby Gem

### Instalación por GitHub

Puede descargar alguna de las versiones que hemos publicado:

- [Consultar Versiones Publicadas en GitHub](https://github.com/compropago/compropago-ruby/releases)

O si o lo desea puede obtener el repositorio

```bash
#repositorio en su estado actual (*puede no ser versón estable*)
git clone https://github.com/compropago/sdk-cs-net.git
```

Finalizada la descarga del codigo de la gema descomprimir el archivo descargado e ingresar en la carpeta
resultante. En una terminal correr los siguientes comandos:

```bash
# Desinstalara cualquier vercion anterior del la gema
sudo gem uninstall compropago*

# Generacion del nuevo compilado de la gema
gem build compropago.gemspec

# Instalacion del nuevo compilado
sudo gem install compropago*.gem
```

## Documentación

### Documentación ComproPago Ruby Gem

### Documentación de ComproPago

**[API de ComproPago](https://compropago.com/documentacion/api)**

ComproPago te ofrece un API tipo REST para integrar pagos en efectivo en tu comercio electrónico o tus aplicaciones.

**[General](https://compropago.com/documentacion)**

Información de Comisiones y Horarios, como Transferir tu dinero y la Seguridad que proporciona ComproPAgo


**[Herramientas](https://compropago.com/documentacion/boton-pago)**

* Botón de pago
* Modo de pruebas/activo
* WebHooks
* Librerías y Plugins
* Shopify

## Guía básica de Uso

Se debe contar con una cuenta activa de ComproPago. [Registrarse en ComproPago](https://compropago.com)

### General

Para poder hacer uso de la librería es necesario incluir la libreria principales de la gema

```ruby
require 'compropago'
```

### Configuración del Cliente

Para poder hacer uso de la gema y llamados al API es necesario que primero configure sus Llaves de conexión y crear 
un instancia de Client.
*Sus llaves las encontrara en su Panel de ComproPago en el menú Configuración.*

[Consulte Aquí sus Llaves](https://compropago.com/panel/configuracion)

```ruby
# @param string publickey     Llave publica correspondiente al modo de la tienda
# @param string privatekey    Llave privada correspondiente al modo de la tienda
# @param bool   live          Modo de la tienda (false = Test | true = Live)
# @param string contained     (optional) App User agent

client = Client.new(
    'pk_test_5989d8209974e2d62',  # publickey
    'sk_test_6ff4e982253c44c42',  # privatekey
    false,                        # live
    nil                           # contaiden
)
```

### Uso Básico de la gema

> Consulte la documentación de la librería Ruby de ComproPago para conocer más de sus capacidades, configuraciones y métodos.


#### Llamados al los servicios por SDK

Para poder hacer uso de los servicos de ComproPago, solo debe de llamar a los metodos contenidos en la propiedad **api**
de la variable **client** como se muestra a continuación.


#### Métodos base del SDK

##### Crear una nueva orden de Pago


```ruby
# @param [String] order_id          Id de la orden
# @param [String] order_name        Nombre del producto o productos de la orden
# @param [Float]  order_price       Monto total de la orden
# @param [String] customer_name     Nombre completo del cliente
# @param [String] customer_email    Correo electronico del cliente
# @param [String] payment_type      (default = OXXO) Valor del atributo internal_name' de un objeto 'Provider' 
# @param [String] image_url         (optional) Url a la imagen del producto

order = PlaceOrderInfo.new(
    '123',                                # order_id
    'M4 Style Ruby',                      # order_name
    1000,                                 # order_price
    'Eduardo Aguilar',                    # customer_name
    'eduardo.aguilar@compropago.com',     # customer_email
    'OXXO',                               # payment_type
    nil                                   # image_url
)


# Llamada al metodo 'place_order' del API para generar la orden

# @param [PlaceOrderInfo] order
# @return [NewOrderInfo]
new_order = client.api.place_order order
```

###### Prototipo del metodo place_order()

```ruby
# @param [PlaceOrderInfo] info
# @return [NewOrderInfo]
def place_order(info)
end
```

##### Verificar el Estatus de una orden

Para verificar el estatus de una orden generada es necesario llamar al metodo **verify_order** que provee el atributo **api**
del objeto **Client** y el cual regresa una instancia **CpOrderInfo**. este metodo recibe como parametro el ID generado por ComproPago para cada orden. Tambien puede obtener
este ID desde un objeto **NewOrderInfo** accediendo al metodo **get_id**.

```ruby

# Guardar el ID de la orden
order_id = "ch_xxxx_xxx_xxx_xxxx";

# U obtenerlo de un objetdo NewOrderInfo
order_id = new_order.get_id


# Se manda llamar al metodo del API para recuperar la informacion de la orden
info = client.api.verify_order order_id
```

###### Prototipo del metodo verify_order()

```ruby
# @param [String] id
# @return [CpOrderInfo]
def verify_order(id)
end
```


##### Obtener el listado de las tiendas donde se puede realizar el Pago

Para obtener el listado de Proveedores disponibles para realizar el pago de las ordenes es necesario consutar el metodo
**list_providers** que se encuentra alojado en el atributo **api** del objeto **Client** y el cual regresa una instancia
de tipo **Array** la cual contendra objetos de tipo **Provider**

```ruby
providers = client.api.list_providers
```

###### Prototipo del metodo get_providers()

```ruby
# @param [Bolean] auth
# @param [Float] limit
# @param [Bolean] fetch
# @return [Array]
def list_providers(auth = false, limit = 0.0, fetch = false)
end
```

##### Envio de instrucciones SMS

Para realizar el el envio de las instrucciones de compra via SMS es necesario llamar al metodo **send_sms_instructions** que se
que se encuentra alojado en el atributo **api** del objeto **Client** y el cual regresa una instancia de tipo **SmsInfo**

```CSharp
# Numero al cual se enviaran las instrucciones
phone_number = "55xxxxxxxx";

# Id de la orden de compra de cual se enviaran las instrucciones
order_id = "ch_xxxxx-xxxxx-xxxxx-xxxxx";

# Llamada al metodo del API para envio de las instrucciones
smsinfo = client.api.send_sms_instructions phone_number , order_id
```

###### Prototipo del metodo send_sms_instructions()

```ruby
# @param [String] number
# @param [String] id
# @return [SmsInfo]
def send_sms_instructions(number, id)
end
```

#### Webhooks

Los webhooks son de suma importancia para el proceso las ordenes de ComproPago, ya que estos se encargaran de recibir las notificaciones de el cambio en
los estatus de las ordenes de compra generadas, tambien deberan contener parte de la logica de aprobacion en su tienda en linea. El proceso que siguen
es el siguiente.

1. Cuando una orden cambia su estatus, nuestra plataforma le notificara a cada una de las rutas registradas, dicho cambio con la informacion de la orden
   modificada en formato JSON
2. Debera de recuperar este JSON en una cadena de texto para posterior mente convertirla a un objeto de todpo **CpOrderInfo** haciendo uso de la clase Factory
   que proporciona el SDK de la siguiente forma:

```ruby
info = Factory.cp_order_info JSON.parse(cadena_obtenida)
```

3. Generar la logica de aprovacion correspondiente al estatus de la orden.

##### Crear un nuevo Webhook

Para crear un nuevo Webhook en la cuenta, se debe de llamar al metodo **create_webhook** que se encuentra alojado en el atributo **api** del objeto **Client**
y el cual regresa una instancia de tipo **Webhook**

```ruby
# Se pasa como paramtro la URL al webhook
webhook = client.api.create_webhook 'http://sitio.com/webhook'
```

###### Prototipo del metodo create_webhook()

```ruby
# @param [String] url
# @return [Webhook]
def create_webhook(url)
```

##### Actualizar un Webhook

Para actualizar la url de un webhoo, se debe de llamar al metodo **update_webhook** que se encuentra alojado en el atributo **api** del objeto **Client**
y el cual regresa una instancia de tipo **Webhook**

```ruby
updated_webhook = client.api.update_webhook(webhook.get_id, 'http://sitio.com/nuevo_webhook');
```

###### Prototipo del metodo update_webhook()

```ruby
# @param [String] url
# @param [String] id
# @return [Webhook]
def update_webhook(id, url)
end
```

##### Eliminar un Webhook

Para eliminar un webhook, se debe de llamar al metodo **delete_webhook** que se encuentra alojado en el atributo **api** del objeto **Client**
y el cual regresa una instancia de tipo **Webhook**

```ruby
deleted_webhook = client.api.delete_webhook webhook.get_id
```

###### Prototipo del metodo delete_webhook()

```ruby
# @param [String] id
# @return [Webhook]
def delete_webhook(id)
end
```

##### Obtener listado de Webhooks registrados

Para obtener la lista de webhooks registrados den una cuenta, se debe de llamar al metodo **list_webhook** que se encuentra alojado en el atributo **api**
del objeto **Client** y el cual regresa una instancia de tipo **Array** la cual contiene objetos de tipo **Webhook**

```CSharp
var updateWebhook = client.api.getWebhooks();
```

###### Prototipo del metodo list_webhook()

```CSharp
# @return [Array]
def list_webhooks
end
```


### Gui de versiones
| Version | Status     | Branch                 |
|---------|------------|------------------------|
| 0.1.2   | Deprecated | [0.1.2][branch-1-0-0]  |
| 2.0.0   | Latest     | [2.0.0][branch-latest] |

[branch-1-0-0]: https://github.com/compropago/compropago-ruby/tree/v0.1.2
[branch-latest]: https://github.com/compropago/compropago-ruby/