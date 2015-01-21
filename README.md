# users

Para ocupar la clase, tenemos que hacer lo siguiente:

1. En el archivo `common.yaml` de hiera colocar

```
classes:
        - users
```

2. En nuestro directorio de `hiera` creamos el archivo `users.yaml` con el siguiente contenido
```
  mcoa:
     uid:  9001
     user: 'mcoa'
     realname: 'Miguel Coa'
     shell:  '/bin/bash'
     groups: [admin, linux]
     sshkeytype: 'ssh-rsa'
     sshkey: 'AAAAB3NzaC1yc2EAAAADAQAB.....................U1bABuB7i7tSkYKSc6Us3DtP4tIeTBc3zYAElKDN+c5lX'
```
3. Los grupos a los que pertenecerá el usuario los agregamos en el archivo `add_group.pp`
```
class users::add_group {
	group {"linux":
                ensure => present,
        }
	 group {"admin":
                ensure => present,
        }
}
```


