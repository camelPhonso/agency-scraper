require("dotenv").config()
const { readFileSync } = require("node:fs")
const { join } = require("node:path")
const Database = require("better-sqlite3")

const dbPath =
  process.env.NODE_ENV === "test" ? global.TES_DB_PATH : "statesDB.sql"

const db = new Database(dbPath)
const schemaPath = join("database", "schema.sql")
const schema = readFileSync(schemaPath, "utf-8")
db.exec(schema)

module.exports = db
