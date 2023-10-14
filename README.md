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


## Ruby

```
$ ruby digest.rb 'Passw0rd!'                                                                
$2a$12$PvsXSjNe7nADqT5X.hq2AudHWwigzol7hFW3SVi0ihSAyGhUDZhKq
$ ruby digest.rb 'Passw0rd!'
$2a$12$7kXOesONnJXA9XsCbXIT8ulT/VbTeWmltMwOP1Qmjeg3pv2iYQQQ.
```

```
$ ruby compare.rb '$2a$12$PvsXSjNe7nADqT5X.hq2AudHWwigzol7hFW3SVi0ihSAyGhUDZhKq' 'Passw0rd!'
true
$ ruby compare.rb '$2a$12$7kXOesONnJXA9XsCbXIT8ulT/VbTeWmltMwOP1Qmjeg3pv2iYQQQ.' 'Passw0rd!'
true
$ ruby compare.rb '$2a$12$7kXOesONnJXA9XsCbXIT8ulT/VbTeWmltMwOP1Qmjeg3pv2iYQQQ.' 'Passw0rd!x'
false
```


## Test

test.rb checks hashed password by each other.

```
$ ruby test.rb
password:Passw0rd!      digest_by:golang        compare_by:golang       valid_password: true
password:Passw0rd!      digest_by:golang        compare_by:golang       invalid_password: false
password:Passw0rd!      digest_by:golang        compare_by:nodejs       valid_password: true
password:Passw0rd!      digest_by:golang        compare_by:nodejs       invalid_password: false
password:Passw0rd!      digest_by:golang        compare_by:ruby valid_password: true
password:Passw0rd!      digest_by:golang        compare_by:ruby invalid_password: false
password:Passw0rd!      digest_by:nodejs        compare_by:golang       valid_password: true
password:Passw0rd!      digest_by:nodejs        compare_by:golang       invalid_password: false
password:Passw0rd!      digest_by:nodejs        compare_by:nodejs       valid_password: true
password:Passw0rd!      digest_by:nodejs        compare_by:nodejs       invalid_password: false
password:Passw0rd!      digest_by:nodejs        compare_by:ruby valid_password: true
password:Passw0rd!      digest_by:nodejs        compare_by:ruby invalid_password: false
password:Passw0rd!      digest_by:ruby  compare_by:golang       valid_password: true
password:Passw0rd!      digest_by:ruby  compare_by:golang       invalid_password: false
password:Passw0rd!      digest_by:ruby  compare_by:nodejs       valid_password: true
password:Passw0rd!      digest_by:ruby  compare_by:nodejs       invalid_password: false
password:Passw0rd!      digest_by:ruby  compare_by:ruby valid_password: true
password:Passw0rd!      digest_by:ruby  compare_by:ruby invalid_password: false
password:%P@ssw0rd%     digest_by:golang        compare_by:golang       valid_password: true
password:%P@ssw0rd%     digest_by:golang        compare_by:golang       invalid_password: false
password:%P@ssw0rd%     digest_by:golang        compare_by:nodejs       valid_password: true
password:%P@ssw0rd%     digest_by:golang        compare_by:nodejs       invalid_password: false
password:%P@ssw0rd%     digest_by:golang        compare_by:ruby valid_password: true
password:%P@ssw0rd%     digest_by:golang        compare_by:ruby invalid_password: false
password:%P@ssw0rd%     digest_by:nodejs        compare_by:golang       valid_password: true
password:%P@ssw0rd%     digest_by:nodejs        compare_by:golang       invalid_password: false
password:%P@ssw0rd%     digest_by:nodejs        compare_by:nodejs       valid_password: true
password:%P@ssw0rd%     digest_by:nodejs        compare_by:nodejs       invalid_password: false
password:%P@ssw0rd%     digest_by:nodejs        compare_by:ruby valid_password: true
password:%P@ssw0rd%     digest_by:nodejs        compare_by:ruby invalid_password: false
password:%P@ssw0rd%     digest_by:ruby  compare_by:golang       valid_password: true
password:%P@ssw0rd%     digest_by:ruby  compare_by:golang       invalid_password: false
password:%P@ssw0rd%     digest_by:ruby  compare_by:nodejs       valid_password: true
password:%P@ssw0rd%     digest_by:ruby  compare_by:nodejs       invalid_password: false
password:%P@ssw0rd%     digest_by:ruby  compare_by:ruby valid_password: true
password:%P@ssw0rd%     digest_by:ruby  compare_by:ruby invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:golang        compare_by:golang       valid_password: true
password:AiY5jahg9ohx2yei       digest_by:golang        compare_by:golang       invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:golang        compare_by:nodejs       valid_password: true
password:AiY5jahg9ohx2yei       digest_by:golang        compare_by:nodejs       invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:golang        compare_by:ruby valid_password: true
password:AiY5jahg9ohx2yei       digest_by:golang        compare_by:ruby invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:nodejs        compare_by:golang       valid_password: true
password:AiY5jahg9ohx2yei       digest_by:nodejs        compare_by:golang       invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:nodejs        compare_by:nodejs       valid_password: true
password:AiY5jahg9ohx2yei       digest_by:nodejs        compare_by:nodejs       invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:nodejs        compare_by:ruby valid_password: true
password:AiY5jahg9ohx2yei       digest_by:nodejs        compare_by:ruby invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:ruby  compare_by:golang       valid_password: true
password:AiY5jahg9ohx2yei       digest_by:ruby  compare_by:golang       invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:ruby  compare_by:nodejs       valid_password: true
password:AiY5jahg9ohx2yei       digest_by:ruby  compare_by:nodejs       invalid_password: false
password:AiY5jahg9ohx2yei       digest_by:ruby  compare_by:ruby valid_password: true
password:AiY5jahg9ohx2yei       digest_by:ruby  compare_by:ruby invalid_password: false
All OK
```
