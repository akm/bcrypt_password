# bcrypt_password

You can generate encrypted password and check it with password.
you can also use [golang bcrypt](https://pkg.go.dev/golang.org/x/crypto/bcrypt) to check them with hashed password from other library like [bcrypt-ruby](https://github.com/bcrypt-ruby/bcrypt-ruby) used by [devise](https://github.com/heartcombo/devise).

## usage

```
$ go run ./cmd/bcryptpw digest 'Passw0rd!'
$2a$10$8nT/9Ln68bKqRF26unM.beTxWKeMjfmhLvhWL9QrwgzBZQGkstNNu
$ go run ./cmd/bcryptpw digest 'Passw0rd!'
$2a$10$3gZusH8.vRVFdxf1jRn6R.2B7gLNTCigS6woxSuHr6STKKTX8Rsem
```

```                                                                                                                                                                        $ go run ./cmd/bcryptpw compare '$2a$10$8nT/9Ln68bKqRF26unM.beTxWKeMjfmhLvhWL9QrwgzBZQGkstNNu' 'Passw0rd!'
OK
$ go run ./cmd/bcryptpw compare '$2a$10$3gZusH8.vRVFdxf1jRn6R.2B7gLNTCigS6woxSuHr6STKKTX8Rsem' 'Passw0rd!'
OK
$ go run ./cmd/bcryptpw compare '$2a$10$3gZusH8.vRVFdxf1jRn6R.2B7gLNTCigS6woxSuHr6STKKTX8Rsem' 'Passw0rd!x'
crypto/bcrypt: hashedPassword is not the hash of the given password
```
