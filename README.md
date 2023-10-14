# bcrypt_password

You can generate encrypted password and check it with password.
you can also use [golang bcrypt](https://pkg.go.dev/golang.org/x/crypto/bcrypt) to check them with hashed password from other library like [bcrypt-ruby](https://github.com/bcrypt-ruby/bcrypt-ruby) used by [devise](https://github.com/heartcombo/devise).

## Golang

```
$ go run ./cmd/bcryptpw digest 'Passw0rd!'
$2a$10$8nT/9Ln68bKqRF26unM.beTxWKeMjfmhLvhWL9QrwgzBZQGkstNNu
$ go run ./cmd/bcryptpw digest 'Passw0rd!'
$2a$10$3gZusH8.vRVFdxf1jRn6R.2B7gLNTCigS6woxSuHr6STKKTX8Rsem
```

```
$ go run ./cmd/bcryptpw compare '$2a$10$8nT/9Ln68bKqRF26unM.beTxWKeMjfmhLvhWL9QrwgzBZQGkstNNu' 'Passw0rd!'
OK
$ go run ./cmd/bcryptpw compare '$2a$10$3gZusH8.vRVFdxf1jRn6R.2B7gLNTCigS6woxSuHr6STKKTX8Rsem' 'Passw0rd!'
OK
$ go run ./cmd/bcryptpw compare '$2a$10$3gZusH8.vRVFdxf1jRn6R.2B7gLNTCigS6woxSuHr6STKKTX8Rsem' 'Passw0rd!x'
crypto/bcrypt: hashedPassword is not the hash of the given password
```

## Node.js

```
$ npx ts-node src/digest.ts 'Passw0rd!'
$2b$10$A/8iZRqGTc3xsaOoOUiUsumn7byzGNdEFih7khjUR8oxEh.GvyVv.
$ npx ts-node src/digest.ts 'Passw0rd!'
$2b$10$H/5ewoLvg9DEjevj5pmTyeJ1lk.VLlNfIZgRpTmEujurX3sEpZUxi
```

```
$ npx ts-node src/compare.ts '$2b$10$A/8iZRqGTc3xsaOoOUiUsumn7byzGNdEFih7khjUR8oxEh.GvyVv.' 'Passw0rd!'
OK
$ npx ts-node src/compare.ts '$2b$10$A/8iZRqGTc3xsaOoOUiUsumn7byzGNdEFih7khjUR8oxEh.GvyVv.' 'Passw0rd!x'
NG
$ npx ts-node src/compare.ts '$2b$10$H/5ewoLvg9DEjevj5pmTyeJ1lk.VLlNfIZgRpTmEujurX3sEpZUxi' 'Passw0rd!'
OK
$ npx ts-node src/compare.ts '$2b$10$H/5ewoLvg9DEjevj5pmTyeJ1lk.VLlNfIZgRpTmEujurX3sEpZUxi' 'Passw0rd!x'
NG
```
