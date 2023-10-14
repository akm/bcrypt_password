passwords = %w[Passw0rd! %P@ssw0rd% AiY5jahg9ohx2yei]

class Lang 
    attr_reader :name
    def initialize(name)
        @name = name
    end
    def execute(cmd)
        r = `#{cmd}`.strip
        # puts "#{cmd} => #{r}"
        r
    end
end

golang = Lang.new('golang')
def golang.digest(password)
    execute("go run ./cmd/bcryptpw digest '#{password}'")
end
def golang.compare(hashed_password, password)
    execute("go run ./cmd/bcryptpw compare '#{hashed_password}' '#{password}'") == 'OK'
end

nodejs = Lang.new('nodejs')
def nodejs.digest(password)
    execute("npx ts-node src/digest.ts '#{password}'")
end
def nodejs.compare(hashed_password, password)
    execute("npx ts-node src/compare.ts '#{hashed_password}' '#{password}'") == 'OK'
end

ruby = Lang.new('ruby')
def ruby.digest(password)
    execute("ruby digest.rb '#{password}'")
end
def ruby.compare(hashed_password, password)
    execute("ruby compare.rb '#{hashed_password}' '#{password}'") == 'true'
end

langs = [golang, nodejs, ruby]

ng_patterns = []

passwords.each do |password|
    langs.each do |digest_lang|
        hashed_password = digest_lang.digest(password)

        langs.each do |compare_lang|
            ok = compare_lang.compare(hashed_password, password)
            unless ok
                ng_patterns << [password, digest_lang.name, compare_lang.name, "valid_password"]
            end
            puts "password:#{password}\tdigest_by:#{digest_lang.name}\tcompare_by:#{compare_lang.name}\tvalid_password: #{ok}"
            
            
            ok = compare_lang.compare(hashed_password, password+"invalid")
            if ok
                ng_patterns << [password, digest_lang.name, compare_lang.name, "invalid_password"]
            end
            puts "password:#{password}\tdigest_by:#{digest_lang.name}\tcompare_by:#{compare_lang.name}\tinvalid_password: #{ok}"
        end

    end
end

if ng_patterns.empty?
    puts "All OK"
    exit(0)
else
    puts "NG patterns:"
    ng_patterns.each do |ng|
        puts ng.join("\t")
    end
    exit(1)
end

