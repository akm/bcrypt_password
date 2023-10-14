import bcrypt from "bcrypt";

if (process.argv.length < 3) {
  console.error("Usage: node digest.js <password>");
  process.exit(1);
}

const saltRounds = 10;

const salt = bcrypt.genSaltSync(saltRounds);
const hash = bcrypt.hashSync(process.argv[2], salt);

console.log(hash);
