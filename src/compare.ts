import bcrypt from "bcrypt";

if (process.argv.length < 4) {
  console.error("Usage: node digest.js <encrypted_password> <password>");
  process.exit(1);
}

if (bcrypt.compareSync(process.argv[3], process.argv[2])) {
  console.log("OK");
} else {
  console.log("NG");
}
