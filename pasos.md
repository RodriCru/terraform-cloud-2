# Practica 6 Uso de tipos de variables

## Información de la practica
Esta practica va a cerca de los tipos de variables en terraform.
Se trabaja con VPC, EC2 y etiquetas
Los pasos para ejecutar esta practica son los comandos

```Bash
$ terraform init

$ terraform plan

$ terraform apply
```

## Notas a considerar
 + Se definio us-east-2 ohio, para desplegar, ya que es la zona mas cercana
si se desea cambiar la región edite los archivos dependiendo su región mas cercana

+ El AMI Id se obtiene de EC2->Instances->Launch Instances
dentro existen unas imagenes, selecciona la imagen de aws-linux
ahi dice cual es el id de la AMI, por región estos ID cambian

+ Para generar una key pair ve a la terminal de AWS
EC2->En las opciones busca la que dice `key pairs` y crea una nueva llave, descargala
una vez descargada no se puede volver a descargar.
Una vez que la tengas edita el archivo `data.tf`
edita el `key_name` por el nombre de tu llave


+ Si el output se te perdio y/o lo quieres volver a ver de nuevo ejecuta 

```Bash
$ terraform output
# O ejecuta este comando para obtener el valor de la variable
$ terraform output ec2_public_id
```

+ Si se quisiera ejecutar solo un cambio existe el comando --target.
Con este comando solo aplica la configuración solo para la subnet publica
Si ya hizo el despliegue, edita el nombre de la subnet publica y privada y aplica el comando anterior para que veas la diferencia
Despues ejecuta el plan y veras que el cambio a la subnet privada sigue en el plan y sin ejecutarse

```Bash
$ terraform apply --target aws_subnet.public_subnet
```

+ Si se realiza la practica de importar un recurso ya deployado en la consola de aws
descomente el código de hasta el final de el archivo `ec2.tf` y ejecuta el sig comando en terminal, despues copia la respuesta y pegala en el archivo `ec2.tf` y edita los archivos para que se adapten el despliegue

```Bash
# Paso 1
$ terraform import aws_instance.mywebserver id_de_la_instancia
# el id se obtiene en los detalles de la instancia

#Paso2
$ terraform plan
#Elimina los errores

#Paso3
$ terraform plan
#Todo debe salir correcto

$ terraform apply
#La aplicación será exitosa
```

## No olvides destruir todo despues de practicar
+ Para eliminar todo lo que se creo en esta practica ejecute:

```Bash
$ terraform destroy
```
Escribe `yes` para confirmar que se quiere elminar todo lo deployado